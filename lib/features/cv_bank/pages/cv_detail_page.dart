import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../app/theme/cm_theme.dart';
import '../../../app/toast/toast_controller.dart';
import '../../../core/utils/date_format.dart';
import '../../../ui/atoms/cm_button.dart';
import '../../../ui/atoms/cm_label.dart';
import '../../../ui/atoms/cm_radio.dart';
import '../../../ui/atoms/cm_tag.dart';
import '../../../ui/organisms/cv_preview.dart';
import '../../../ui/templates/detail_scaffold.dart';
import '../controller/cv_bank_controller.dart';
import '../models/cv_file.dart';

/// Skills shown highlighted. The reader orders them by weight, so the top four lead.
const _highlightedSkills = 4;

class CvDetailPage extends ConsumerWidget {
  const CvDetailPage({super.key, required this.cvId});

  final String cvId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cm = context.cm;
    final c = cm.colors;
    final cv = ref.watch(cvProvider(cvId));

    if (cv == null) {
      return DetailScaffold(
        title: 'CV',
        onBack: () => context.pop(),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Text('This CV is no longer here.', style: cm.body(color: c.neutral700)),
        ),
      );
    }

    final bank = ref.read(cvBankControllerProvider.notifier);
    final hidden = cv.skillsCount - cv.skills.length;

    return DetailScaffold(
      title: cv.name,
      subtitle: 'Added ${longDate(cv.addedAt)} · ${plural(cv.pages, 'page')}',
      titleSize: 15,
      onBack: () => context.pop(),
      actions: [
        CmButton(
          label: 'Save',
          onPressed: () {
            ref.read(toastProvider.notifier).show('Saved');
            context.pop();
          },
        ),
      ],
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(border: Border(bottom: cm.rule)),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 14,
              children: [
                const CvPreview(),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 10,
                    children: [
                      CmLabel('Read from the file', size: 10, color: c.accent700),
                      Text(
                        '${cv.rolesCount} roles, ${cv.skillsCount} skills and ${cv.certsCount} '
                        'certifications extracted. Text layer was clean, so nothing needed guessing.',
                        style: cm.body(size: 13, height: 1.5),
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 12),
                        decoration: BoxDecoration(border: Border(top: cm.hairline)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          spacing: 9,
                          children: [
                            const CmLabel('Involve in AI context', tracking: 0.06),
                            CmRadioOption(
                              label: 'Yes, use this CV',
                              selected: cv.inContext,
                              onTap: () => bank.setInContext(cv.id, true),
                            ),
                            CmRadioOption(
                              label: 'No, keep it out',
                              selected: !cv.inContext,
                              onTap: () => bank.setInContext(cv.id, false),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(border: Border(bottom: cm.hairline)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _SectionTitle('Skills'),
                const SizedBox(height: 10),
                Wrap(
                  spacing: 6,
                  runSpacing: 6,
                  children: [
                    for (var i = 0; i < cv.skills.length; i++)
                      CmTag(
                        cv.skills[i],
                        variant: i < _highlightedSkills ? CmTagVariant.accent : CmTagVariant.neutral,
                      ),
                    if (hidden > 0) CmTag('+$hidden more', variant: CmTagVariant.outline),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _SectionTitle('Experience'),
                const SizedBox(height: 12),
                for (final e in cv.experience) _ExperienceRow(e),
                const SizedBox(height: 8),
                CmButton(
                  label: 'Improve this CV with AI',
                  variant: CmButtonVariant.secondary,
                  expand: true,
                  minHeight: 44,
                  onPressed: () => context.push('/improve/${cv.id}'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle(this.text);

  final String text;

  @override
  Widget build(BuildContext context) =>
      Text(text.toUpperCase(), style: context.cm.heading(size: 13, tracking: 0.06));
}

class _ExperienceRow extends StatelessWidget {
  const _ExperienceRow(this.e);

  final CvExperience e;

  @override
  Widget build(BuildContext context) {
    final cm = context.cm;
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.only(bottom: 14),
      decoration: BoxDecoration(border: Border(bottom: cm.hairline)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 12,
        children: [
          SizedBox(
            width: 62,
            child: Text(e.years, style: cm.body(size: 11, color: cm.colors.neutral700, height: 1.4)),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(e.role, style: cm.heading(size: 14)),
                Text(e.company, style: cm.body(size: 12, color: cm.colors.neutral700)),
                const SizedBox(height: 5),
                Text(e.line, style: cm.body(size: 12, height: 1.5)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
