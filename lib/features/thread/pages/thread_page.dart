import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../app/theme/cm_theme.dart';
import '../../../ui/atoms/cm_button.dart';
import '../../../ui/atoms/cm_icon_button.dart';
import '../../../ui/atoms/cm_label.dart';
import '../../../ui/atoms/cm_tag.dart';
import '../../../ui/molecules/cm_match_pill.dart';
import '../../../ui/organisms/reply_status_toggle.dart';
import '../../../ui/organisms/thread_message.dart';
import '../../../ui/templates/detail_scaffold.dart';
import '../../inbox/controller/applications_controller.dart';
import '../../inbox/controller/inbox_controller.dart';
import '../../inbox/models/application.dart';
import '../controller/thread_controller.dart';

/// One application: posting card, the reply-status toggle, and the messages
/// (AI draft, sent). The thread ends at the sent mail.
class ThreadPage extends ConsumerWidget {
  const ThreadPage({super.key, required this.applicationId});

  final String applicationId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final app = ref.watch(applicationProvider(applicationId));
    final cm = context.cm;

    if (app == null) {
      return DetailScaffold(
        title: 'Application',
        onBack: () => context.pop(),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Text('This application is no longer here.', style: cm.body(color: cm.colors.neutral700)),
        ),
      );
    }

    final openMessage = ref.watch(threadControllerProvider(applicationId));
    final thread = ref.read(threadControllerProvider(applicationId).notifier);
    final messages = ref.watch(threadMessagesProvider(applicationId));

    void openMatch() => context.push('/match/$applicationId');

    return DetailScaffold(
      title: app.company,
      subtitle: app.role,
      titleSize: 15,
      gap: 6,
      onBack: () => context.pop(),
      actions: [
        CmIconButton(icon: LucideIcons.chartNoAxesColumn, label: 'Match', iconSize: 19, onPressed: openMatch),
        CmIconButton(
          icon: LucideIcons.archive,
          label: 'Archive',
          iconSize: 19,
          onPressed: () {
            ref.read(inboxControllerProvider.notifier).archive(applicationId);
            context.pop();
          },
        ),
      ],
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          _PostingCard(app: app, onMatch: openMatch),
          ReplyStatusToggle(
            selected: switch (app.status) {
              AppStatus.noResponse => 0,
              AppStatus.replied => 1,
              _ => null,
            },
            onChanged: (i) => thread.setReplied(i == 1),
          ),
          for (final m in messages)
            ThreadMessage(
              key: ValueKey(m.id),
              from: m.from,
              kind: m.kind.name.toUpperCase(),
              kindVariant: m.kind == ThreadMessageKind.draft ? CmTagVariant.outline : CmTagVariant.neutral,
              date: m.date,
              body: m.body,
              expanded: openMessage == m.id,
              onToggle: () => thread.toggle(m.id),
            ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 18, 16, 40),
            child: CmButton(
              label: 'Write a follow-up mail',
              variant: CmButtonVariant.secondary,
              expand: true,
              minHeight: 44,
              onPressed: () => context.push('/compose?application=$applicationId'),
            ),
          ),
        ],
      ),
    );
  }
}

class _PostingCard extends StatelessWidget {
  const _PostingCard({required this.app, required this.onMatch});

  final Application app;
  final VoidCallback onMatch;

  @override
  Widget build(BuildContext context) {
    final cm = context.cm;
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: cm.colors.surface, border: Border(bottom: cm.rule)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CmLabel('Job posting · read from screenshot', size: 10, color: cm.colors.accent700),
          const SizedBox(height: 6),
          Text(app.role, style: cm.heading(size: 19, height: 1.15)),
          const SizedBox(height: 10),
          Wrap(
            spacing: 6,
            runSpacing: 6,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              CmTag(app.location),
              CmTag(app.level),
              CmMatchPill(label: 'Match ${app.score}', onTap: onMatch),
            ],
          ),
        ],
      ),
    );
  }
}
