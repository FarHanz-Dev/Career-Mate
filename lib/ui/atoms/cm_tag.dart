import 'package:flutter/widgets.dart';

import '../../app/theme/cm_theme.dart';
import 'cm_pressable.dart';

enum CmTagVariant { accent, neutral, outline }

/// `.tag`. Used as a status label, a skill tag, and (with [onTap] and
/// [borderColor]) as a toggle chip.
class CmTag extends StatelessWidget {
  const CmTag(
    this.label, {
    super.key,
    this.variant = CmTagVariant.neutral,
    this.fontSize = 11,
    this.tracking = 0.02,
    this.borderColor,
    this.onTap,
    this.natural = false,
  });

  final String label;
  final CmTagVariant variant;
  final double fontSize;

  /// Letter spacing in em. Status tags use .08 and are uppercase at the call site.
  final double tracking;
  final Color? borderColor;
  final VoidCallback? onTap;

  /// Natural line height, for tags rendered inside HTML buttons. Tappable tags (chips) always use it.
  final bool natural;

  @override
  Widget build(BuildContext context) {
    final cm = context.cm;
    final c = cm.colors;
    final (Color bg, Color fg) = switch (variant) {
      CmTagVariant.accent => (c.accent100, c.accent800),
      CmTagVariant.neutral => (c.neutral100, c.neutral800),
      CmTagVariant.outline => (const Color(0x00000000), c.accent),
    };
    final edge = variant == CmTagVariant.outline ? c.accent : borderColor;

    Widget tag() => Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
      decoration: BoxDecoration(
        color: bg,
        border: edge != null ? Border.all(color: edge) : null,
        borderRadius: BorderRadius.circular(cm.radius.md * 0.75),
      ),
      child: Text(
        label,
        maxLines: 1,
        style: cm.body(
          size: fontSize,
          color: fg,
          letterSpacing: tracking * fontSize,
          height: (natural || onTap != null) ? CmTheme.natural : null,
        ),
      ),
    );

    if (onTap == null) return tag();
    return CmPressable(onTap: onTap, semanticLabel: label, builder: (_, _) => tag());
  }
}
