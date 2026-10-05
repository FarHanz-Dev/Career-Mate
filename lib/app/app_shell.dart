import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../features/auth/controller/auth_controller.dart';
import '../features/inbox/controller/inbox_controller.dart';
import '../features/inbox/models/inbox_label.dart';
import '../features/insights/controller/match_controller.dart';
import '../ui/organisms/bottom_tabs.dart';
import '../ui/organisms/label_drawer.dart';
import 'theme/cm_theme.dart';

/// Frame for the two tab screens (Inbox, CV Bank): the label drawer and the
/// bottom tabs. Insights is a tab too, but it opens the match breakdown as a
/// full screen, so the tabs are hidden there.
class AppShell extends ConsumerWidget {
  const AppShell({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  static const inboxBranch = 0;
  static const cvBankBranch = 1;
  static const insightsTab = 2;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: context.cm.colors.bg,
      drawer: _ShellDrawer(navigationShell: navigationShell),
      drawerScrimColor: context.cm.colors.scrimDrawer,
      // The edge swipe would fight with swipe-right on a row, so the hamburger is the only way in.
      drawerEnableOpenDragGesture: false,
      body: navigationShell,
      bottomNavigationBar: BottomTabs(
        selectedIndex: navigationShell.currentIndex,
        onSelected: (i) {
          if (i == insightsTab) {
            final id = ref.read(insightsTargetProvider);
            if (id != null) context.push('/match/$id');
            return;
          }
          navigationShell.goBranch(i, initialLocation: i == navigationShell.currentIndex);
        },
      ),
    );
  }
}

class _ShellDrawer extends ConsumerWidget {
  const _ShellDrawer({required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counts = ref.watch(labelCountsProvider);
    final selected = ref.watch(inboxControllerProvider.select((s) => s.label));
    final email = ref.watch(authControllerProvider).value?.email ?? '';
    final shell = navigationShell;

    void close() => Scaffold.of(context).closeDrawer();

    return Drawer(
      width: LabelDrawer.width,
      backgroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      shape: const RoundedRectangleBorder(),
      clipBehavior: Clip.none,
      child: LabelDrawer(
        email: email,
        items: [
          for (final l in InboxLabel.values) LabelDrawerItem(name: l.title, count: counts[l] ?? 0),
        ],
        selectedName: selected.title,
        onSelectLabel: (name) {
          ref.read(inboxControllerProvider.notifier).setLabel(
            InboxLabel.values.firstWhere((l) => l.title == name),
          );
          close();
          shell.goBranch(AppShell.inboxBranch);
        },
        onProfile: () {
          close();
          context.push('/profile');
        },
        onCvBank: () {
          close();
          shell.goBranch(AppShell.cvBankBranch);
        },
        onSignOut: () {
          close();
          ref.read(authControllerProvider.notifier).signOut();
        },
      ),
    );
  }
}
