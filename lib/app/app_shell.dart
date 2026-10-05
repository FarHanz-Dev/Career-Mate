import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../features/auth/controller/auth_controller.dart';
import '../features/inbox/controller/inbox_controller.dart';
import '../features/inbox/models/inbox_label.dart';
import '../ui/organisms/bottom_tabs.dart';
import '../ui/organisms/label_drawer.dart';
import 'theme/cm_theme.dart';

/// Frame for the three tab screens (Inbox, CV Bank, Insights): the label
/// drawer and the bottom tabs.
class AppShell extends StatelessWidget {
  const AppShell({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  static const inboxBranch = 0;
  static const cvBankBranch = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.cm.colors.bg,
      drawer: _ShellDrawer(navigationShell: navigationShell),
      drawerScrimColor: context.cm.colors.scrimDrawer,
      // The edge swipe would fight with swipe-right on a row, so the hamburger is the only way in.
      drawerEnableOpenDragGesture: false,
      body: navigationShell,
      bottomNavigationBar: BottomTabs(
        selectedIndex: navigationShell.currentIndex,
        onSelected: (i) => _switchTab(navigationShell, i),
      ),
    );
  }
}

/// Tabs swap with no animation, so a light tick confirms the switch. Tapping
/// the tab you are already on resets it and stays silent.
void _switchTab(StatefulNavigationShell shell, int index) {
  final same = index == shell.currentIndex;
  if (!same) HapticFeedback.selectionClick();
  shell.goBranch(index, initialLocation: same);
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
          _switchTab(shell, AppShell.inboxBranch);
        },
        onProfile: () {
          close();
          context.push('/profile');
        },
        onCvBank: () {
          close();
          _switchTab(shell, AppShell.cvBankBranch);
        },
        onSignOut: () {
          close();
          ref.read(authControllerProvider.notifier).signOut();
        },
      ),
    );
  }
}
