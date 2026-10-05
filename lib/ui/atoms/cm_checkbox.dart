import 'package:flutter/widgets.dart';

import '../../app/theme/cm_theme.dart';
import 'cm_pressable.dart';

/// 26px square checkbox: 2px border, accent fill when checked.
class CmCheckbox extends StatelessWidget {
  const CmCheckbox({super.key, required this.checked, required this.label, this.onChanged});

  final bool checked;
  final String label;
  final ValueChanged<bool>? onChanged;

  @override
  Widget build(BuildContext context) {
    final cm = context.cm;
    final c = cm.colors;
    return Semantics(
      checked: checked,
      child: CmPressable(
        semanticLabel: label,
        onTap: onChanged == null ? null : () => onChanged!(!checked),
        builder: (context, _) => Container(
          width: 26,
          height: 26,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: checked ? c.accent : const Color(0x00000000),
            border: Border.all(color: checked ? c.accent : c.neutral400, width: 2),
            borderRadius: cm.radius.smAll,
          ),
          child: checked ? const CmCheckMark(size: 16) : null,
        ),
      ),
    );
  }
}

/// White check, `M20 6L9 17l-5-5` on a 24 grid at stroke 3, scaled to [size].
class CmCheckMark extends StatelessWidget {
  const CmCheckMark({super.key, required this.size});

  final double size;

  @override
  Widget build(BuildContext context) =>
      CustomPaint(size: Size.square(size), painter: const _CheckPainter());
}

class _CheckPainter extends CustomPainter {
  const _CheckPainter();

  @override
  void paint(Canvas canvas, Size size) {
    final k = size.width / 24;
    final path = Path()
      ..moveTo(20 * k, 6 * k)
      ..lineTo(9 * k, 17 * k)
      ..lineTo(4 * k, 12 * k);
    canvas.drawPath(
      path,
      Paint()
        ..color = const Color(0xFFFFFFFF)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 3 * k
        ..strokeCap = StrokeCap.round
        ..strokeJoin = StrokeJoin.round,
    );
  }

  @override
  bool shouldRepaint(_CheckPainter old) => false;
}
