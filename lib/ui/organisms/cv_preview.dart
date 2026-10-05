import 'package:flutter/widgets.dart';

import '../../app/theme/cm_theme.dart';

/// Grayscale mini page standing in for the CV's first page (96x124).
class CvPreview extends StatelessWidget {
  const CvPreview({super.key});

  @override
  Widget build(BuildContext context) {
    final cm = context.cm;
    final c = cm.colors;

    Widget bar(double widthFactor, double height, Color color) => FractionallySizedBox(
      widthFactor: widthFactor,
      alignment: Alignment.centerLeft,
      child: SizedBox(height: height, child: ColoredBox(color: color)),
    );
    Widget rule() => Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: SizedBox(height: 1, child: ColoredBox(color: c.neutral400)),
    );

    return Container(
      width: 96,
      height: 124,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(color: c.surface, border: Border.fromBorderSide(cm.hairline)),
      child: ExcludeSemantics(
        child: Column(
          spacing: 5,
          children: [
            bar(0.70, 7, c.neutral500),
            bar(0.46, 4, c.neutral400),
            rule(),
            bar(0.92, 4, c.neutral300),
            bar(0.84, 4, c.neutral300),
            bar(0.88, 4, c.neutral300),
            bar(0.60, 4, c.neutral300),
            rule(),
            bar(0.76, 4, c.neutral300),
            bar(0.66, 4, c.neutral300),
          ],
        ),
      ),
    );
  }
}
