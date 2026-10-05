import 'package:flutter/widgets.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../app/theme/cm_theme.dart';
import '../atoms/cm_pressable.dart';

/// Solid accent pill that opens the match breakdown. The only filled pill on the thread screen.
class CmMatchPill extends StatelessWidget {
  const CmMatchPill({super.key, required this.label, required this.onTap});

  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final cm = context.cm;
    const white = Color(0xFFFFFFFF);
    return CmPressable(
      onTap: onTap,
      semanticLabel: 'See match evidence',
      builder: (context, pressed) => Container(
        padding: const EdgeInsets.fromLTRB(9, 4, 7, 4),
        decoration: BoxDecoration(
          color: pressed ? cm.colors.accent700 : cm.colors.accent,
          borderRadius: BorderRadius.circular(999),
          boxShadow: const [BoxShadow(color: Color(0x1F000000), offset: Offset(0, 1))],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          spacing: 4,
          children: [
            Text(label, style: cm.heading(size: 11, color: white, tracking: 0.04, height: CmTheme.natural)),
            const Icon(LucideIcons.chevronRight, size: 11, color: white),
          ],
        ),
      ),
    );
  }
}
