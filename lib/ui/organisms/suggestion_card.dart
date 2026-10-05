import 'package:flutter/widgets.dart';

import '../../app/theme/cm_theme.dart';
import '../atoms/cm_button.dart';
import '../atoms/cm_tag.dart';

/// One CV improvement: tag, location in the CV, expected lift, the line as it
/// stands, the rewrite, and Approve / Skip.
class SuggestionCard extends StatelessWidget {
  const SuggestionCard({
    super.key,
    required this.tag,
    required this.tagVariant,
    required this.where,
    required this.lift,
    required this.before,
    required this.after,
    required this.approveLabel,
    required this.onApprove,
    required this.onSkip,
  });

  final String tag;
  final CmTagVariant tagVariant;
  final String where;
  final String lift;
  final String before;
  final String after;
  final String approveLabel;
  final VoidCallback onApprove;
  final VoidCallback onSkip;

  @override
  Widget build(BuildContext context) {
    final cm = context.cm;
    final c = cm.colors;
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(border: Border(bottom: cm.hairline)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            spacing: 8,
            children: [
              CmTag(tag, variant: tagVariant, fontSize: 10, tracking: 0.08),
              Text(where, style: cm.body(size: 11, color: c.neutral700)),
              const Spacer(),
              Text(lift, style: cm.heading(size: 11, color: c.accent700)),
            ],
          ),
          const SizedBox(height: 11),
          Text(
            before,
            style: cm
                .body(size: 12.5, color: c.neutral700, height: 1.5)
                .copyWith(decoration: TextDecoration.lineThrough, decorationColor: c.neutral400),
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.only(left: 10),
            decoration: BoxDecoration(border: Border(left: BorderSide(color: c.accent, width: 2))),
            child: Text(after, style: cm.body(size: 13, height: 1.55)),
          ),
          const SizedBox(height: 13),
          Row(
            spacing: 8,
            children: [
              Expanded(
                child: CmButton(label: approveLabel, expand: true, onPressed: onApprove),
              ),
              Expanded(
                child: CmButton(
                  label: 'Skip',
                  variant: CmButtonVariant.secondary,
                  expand: true,
                  onPressed: onSkip,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
