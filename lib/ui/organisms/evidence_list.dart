import 'package:flutter/widgets.dart';

import '../../app/theme/cm_theme.dart';
import '../atoms/cm_checkbox.dart';

/// One posting requirement paired with the CV quote that backs it (or the gap).
/// A round status mark, the requirement, and the quote under it. No rules.
class EvidenceItem extends StatelessWidget {
  const EvidenceItem({super.key, required this.need, required this.proof, required this.met});

  final String need;
  final String proof;
  final bool met;

  @override
  Widget build(BuildContext context) {
    final cm = context.cm;
    final c = cm.colors;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 12,
      children: [
        Container(
          width: 20,
          height: 20,
          margin: const EdgeInsets.only(top: 1),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: met ? c.accent : c.neutral300,
            shape: BoxShape.circle,
          ),
          child: met
              ? const CmCheckMark(size: 12)
              : Text('~', style: cm.heading(size: 12, color: c.neutral800, height: 1)),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(need, style: cm.body(size: 14, weight: FontWeight.w600, height: 1.4)),
              const SizedBox(height: 4),
              Text(proof, style: cm.body(size: 12, color: c.neutral700, height: 1.5)),
            ],
          ),
        ),
      ],
    );
  }
}
