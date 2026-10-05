import 'package:flutter/widgets.dart';

import '../../app/theme/cm_theme.dart';

/// One match dimension: name, percent, a 6px bar and a one-line note.
class DimensionBar extends StatelessWidget {
  const DimensionBar({super.key, required this.name, required this.percent, required this.note});

  final String name;
  final int percent;
  final String note;

  @override
  Widget build(BuildContext context) {
    final cm = context.cm;
    final c = cm.colors;
    final color = percent >= 85 ? c.accent : (percent >= 70 ? c.accent700 : c.neutral700);

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 11),
      decoration: BoxDecoration(border: Border(bottom: cm.hairline)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(name, style: cm.body(size: 13, weight: FontWeight.w600)),
              const Spacer(),
              Text('$percent', style: cm.heading(size: 13, color: color)),
            ],
          ),
          const SizedBox(height: 7),
          SizedBox(
            height: 6,
            child: ColoredBox(
              color: c.neutral300,
              child: Align(
                alignment: Alignment.centerLeft,
                child: FractionallySizedBox(
                  widthFactor: (percent / 100).clamp(0.0, 1.0),
                  heightFactor: 1,
                  child: ColoredBox(color: color),
                ),
              ),
            ),
          ),
          const SizedBox(height: 6),
          Text(note, style: cm.body(size: 11.5, color: c.neutral700, height: 1.45)),
        ],
      ),
    );
  }
}
