import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../app/theme/cm_theme.dart';
import '../../../core/utils/date_format.dart';
import '../../../ui/atoms/cm_button.dart';
import '../../../ui/atoms/cm_label.dart';
import '../../../ui/atoms/cm_tag.dart';
import '../../../ui/molecules/cm_chip_row.dart';
import '../../../ui/molecules/cm_search_bar.dart';
import '../../../ui/organisms/application_row.dart';
import '../../../ui/organisms/fab_menu.dart';
import '../../../ui/organisms/selection_bar.dart';
import '../../../ui/templates/tab_scaffold.dart';
import '../../insights/controller/match_controller.dart';
import '../controller/applications_controller.dart';
import '../controller/inbox_controller.dart';
import '../models/application.dart';
import '../models/inbox_label.dart';

/// Chips scroll under the search bar. The last one is a time filter, not a label.
const _chipLabels = [InboxLabel.all, InboxLabel.drafts, InboxLabel.replied, InboxLabel.noResponse];
const _recentChip = 'Last 30 days';

CmTagVariant _statusVariant(AppStatus s) => switch (s) {
  AppStatus.replied => CmTagVariant.accent,
  AppStatus.draft => CmTagVariant.outline,
  _ => CmTagVariant.neutral,
};

class InboxPage extends ConsumerStatefulWidget {
  const InboxPage({super.key});

  @override
  ConsumerState<InboxPage> createState() => _InboxPageState();
}

class _InboxPageState extends ConsumerState<InboxPage> {
  final _fabKey = GlobalKey();

  void _openFabMenu() => showFabMenu(
    context,
    anchor: _fabKey,
    items: [
      FabMenuItem(
        icon: LucideIcons.camera,
        label: 'Job from screenshot',
        onTap: () => context.push('/add-job'),
      ),
      FabMenuItem(
        icon: LucideIcons.penLine,
        label: 'Write mail manually',
        onTap: () => context.push('/compose'),
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return TabScaffold(
      header: const _InboxHeader(),
      body: const _InboxList(),
      floating: [
        Positioned(
          right: 14,
          bottom: 9,
          child: CmFab(key: _fabKey, label: 'New application', onPressed: _openFabMenu),
        ),
      ],
    );
  }
}

class _InboxHeader extends ConsumerWidget {
  const _InboxHeader();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final inbox = ref.read(inboxControllerProvider.notifier);
    final selectedCount = ref.watch(inboxControllerProvider.select((s) => s.selectedIds.length));

    if (selectedCount > 0) {
      return SelectionBar(
        count: selectedCount,
        onClose: inbox.clearSelection,
        onArchive: inbox.archiveSelected,
        onMarkReplied: inbox.markSelectedReplied,
        onMore: inbox.clearSelection,
      );
    }

    final label = ref.watch(inboxControllerProvider.select((s) => s.label));
    final recentOnly = ref.watch(inboxControllerProvider.select((s) => s.recentOnly));
    final query = ref.watch(inboxControllerProvider.select((s) => s.query));

    return TabHeader(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CmSearchBar(
            hint: 'Search company, role, CV',
            value: query,
            onChanged: inbox.setQuery,
            onMenu: () => Scaffold.of(context).openDrawer(),
            onAccount: () => context.push('/profile'),
          ),
          const SizedBox(height: 10),
          CmChipRow(
            labels: [for (final l in _chipLabels) l.title, _recentChip],
            isSelected: (i) => i < _chipLabels.length ? _chipLabels[i] == label : recentOnly,
            onTap: (i) => i < _chipLabels.length ? inbox.setLabel(_chipLabels[i]) : inbox.toggleRecent(),
          ),
        ],
      ),
    );
  }
}

class _InboxList extends ConsumerWidget {
  const _InboxList();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cm = context.cm;
    final visible = ref.watch(visibleApplicationsProvider);
    final label = ref.watch(inboxControllerProvider.select((s) => s.label));

    return visible.when(
      loading: () => const SizedBox.shrink(),
      error: (_, _) => Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 12,
          children: [
            Text('Could not load applications.', style: cm.body(color: cm.colors.neutral700)),
            CmButton(
              label: 'Try again',
              variant: CmButtonVariant.secondary,
              onPressed: () => ref.invalidate(applicationsControllerProvider),
            ),
          ],
        ),
      ),
      data: (apps) => CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: _ListHeader(label: label, apps: apps)),
          SliverList.builder(
            itemCount: apps.length,
            findChildIndexCallback: (key) {
              final id = (key as ValueKey<String>).value;
              final i = apps.indexWhere((a) => a.id == id);
              return i < 0 ? null : i;
            },
            itemBuilder: (context, i) => _InboxRow(key: ValueKey(apps[i].id), application: apps[i]),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 22, 16, 90),
              child: Text(
                apps.isEmpty
                    ? 'No applications here.'
                    : 'Swipe a row sideways to archive or mark replied. Tap the square monogram to multi-select.',
                style: cm.body(size: 11, color: cm.colors.neutral700, height: 1.5),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ListHeader extends StatelessWidget {
  const _ListHeader({required this.label, required this.apps});

  final InboxLabel label;
  final List<Application> apps;

  @override
  Widget build(BuildContext context) {
    final cm = context.cm;
    final dates = apps.map((a) => a.date);
    final range = apps.isEmpty
        ? ''
        : '${shortDate(dates.reduce((a, b) => a.isBefore(b) ? a : b))} to '
              '${shortDate(dates.reduce((a, b) => a.isAfter(b) ? a : b))}';

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.baseline,
        textBaseline: TextBaseline.alphabetic,
        children: [
          CmLabel('${label.title}, ${plural(apps.length, 'application')}'),
          const Spacer(),
          Text(range, style: cm.body(size: 11, color: cm.colors.accent700)),
        ],
      ),
    );
  }
}

/// One row. Watches only its own selection flag, so selecting a row rebuilds
/// that row and nothing else.
class _InboxRow extends ConsumerWidget {
  const _InboxRow({super.key, required this.application});

  final Application application;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final a = application;
    final inbox = ref.read(inboxControllerProvider.notifier);
    final selected = ref.watch(inboxControllerProvider.select((s) => s.selectedIds.contains(a.id)));
    final canArchive = ref.watch(inboxControllerProvider.select((s) => s.label != InboxLabel.archived));

    return ApplicationRow(
      id: a.id,
      company: a.company,
      role: a.role,
      cvName: a.cvName,
      dateLabel: shortDate(a.date),
      statusLabel: a.status.label,
      statusVariant: _statusVariant(a.status),
      score: a.score,
      unread: a.unread,
      selected: selected,
      snippet: a.snippet,
      onOpen: () {
        if (ref.read(inboxControllerProvider).selectMode) {
          inbox.toggleSelect(a.id);
          return;
        }
        inbox.open(a.id);
        ref.read(insightsFocusProvider.notifier).focus(a.id);
        context.push('/thread/${a.id}');
      },
      onSelect: () => inbox.toggleSelect(a.id),
      onMarkReplied: () => inbox.markReplied(a.id),
      onArchive: canArchive ? () => inbox.archive(a.id) : null,
    );
  }
}
