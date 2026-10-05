import 'package:flutter/widgets.dart';

import '../../app/theme/cm_theme.dart';

/// The CareerMate mark: a rounded tile with three bars, drawn from the
/// 566x566 viewBox of `assets/careermate-logo.svg`. [inverse] is the white
/// tile with blue bars, for the accent field.
class CmLogo extends StatelessWidget {
  const CmLogo({super.key, this.size = 30, this.inverse = false});

  final double size;
  final bool inverse;

  @override
  Widget build(BuildContext context) {
    final c = context.cm.colors;
    return Semantics(
      label: 'CareerMate',
      image: true,
      child: SizedBox.square(
        dimension: size,
        child: CustomPaint(
          painter: _LogoPainter(
            tile: inverse ? const Color(0xFFFFFFFF) : c.accent,
            bars: inverse ? c.accent : const Color(0xFFFFFFFF),
          ),
        ),
      ),
    );
  }
}

class _LogoPainter extends CustomPainter {
  const _LogoPainter({required this.tile, required this.bars});

  final Color tile;
  final Color bars;

  static const _box = 566.0;

  @override
  void paint(Canvas canvas, Size size) {
    final k = size.width / _box;
    // viewBox origin is (20, 14); bar coordinates are shifted to match.
    RRect rect(double x, double y, double w, double h, double r) => RRect.fromRectAndRadius(
      Rect.fromLTWH((x - 20) * k, (y - 14) * k, w * k, h * k),
      Radius.circular(r * k),
    );

    canvas.drawRRect(rect(20, 14, 566, 566, 62), Paint()..color = tile);
    final paint = Paint()..color = bars;
    canvas.drawRRect(rect(152, 155, 94, 283, 16), paint);
    canvas.drawRRect(rect(256, 155, 94, 188, 16), paint);
    canvas.drawRRect(rect(360, 155, 94, 283, 16), paint);
  }

  @override
  bool shouldRepaint(_LogoPainter old) => old.tile != tile || old.bars != bars;
}
