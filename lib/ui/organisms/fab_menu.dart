import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../app/theme/cm_theme.dart';
import '../../app/theme/tokens.dart';
import '../atoms/cm_pressable.dart';

/// 58px floating action button, radius lg, bottom right.
class CmFab extends StatelessWidget {
  const CmFab({super.key, required this.label, required this.onPressed});

  static const size = 58.0;

  final String label;
  final VoidCallback onPressed;

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
          color: pressed ? cm.colors.accent700 : cm.colors.accent,
          borderRadius: cm.radius.lgAll,
          boxShadow: cmShadowMd,
        ),
        child: Icon(LucideIcons.plus, size: 24, color: cm.colors.bg),
      ),
    );
  }
}

class FabMenuItem {
  const FabMenuItem({required this.icon, required this.label, required this.onTap});

  final IconData icon;
  final String label;
  final VoidCallback onTap;
}

/// Opens the two-option menu above [anchor] (the FAB) on the root navigator,
/// so the scrim also covers the bottom tabs.
Future<void> showFabMenu(
  BuildContext context, {
  required GlobalKey anchor,
  required List<FabMenuItem> items,
}) {
  final box = anchor.currentContext!.findRenderObject()! as RenderBox;
  final fabTop = box.localToGlobal(Offset.zero).dy;
  final screenHeight = MediaQuery.sizeOf(context).height;
  final cm = context.cm;

  return showGeneralDialog<void>(
    context: context,
    useRootNavigator: true,
    barrierDismissible: true,
    barrierLabel: 'Close menu',
    barrierColor: cm.colors.scrim,
    transitionDuration: const Duration(milliseconds: 160),
    pageBuilder: (dialogContext, _, _) => Stack(
      children: [
        Positioned(
          right: 14,
          bottom: screenHeight - fabTop + 22,
          child: _FabMenu(
            items: items,
            onSelected: (item) {
              Navigator.of(dialogContext).pop();
              item.onTap();
            },
          ),
        ),
      ],
    ),
    transitionBuilder: (context, animation, _, child) {
      final t = Curves.easeOut.transform(animation.value);
      return Opacity(
        opacity: t,
        child: Transform.translate(offset: Offset(0, 14 * (1 - t)), child: child),
      );
    },
  );
}

class _FabMenu extends StatelessWidget {
  const _FabMenu({required this.items, required this.onSelected});

  final List<FabMenuItem> items;
  final ValueChanged<FabMenuItem> onSelected;

  @override
  Widget build(BuildContext context) {
    final cm = context.cm;
    return Material(
      type: MaterialType.transparency,
      child: DecoratedBox(
        decoration: BoxDecoration(boxShadow: cmShadowLg, borderRadius: cm.radius.mdAll),
        child: ConstrainedBox(
          constraints: const BoxConstraints(minWidth: 230),
          child: IntrinsicWidth(
            child: Column(
              spacing: 2,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                for (final item in items)
                  CmPressable(
                    onTap: () => onSelected(item),
                    semanticLabel: item.label,
                    builder: (context, pressed) => Container(
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        color: pressed ? cm.colors.surface : cm.colors.bg,
                        border: Border.fromBorderSide(cm.hairline),
                        borderRadius: cm.radius.mdAll,
                      ),
                      child: Row(
                        spacing: 10,
                        children: [
                          Icon(item.icon, size: 18, color: cm.colors.text),
                          Text(item.label, style: cm.heading(size: 14, height: 1.2)),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
