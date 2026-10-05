import 'package:flutter/widgets.dart';

import '../../../app/theme/cm_theme.dart';
import '../../../ui/atoms/cm_tag.dart';
import '../../../ui/molecules/cm_labeled_field.dart';
import '../../../ui/molecules/cm_segmented.dart';
import '../controller/profile_flow_controller.dart';
import '../models/career_profile.dart';

/// Step 1: name, headline, email, years, target roles, location.
List<Widget> stepYouChildren(BuildContext context, CareerProfile p, ProfileFlowController flow) {
  final cm = context.cm;
  final c = cm.colors;

  Widget group(String label, Widget child) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(label, style: cm.body(size: 12, color: c.neutral700)),
      const SizedBox(height: 8),
      child,
    ],
  );

  return [
    Text(
      'This is the standing context every draft reads, so the AI never has to be told who you are twice.',
      style: cm.body(size: 13, color: c.neutral700, height: 1.5),
    ),
    CmLabeledField(label: 'Full name', value: p.name, onChanged: flow.setName),
    CmLabeledField(
      label: 'Headline as it should read in mail',
      value: p.headline,
      onChanged: flow.setHeadline,
    ),
    CmLabeledField(
      label: 'Work email you send from',
      value: p.email,
      onChanged: flow.setEmail,
      keyboardType: TextInputType.emailAddress,
    ),
    group(
      'Years of experience',
      Align(
        alignment: Alignment.centerLeft,
        child: CmSegmented(
          options: [for (final y in YearsBand.values) y.label],
          selected: p.years.index,
          onChanged: (i) => flow.setYears(YearsBand.values[i]),
        ),
      ),
    ),
    group(
      'Target roles, tap to include',
      Wrap(
        spacing: 6,
        runSpacing: 6,
        children: [
          for (final role in targetRoleOptions)
            CmTag(
              role,
              variant: p.targetRoles.contains(role) ? CmTagVariant.accent : CmTagVariant.neutral,
              borderColor: p.targetRoles.contains(role) ? c.accent300 : c.divider,
              fontSize: 11.5,
              onTap: () => flow.toggleRole(role),
            ),
        ],
      ),
    ),
    group(
      'Where you want to work',
      Align(
        alignment: Alignment.centerLeft,
        child: CmSegmented(
          options: [for (final l in WorkLocation.values) l.label],
          selected: p.location.index,
          onChanged: (i) => flow.setLocation(WorkLocation.values[i]),
        ),
      ),
    ),
  ];
}
