import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../app/theme/cm_theme.dart';
import '../../../app/toast/toast_controller.dart';
import '../../../ui/atoms/cm_button.dart';
import '../../../ui/atoms/cm_divider.dart';
import '../../../ui/atoms/cm_label.dart';
import '../../../ui/atoms/cm_radio.dart';
import '../../../ui/atoms/cm_shimmer.dart';
import '../../../ui/atoms/cm_tag.dart';
import '../../../ui/molecules/cm_dashed_box.dart';
import '../../../ui/molecules/cm_labeled_field.dart';
import '../../../ui/templates/detail_scaffold.dart';
import '../controller/add_job_controller.dart';
import '../models/parsed_posting.dart';

/// Three steps: capture (screenshot or pasted text), reading (shimmer), confirm.
class AddJobPage extends ConsumerWidget {
  const AddJobPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final step = ref.watch(addJobControllerProvider.select((s) => s.step));
    final cm = context.cm;

    return DetailScaffold(
      title: 'Add job',
      onBack: () => context.pop(),
      actions: [Text(step.label, style: cm.label(size: 11, tracking: 0.08))],
      body: switch (step) {
        AddJobStep.capture => const _Capture(),
        AddJobStep.reading => const _Reading(),
        AddJobStep.confirm => const _Confirm(),
      },
    );
  }
}

class _Capture extends ConsumerWidget {
  const _Capture();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cm = context.cm;
    final c = cm.colors;
    final job = ref.read(addJobControllerProvider.notifier);
    final text = ref.watch(addJobControllerProvider.select((s) => s.text));

    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 18, 16, 40),
      children: [
        Text(
          'Drop the LinkedIn or WhatsApp screenshot. The reader pulls out company, role, '
          'requirements and deadline. Or type the posting in yourself.',
          style: cm.body(size: 13, color: c.neutral700, height: 1.5),
        ),
        const SizedBox(height: 16),
        // TODO(upload): open image_picker (gallery, camera) and upload the compressed screenshot.
        CmDashedBox(
          label: 'Upload posting screenshot',
          onTap: job.read,
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 34),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 10,
            children: [
              Icon(LucideIcons.camera, size: 30, color: c.accent),
              // The upload target is an HTML button, so its text uses the natural line height.
              Text('Upload posting screenshot', style: cm.heading(size: 17, height: CmTheme.natural)),
              Text(
                'PNG or JPG · camera roll, camera, or paste',
                style: cm.body(size: 12, color: c.neutral700, height: CmTheme.natural),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Row(
          spacing: 10,
          children: [
            const Expanded(child: CmDivider()),
            Text('OR', style: cm.label(size: 11)),
            const Expanded(child: CmDivider()),
          ],
        ),
        const SizedBox(height: 16),
        CmLabeledField(
          label: 'Paste the job text',
          hint: 'Paste the posting here',
          value: text,
          onChanged: job.setText,
          minHeight: 130,
          maxLines: null,
          fontSize: 13,
          keyboardType: TextInputType.multiline,
        ),
        const SizedBox(height: 16),
        CmButton(label: 'Generate', expand: true, minHeight: 46, fontSize: 15, onPressed: job.read),
      ],
    );
  }
}

class _Reading extends StatelessWidget {
  const _Reading();

  @override
  Widget build(BuildContext context) {
    final cm = context.cm;
    final c = cm.colors;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 22),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        spacing: 18,
        children: [
          Row(
            spacing: 10,
            children: [
              CmShimmer(
                period: const Duration(seconds: 1),
                child: SizedBox.square(dimension: 10, child: ColoredBox(color: c.accent)),
              ),
              Text('Reading the screenshot', style: cm.heading(size: 17)),
            ],
          ),
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(color: c.surface, border: Border.fromBorderSide(cm.hairline)),
            child: const Column(
              spacing: 9,
              children: [
                CmShimmerBar(widthFactor: 0.62, height: 13),
                CmShimmerBar(widthFactor: 0.88, height: 10, delay: Duration(milliseconds: 150)),
                CmShimmerBar(widthFactor: 0.74, height: 10, delay: Duration(milliseconds: 300)),
                CmShimmerBar(widthFactor: 0.91, height: 10, delay: Duration(milliseconds: 450)),
                CmShimmerBar(widthFactor: 0.46, height: 10, delay: Duration(milliseconds: 600)),
              ],
            ),
          ),
          Text(
            'Finding company · role · seniority · requirements · deadline',
            style: cm.body(size: 12, color: c.neutral700, height: 1.5),
          ),
        ],
      ),
    );
  }
}

class _Confirm extends ConsumerWidget {
  const _Confirm();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cm = context.cm;
    final c = cm.colors;
    final state = ref.watch(addJobControllerProvider);
    final job = ref.read(addJobControllerProvider.notifier);
    final p = state.posting;
    if (p == null) return const SizedBox.shrink();

    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 40),
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 12,
          children: [
            Container(
              width: 76,
              height: 100,
              alignment: Alignment.center,
              decoration: BoxDecoration(color: c.surface, border: Border.fromBorderSide(cm.hairline)),
              child: Text(
                'SCREEN\nSHOT',
                textAlign: TextAlign.center,
                style: cm.body(size: 10, color: c.neutral700, letterSpacing: 0.6, height: 1.3),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CmLabel('Read with ${p.confidence}% confidence', size: 10, color: c.accent700),
                  const SizedBox(height: 6),
                  Text(
                    'Check the fields below. Anything you correct here also corrects the mail draft.',
                    style: cm.body(size: 12, color: c.neutral700, height: 1.5),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 14),
        const Padding(padding: EdgeInsets.symmetric(vertical: 2), child: CmDivider(thick: true)),
        const SizedBox(height: 14),
        CmLabeledField(label: 'Company', value: p.company, readOnly: true),
        const SizedBox(height: 14),
        CmLabeledField(label: 'Role / job desk', value: p.role, readOnly: true),
        const SizedBox(height: 14),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 10,
          children: [
            Expanded(child: CmLabeledField(label: 'Location', value: p.location, readOnly: true)),
            Expanded(child: CmLabeledField(label: 'Deadline', value: p.deadline, readOnly: true)),
          ],
        ),
        const SizedBox(height: 14),
        Text('Requirements it picked up', style: cm.body(size: 12, color: c.neutral700)),
        const SizedBox(height: 8),
        Wrap(
          spacing: 6,
          runSpacing: 6,
          children: [
            for (final PostingRequirement r in p.requirements)
              CmTag(r.label, variant: r.core ? CmTagVariant.accent : CmTagVariant.neutral),
          ],
        ),
        const SizedBox(height: 14),
        Container(
          padding: const EdgeInsets.only(top: 14),
          decoration: BoxDecoration(border: Border(top: cm.hairline)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 10,
            children: [
              Text('Use which CV as context?', style: cm.heading(size: 13)),
              for (var i = 0; i < p.cvMatches.length; i++)
                CmRadioOption(
                  label: '${p.cvMatches[i].cvFileName}, match ${p.cvMatches[i].score}',
                  selected: state.cvChoice == i,
                  onTap: () => job.selectCv(i),
                ),
              CmButton(
                label: 'Open CV Bank →',
                variant: CmButtonVariant.ghost,
                onPressed: () => context.go('/cv-bank'),
              ),
            ],
          ),
        ),
        const SizedBox(height: 22),
        CmButton(
          label: 'Generate the mail',
          expand: true,
          minHeight: 46,
          fontSize: 15,
          onPressed: () async {
            final id = await job.generate();
            if (id == null || !context.mounted) return;
            ref.read(toastProvider.notifier).show('Draft written from the screenshot');
            context.push('/compose?application=$id');
          },
        ),
        const SizedBox(height: 14),
        CmButton(
          label: 'See match breakdown first',
          variant: CmButtonVariant.secondary,
          expand: true,
          minHeight: 44,
          onPressed: () async {
            final id = await job.generate();
            if (id == null || !context.mounted) return;
            context.push('/match/$id');
          },
        ),
      ],
    );
  }
}
