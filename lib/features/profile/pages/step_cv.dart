import 'package:flutter/widgets.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../app/theme/cm_theme.dart';
import '../../../ui/atoms/cm_button.dart';
import '../../../ui/atoms/cm_radio.dart';
import '../../../ui/atoms/cm_tag.dart';
import '../../../ui/molecules/cm_dashed_box.dart';
import '../../../ui/molecules/cm_file_icon.dart';
import '../../cv_bank/models/cv_file.dart';
import '../controller/profile_flow_controller.dart';
import '../models/career_profile.dart';

/// Step 2: upload target, the parsed primary CV, and which CVs the AI may read.
List<Widget> stepCvChildren(
  BuildContext context,
  CareerProfile p,
  ProfileFlowController flow, {
  required CvFile? primary,
  required VoidCallback onUpload,
  required VoidCallback onOpenCvBank,
}) {
  final cm = context.cm;
  final c = cm.colors;

  return [
    Text(
      'Upload the CV you send most often. It is read once, and the skills and experience it finds '
      'become the default context for scoring and drafting.',
      style: cm.body(size: 13, color: c.neutral700, height: 1.5),
    ),
    // TODO(upload): open file_picker (PDF or Word, up to 10 MB) instead of the mock toast.
    CmDashedBox(
      label: 'Upload primary CV',
      onTap: onUpload,
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 28),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 9,
        children: [
          Icon(LucideIcons.upload, size: 28, color: c.accent),
          // The upload target is an HTML button, so its text uses the natural line height.
          Text('Upload primary CV', style: cm.heading(size: 16, height: CmTheme.natural)),
          Text(
            'PDF or Word · up to 10 MB',
            style: cm.body(size: 12, color: c.neutral700, height: CmTheme.natural),
          ),
        ],
      ),
    ),
    if (primary != null)
      Container(
        padding: const EdgeInsets.only(top: 14),
        decoration: BoxDecoration(border: Border(top: cm.hairline)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 12,
          children: [
            CmFileIcon(primary.ext, rounded: true),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(primary.name, style: cm.heading(size: 14)),
                  const SizedBox(height: 2),
                  Text(
                    'Read: ${primary.skillsCount} skills, ${primary.rolesCount} roles, '
                    '${primary.certsCount} certifications',
                    style: cm.body(size: 11, color: c.neutral700),
                  ),
                  const SizedBox(height: 8),
                  const Wrap(
                    spacing: 6,
                    runSpacing: 6,
                    children: [
                      CmTag('Primary', variant: CmTagVariant.accent),
                      CmTag('In AI context'),
                    ],
                  ),
                ],
              ),
            ),
            CmButton(label: 'Change', variant: CmButtonVariant.ghost, onPressed: onOpenCvBank),
          ],
        ),
      ),
    Container(
      padding: const EdgeInsets.only(top: 14),
      decoration: BoxDecoration(border: Border(top: cm.hairline)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 10,
        children: [
          Text(
            'Let the AI read every CV in the bank, or only the primary one?',
            style: cm.body(size: 12, color: c.neutral700),
          ),
          for (final scope in CvContextScope.values)
            CmRadioOption(
              label: scope.label,
              selected: p.cvScope == scope,
              onTap: () => flow.setCvScope(scope),
            ),
        ],
      ),
    ),
    CmButton(
      label: 'Open CV Bank',
      variant: CmButtonVariant.secondary,
      expand: true,
      minHeight: 44,
      onPressed: onOpenCvBank,
    ),
  ];
}
