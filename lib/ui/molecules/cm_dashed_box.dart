import 'dart:ui' as ui;

import 'package:flutter/widgets.dart';

import '../../app/theme/cm_theme.dart';
import '../atoms/cm_pressable.dart';

/// The dashed upload target: 2px dashed divider, radius lg, surface fill.
class CmDashedBox extends StatelessWidget {
  const CmDashedBox({
    super.key,
    required this.child,
    required this.onTap,
    required this.label,
    this.padding = const EdgeInsets.all(18),
  });

  final Widget child;
  final VoidCallback onTap;
  final String label;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    final cm = context.cm;
    return CmPressable(
      onTap: onTap,
      semanticLabel: label,
      builder: (context, pressed) => CustomPaint(
        painter: _DashedBorderPainter(
          color: cm.colors.divider,
          fill: pressed ? cm.colors.neutral300 : cm.colors.surface,
          radius: cm.radius.lg,
        ),
        child: Container(
          width: double.infinity,
          padding: padding,
          alignment: Alignment.centerLeft,
          child: child,
        ),
      ),
    );
  }
}

class _DashedBorderPainter extends CustomPainter {
  const _DashedBorderPainter({required this.color, required this.fill, required this.radius});

  final Color color;
  final Color fill;
  final double radius;

  static const _stroke = 2.0;
  static const _dash = 6.0;
  static const _gap = 4.0;

  @override
  void paint(Canvas canvas, Size size) {
    final outer = RRect.fromRectAndRadius(Offset.zero & size, Radius.circular(radius));
    canvas.drawRRect(outer, Paint()..color = fill);

    // Stroke along the middle of the 2px border so it stays inside the box.
    final path = Path()
      ..addRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(_stroke / 2, _stroke / 2, size.width - _stroke, size.height - _stroke),
          Radius.circular((radius - _stroke / 2).clamp(0, double.infinity)),
        ),
      );
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = _stroke;
    for (final ui.PathMetric metric in path.computeMetrics()) {
      var d = 0.0;
      while (d < metric.length) {
        canvas.drawPath(metric.extractPath(d, d + _dash), paint);
        d += _dash + _gap;
      }
    }
  }

  @override
  bool shouldRepaint(_DashedBorderPainter old) =>
      old.color != color || old.fill != fill || old.radius != radius;
}
