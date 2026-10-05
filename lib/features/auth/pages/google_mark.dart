import 'package:flutter/widgets.dart';
import 'package:path_drawing/path_drawing.dart';

/// Google "G" from the official 48x48 artwork. Brand colors are fixed.
class GoogleMark extends StatelessWidget {
  const GoogleMark({super.key, this.size = 21});

  final double size;

  @override
  Widget build(BuildContext context) => ExcludeSemantics(
    child: SizedBox.square(dimension: size, child: CustomPaint(painter: _GooglePainter())),
  );
}

class _GooglePainter extends CustomPainter {
  static const _parts = [
    (
      Color(0xFF4285F4),
      'M45.1 24.5c0-1.6-.1-3.1-.4-4.6H24v8.7h11.8c-.5 2.7-2.1 5-4.4 6.5v5.4h7.1c4.1-3.8 6.6-9.4 6.6-16z',
    ),
    (
      Color(0xFF34A853),
      'M24 46c6 0 11-2 14.5-5.4l-7.1-5.4c-2 1.3-4.5 2.1-7.4 2.1-5.7 0-10.5-3.8-12.2-9H4.5v5.6C8.1 41.3 15.4 46 24 46z',
    ),
    (
      Color(0xFFFBBC05),
      'M11.8 28.3c-.4-1.3-.7-2.7-.7-4.3s.3-3 .7-4.3v-5.6H4.5C2.9 17.3 2 20.5 2 24s.9 6.7 2.5 9.6l7.3-5.3z',
    ),
    (
      Color(0xFFEA4335),
      'M24 10.2c3.2 0 6.1 1.1 8.4 3.3l6.3-6.3C35 3.6 30 1.5 24 1.5 15.4 1.5 8.1 6.2 4.5 13.4l7.3 5.6c1.7-5.2 6.5-8.8 12.2-8.8z',
    ),
  ];

  static final _paths = [for (final (color, data) in _parts) (color, parseSvgPathData(data))];

  @override
  void paint(Canvas canvas, Size size) {
    canvas.save();
    canvas.scale(size.width / 48);
    for (final (color, path) in _paths) {
      canvas.drawPath(path, Paint()..color = color);
    }
    canvas.restore();
  }

  @override
  bool shouldRepaint(_GooglePainter old) => false;
}
