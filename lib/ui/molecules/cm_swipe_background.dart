import 'package:flutter/widgets.dart';

import '../../app/theme/cm_theme.dart';

/// Accent field revealed behind a swiped row, with its action label
/// ("ARCHIVE", "MARK REPLIED") on the edge the row came from.
class CmSwipeBackground extends StatelessWidget {
  const CmSwipeBackground({super.key, required this.label, required this.alignment});

  final String label;
  final Alignment alignment;

  @override
  Widget build(BuildContext context) {
    final cm = context.cm;
    return Container(
      color: cm.colors.accent,
      alignment: alignment,
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Text(
        label.toUpperCase(),
        style: cm.heading(size: 11, color: const Color(0xFFFFFFFF), tracking: 0.12),
      ),
    );
  }
}
