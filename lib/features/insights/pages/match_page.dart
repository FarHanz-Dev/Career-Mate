import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../app/theme/cm_theme.dart';
import '../../../core/utils/date_format.dart';
import '../../../ui/atoms/cm_button.dart';
import '../../../ui/atoms/cm_label.dart';
import '../../../ui/organisms/dimension_bar.dart';
import '../../../ui/organisms/evidence_list.dart';
import '../../../ui/templates/detail_scaffold.dart';
import '../../cv_bank/controller/cv_bank_controller.dart';
import '../controller/match_controller.dart';
import '../models/match_result.dart';

/// Match breakdown for one application: the score, four dimensions, and the
/// evidence behind it.
class MatchPage extends ConsumerWidget {
  const MatchPage({super.key, required this.applicationId});

  final String applicationId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cm = context.cm;
    final match = ref.watch(matchResultProvider(applicationId));

    return DetailScaffold(
      title: 'Match breakdown',
      onBack: () => context.pop(),
      body: match.when(
        loading: () => const SizedBox.shrink(),
        error: (_, _) => Padding(
          padding: const EdgeInsets.all(16),
          child: Text('Could not load the match.', style: cm.body(color: cm.colors.neutral700)),
        ),
        data: (m) => _MatchBody(match: m),
      ),
    );
  }
}

class _MatchBody extends ConsumerWidget {
  const _MatchBody({required this.match});

  final MatchResult match;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cm = context.cm;
    final c = cm.colors;
    final primaryCv = ref.watch(primaryCvProvider);

    return ListView(
      padding: EdgeInsets.zero,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
          decoration: BoxDecoration(border: Border(bottom: cm.rule)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            spacing: 16,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${match.score}',
                    style: cm.heading(size: 76, color: c.accent, height: 0.82, tracking: -0.05),
                  ),
                  const SizedBox(height: 6),
                  CmLabel('${match.company} · ${match.role.replaceFirst('Senior', 'Sr')}'),
                ],
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 4),
                  child: Text(
                    match.summary,
                    style: cm.body(size: 12, color: c.neutral700, height: 1.5),
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              for (final d in match.dimensions)
                DimensionBar(name: d.name, percent: d.pct, note: d.note),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 4, 16, 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text('EVIDENCE', style: cm.heading(size: 13, tracking: 0.06)),
              const SizedBox(height: 12),
              for (final e in match.evidence) EvidenceItem(need: e.need, proof: e.proof, met: e.met),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 4, 16, 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            spacing: 8,
            children: [
              if (match.gapCount > 0 && primaryCv != null)
                CmButton(
                  label: 'Fix the ${plural(match.gapCount, 'gap')} in my CV',
                  expand: true,
                  minHeight: 46,
                  fontSize: 15,
                  onPressed: () => context.push('/improve/${primaryCv.id}'),
                ),
              CmButton(
                label: 'Draft the mail anyway',
                variant: CmButtonVariant.secondary,
                expand: true,
                minHeight: 44,
                onPressed: () => context.push('/compose?application=${match.applicationId}'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
