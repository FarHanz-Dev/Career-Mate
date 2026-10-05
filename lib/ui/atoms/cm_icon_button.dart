import 'package:flutter/widgets.dart';

import '../../app/theme/cm_theme.dart';
import 'cm_pressable.dart';

/// Square icon-only button (`.btn-icon`). [label] is required for screen readers.
class CmIconButton extends StatelessWidget {
  const CmIconButton({
    super.key,
    required this.icon,
    required this.label,
    this.onPressed,
    this.size = 36,
    this.iconSize = 20,
    this.color,
  });

  final IconData icon;
  final String label;
  final VoidCallback? onPressed;
  final double size;
  final double iconSize;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final cm = context.cm;
    return CmPressable(
      onTap: onPressed,
      semanticLabel: label,
      builder: (context, pressed) => Container(
        width: size,
        height: size,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: pressed ? (color ?? cm.colors.text).withValues(alpha: 0.12) : null,
          borderRadius: cm.radius.mdAll,
        ),
        child: Icon(icon, size: iconSize, color: color ?? cm.colors.text),
      ),
    );
  }
}
