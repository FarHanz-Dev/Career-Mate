import 'package:flutter/widgets.dart';
import '../../app/theme/cm_theme.dart';
import '../atoms/cm_checkbox.dart';

/// One posting requirement paired with the CV quote that backs it (or the gap).
class EvidenceItem extends StatelessWidget {
  const EvidenceItem({super.key, required this.need, required this.proof, required this.met});

  final String need;
  final String proof;
  final bool met;

  @override
  Widget build(BuildContext context) {
    final cm = context.cm;
    final c = cm.colors;
    const white = Color(0xFFFFFFFF);

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 11),
      decoration: BoxDecoration(border: Border(bottom: cm.hairline)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 11,
        children: [
          Container(
            width: 20,
            height: 20,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: met ? c.accent : c.neutral500,
              borderRadius: cm.radius.smAll,
            ),
            child: met
                ? const CmCheckMark(size: 13)
                : Text('~', style: cm.heading(size: 12, color: white, height: 1)),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(need, style: cm.body(size: 12.5, weight: FontWeight.w600)),
                const SizedBox(height: 3),
                Container(
                  padding: const EdgeInsets.only(left: 8),
                  decoration: BoxDecoration(border: Border(left: cm.rule)),
                  child: Text(proof, style: cm.body(size: 11.5, color: c.neutral700, height: 1.45)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
