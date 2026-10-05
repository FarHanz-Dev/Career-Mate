import 'package:flutter/widgets.dart';

import '../../app/theme/cm_theme.dart';
import '../../app/theme/tokens.dart';

/// Inbox score color: 85+ accent, 75 to 84 accent-700, below 75 neutral-700.
Color cmScoreColor(CmColors c, int score) =>
    score >= 85 ? c.accent : (score >= 75 ? c.accent700 : c.neutral700);

/// 46x4 bar with the score number to its right.
class CmScoreBar extends StatelessWidget {
  const CmScoreBar({super.key, required this.score});

  final int score;

  @override
  Widget build(BuildContext context) {
    final cm = context.cm;
    final color = cmScoreColor(cm.colors, score);
    return Semantics(
      label: 'Match $score',
      excludeSemantics: true,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 46,
            height: 4,
            child: ColoredBox(
              color: cm.colors.neutral300,
              child: Align(
                alignment: Alignment.centerLeft,
                child: FractionallySizedBox(
                  widthFactor: (score / 100).clamp(0.0, 1.0),
                  heightFactor: 1,
                  child: ColoredBox(color: color),
                ),
              ),
            ),
          ),
          const SizedBox(width: 6),
          Text('$score', style: cm.heading(size: 12, color: color)),
        ],
      ),
    );
  }
}
