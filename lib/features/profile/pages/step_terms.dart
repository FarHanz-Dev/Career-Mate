import 'package:flutter/widgets.dart';

import '../../../app/theme/cm_theme.dart';
import '../../../ui/atoms/cm_label.dart';
import '../../../ui/atoms/cm_radio.dart';
import '../../../ui/atoms/cm_tag.dart';
import '../../../ui/molecules/cm_labeled_field.dart';
import '../../cv_bank/models/cv_file.dart';
import '../controller/profile_flow_controller.dart';
import '../models/career_profile.dart';

/// Step 3: tone, notice, salary, sign-off, languages, and the profile summary.
List<Widget> stepTermsChildren(
  BuildContext context,
  CareerProfile p,
  ProfileFlowController flow, {
  required CvFile? primary,
}) {
  final cm = context.cm;
  final c = cm.colors;

  final summary = [
    ('Name', p.name),
    ('Sends from', p.email),
    ('Target roles', p.targetRoles.isEmpty ? 'none yet' : p.targetRoles.join(', ')),
    ('Primary CV', primary == null ? 'none yet' : '${primary.name} · ${primary.skillsCount} skills read'),
    ('Tone', p.tone.label),
    ('Availability', '${p.notice} · ${p.salary}'),
  ];

  return [
    Text(
      'Last step. These set how the mail sounds and what it is allowed to promise.',
      style: cm.body(size: 13, color: c.neutral700, height: 1.5),
    ),
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Mail tone the AI should write in', style: cm.body(size: 12, color: c.neutral700)),
        const SizedBox(height: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          spacing: 10,
          children: [
            for (final tone in MailTone.values)
              CmRadioOption(
                label: tone.label,
                note: tone.note,
                selected: p.tone == tone,
                onTap: () => flow.setTone(tone),
              ),
          ],
        ),
      ],
    ),
    Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 10,
      children: [
        Expanded(child: CmLabeledField(label: 'Notice period', value: p.notice, onChanged: flow.setNotice)),
        Expanded(child: CmLabeledField(label: 'Expected salary', value: p.salary, onChanged: flow.setSalary)),
      ],
    ),
    CmLabeledField(label: 'Sign-off line', value: p.signOff, onChanged: flow.setSignOff),
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Languages the AI may write in', style: cm.body(size: 12, color: c.neutral700)),
        const SizedBox(height: 8),
        Wrap(
          spacing: 6,
          runSpacing: 6,
          children: [
            for (final lang in p.languages) CmTag(lang, variant: CmTagVariant.accent),
            // TODO(languages): open a language picker.
            const CmTag('+ add', variant: CmTagVariant.outline),
          ],
        ),
      ],
    ),
    Container(
      padding: const EdgeInsets.only(top: 14),
      decoration: BoxDecoration(border: Border(top: cm.rule)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CmLabel('Profile summary', size: 10, color: c.accent700),
          const SizedBox(height: 10),
          for (final (k, v) in summary)
            Container(
              padding: const EdgeInsets.symmetric(vertical: 7),
              decoration: BoxDecoration(border: Border(bottom: cm.hairline)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 12,
                children: [
                  SizedBox(width: 104, child: Text(k, style: cm.body(size: 12.5, color: c.neutral700))),
                  Expanded(child: Text(v, style: cm.body(size: 12.5))),
                ],
              ),
            ),
        ],
      ),
    ),
  ];
}
