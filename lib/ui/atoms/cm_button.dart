import 'package:flutter/widgets.dart';

import '../../app/theme/cm_theme.dart';
import 'cm_pressable.dart';

enum CmButtonVariant { primary, secondary, ghost }

/// `.btn` from the design system: 14px/800, 1px border, radius md.
/// Content hugs by default; [expand] makes it full width.
class CmButton extends StatelessWidget {
  const CmButton({
    super.key,
    required this.label,
    this.onPressed,
    this.variant = CmButtonVariant.primary,
    this.icon,
    this.minHeight,
    this.fontSize = 14,
    this.expand = false,
    this.alignment = MainAxisAlignment.start,
    this.textColor,
    this.background,
    this.border,
  });

  final String label;
  final VoidCallback? onPressed;
  final CmButtonVariant variant;
  final Widget? icon;
  final double? minHeight;
  final double fontSize;
  final bool expand;
  final MainAxisAlignment alignment;

  /// Overrides for one-off surfaces (the white Google button, ghost on dark).
  final Color? textColor;
  final Color? background;
  final Color? border;

  @override
  Widget build(BuildContext context) {
    final cm = context.cm;
    final c = cm.colors;
    final enabled = onPressed != null;

    final (Color rest, Color pressedBg, Color fg, Color edge) = switch (variant) {
      CmButtonVariant.primary => (c.accent, c.accent700, c.bg, const Color(0x00000000)),
      CmButtonVariant.secondary => (
        const Color(0x00000000),
        c.text.withValues(alpha: 0.14),
        c.text,
        c.divider,
      ),
      CmButtonVariant.ghost => (
        const Color(0x00000000),
        c.accent.withValues(alpha: 0.18),
        c.accent,
        const Color(0x00000000),
      ),
    };
    final hPad = variant == CmButtonVariant.ghost ? 4.0 : 14.4;

    return CmPressable(
      onTap: onPressed,
      semanticLabel: label,
      builder: (context, pressed) {
        final content = Row(
          mainAxisSize: expand ? MainAxisSize.max : MainAxisSize.min,
          mainAxisAlignment: alignment,
          children: [
            if (icon != null) ...[icon!, const SizedBox(width: 6)],
            Flexible(
              child: Text(
                label,
                style: cm.heading(size: fontSize, color: textColor ?? fg, height: 1.2),
              ),
            ),
          ],
        );
        return Opacity(
          opacity: enabled ? 1 : 0.45,
          child: Container(
            constraints: BoxConstraints(minHeight: minHeight ?? 0),
            padding: EdgeInsets.symmetric(horizontal: hPad, vertical: 8),
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
              color: pressed ? pressedBg : (background ?? rest),
              border: Border.all(color: border ?? edge),
              borderRadius: cm.radius.mdAll,
            ),
            child: content,
          ),
        );
      },
    );
  }
}
