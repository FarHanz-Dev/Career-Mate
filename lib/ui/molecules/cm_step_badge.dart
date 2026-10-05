import 'package:flutter/widgets.dart';

import '../../app/theme/cm_theme.dart';

/// 19px numbered square on the sign-in field (white at 22%).
class CmStepBadge extends StatelessWidget {
  const CmStepBadge(this.number, {super.key});

  final String number;

  @override
  Widget build(BuildContext context) {
    final cm = context.cm;
    return Container(
      width: 19,
      height: 19,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: const Color(0xFFFFFFFF).withValues(alpha: 0.22),
        borderRadius: cm.radius.smAll,
      ),
      child: Text(number, style: cm.heading(size: 11, color: const Color(0xFFFFFFFF))),
    );
  }
}
