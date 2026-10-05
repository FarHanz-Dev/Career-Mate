import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../app/theme/cm_theme.dart';
import '../../../app/toast/toast_controller.dart';
import '../../../ui/atoms/cm_button.dart';
import '../../../ui/atoms/cm_tag.dart';
import '../../../ui/organisms/suggestion_card.dart';
import '../../../ui/templates/detail_scaffold.dart';
import '../../cv_bank/controller/cv_bank_controller.dart';
import '../controller/improve_controller.dart';
import '../models/suggestion.dart';

/// One card per suggested CV edit. Nothing is written until the user approves it.
class ImprovePage extends ConsumerWidget {
  const ImprovePage({super.key, required this.cvId});

  final String cvId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cm = context.cm;
    final c = cm.colors;
    final suggestions = ref.watch(improveControllerProvider(cvId));
    final cv = ref.watch(cvProvider(cvId));
    final improve = ref.read(improveControllerProvider(cvId).notifier);
    final list = suggestions.value ?? const <Suggestion>[];
    final approved = list.where((s) => s.status == SuggestionStatus.approved).length;

    return DetailScaffold(
      title: 'Suggested edits',
      onBack: () => context.pop(),
      actions: [
        Text(
          '$approved / ${list.length} APPROVED',
          style: cm.label(size: 11, tracking: 0.08),
        ),
      ],
      bottom: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(color: c.bg, border: Border(top: cm.rule)),
        child: CmButton(
          label: 'Save as ${cv?.nextVersionName ?? 'a new version'}',
          expand: true,
          minHeight: 48,
          fontSize: 15,
          onPressed: cv == null
              ? null
              : () async {
                  final saved = await ref.read(cvBankControllerProvider.notifier).saveNextVersion(cv.id);
                  if (saved == null || !context.mounted) return;
                  ref.read(toastProvider.notifier).show('Saved ${saved.name}');
                  context.go('/cv-bank');
                },
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(color: c.surface, border: Border(bottom: cm.hairline)),
            child: Text(
              'Nothing is written to your CV until you approve it. Approving rewrites only the line shown.',
              style: cm.body(size: 12, color: c.neutral700, height: 1.5),
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.only(bottom: 16),
              children: [
                for (final s in list)
                  SuggestionCard(
                    key: ValueKey(s.id),
                    tag: switch (s.status) {
                      SuggestionStatus.approved => 'APPROVED',
                      SuggestionStatus.skipped => 'SKIPPED',
                      SuggestionStatus.open => s.tag.label,
                    },
                    tagVariant: s.status == SuggestionStatus.approved
                        ? CmTagVariant.accent
                        : (s.tag == SuggestionTag.trim ? CmTagVariant.neutral : CmTagVariant.outline),
                    where: s.where,
                    lift: s.lift,
                    before: s.before,
                    after: s.after,
                    approveLabel: s.status == SuggestionStatus.approved ? 'Approved' : 'Approve',
                    onApprove: () => improve.approve(s.id),
                    onSkip: () => improve.skip(s.id),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
