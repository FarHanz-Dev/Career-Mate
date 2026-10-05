import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../app/theme/cm_theme.dart';
import '../../../core/utils/date_format.dart';
import '../../../ui/atoms/cm_button.dart';
import '../../../ui/organisms/dimension_bar.dart';
import '../../../ui/organisms/evidence_list.dart';
import '../../../ui/templates/detail_scaffold.dart';
import '../../cv_bank/controller/cv_bank_controller.dart';
import '../controller/match_controller.dart';
import '../models/match_result.dart';

/// Match breakdown for one application, pushed from the thread or after adding
/// a job. The Insights tab shows the same [MatchView] inside the tab shell.
class MatchPage extends StatelessWidget {
  const MatchPage({super.key, required this.applicationId});

  final String applicationId;

  @override
  Widget build(BuildContext context) {
    return DetailScaffold(
      title: 'Match breakdown',
      onBack: () => context.pop(),
      body: MatchView(applicationId: applicationId),
    );
  }
}

/// The score, four dimensions, and the evidence behind it.
class MatchView extends ConsumerWidget {
  const MatchView({super.key, required this.applicationId});

  final String applicationId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cm = context.cm;
    final match = ref.watch(matchResultProvider(applicationId));

    return match.when(
      loading: () => const SizedBox.shrink(),
      error: (_, _) => Padding(
        padding: const EdgeInsets.all(16),
        child: Text('Could not load the match.', style: cm.body(color: cm.colors.neutral700)),
      ),
      data: (m) => _MatchBody(match: m),
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
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 40),
      children: [
        Text(
          '${match.company} · ${match.role.replaceFirst('Senior', 'Sr')}',
          style: cm.body(size: 13, color: c.neutral700),
        ),
        const SizedBox(height: 6),
        Row(
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          spacing: 8,
          children: [
            Text(
              '${match.score}',
              style: cm.heading(size: 72, color: c.accent, height: 1, tracking: -0.04),
            ),
            Text('match', style: cm.body(size: 15, color: c.neutral700)),
          ],
        ),
        const SizedBox(height: 10),
        Text(match.summary, style: cm.body(size: 14, color: c.neutral800, height: 1.5)),
        const SizedBox(height: 32),
        Text('How it matches', style: cm.heading(size: 16)),
        const SizedBox(height: 18),
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          spacing: 20,
          children: [
            for (final d in match.dimensions)
              DimensionBar(name: d.name, percent: d.pct, note: d.note),
          ],
        ),
        const SizedBox(height: 36),
        Text('Evidence', style: cm.heading(size: 16)),
        const SizedBox(height: 18),
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          spacing: 18,
          children: [
            for (final e in match.evidence) EvidenceItem(need: e.need, proof: e.proof, met: e.met),
          ],
        ),
        const SizedBox(height: 32),
        if (match.gapCount > 0 && primaryCv != null) ...[
          CmButton(
            label: 'Fix the ${plural(match.gapCount, 'gap')} in my CV',
            expand: true,
            minHeight: 48,
            fontSize: 15,
            alignment: MainAxisAlignment.center,
            onPressed: () => context.push('/improve/${primaryCv.id}'),
          ),
          const SizedBox(height: 4),
        ],
        CmButton(
          label: 'Draft the mail anyway',
          variant: CmButtonVariant.ghost,
          expand: true,
          minHeight: 44,
          alignment: MainAxisAlignment.center,
          onPressed: () => context.push('/compose?application=${match.applicationId}'),
        ),
      ],
    );
  }
}
