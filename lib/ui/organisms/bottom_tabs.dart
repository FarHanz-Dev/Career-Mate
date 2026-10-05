import 'package:flutter/widgets.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../app/theme/cm_theme.dart';
import '../atoms/cm_pressable.dart';

/// Inbox / CV Bank / Insights. Icon plus title only, and no frame: no rule
/// above, no dividers, no fill. The active tab is only accent-coloured.
class BottomTabs extends StatelessWidget {
  const BottomTabs({super.key, required this.selectedIndex, required this.onSelected});

  /// Null when the current screen is not one of the tabs.
  final int? selectedIndex;
  final ValueChanged<int> onSelected;

  static const _items = [
    (LucideIcons.inbox, 'Inbox'),
    (LucideIcons.fileText, 'CV Bank'),
    (LucideIcons.chartNoAxesColumn, 'Insights'),
  ];

  @override
  Widget build(BuildContext context) {
    final cm = context.cm;
    final c = cm.colors;
    final safeBottom = MediaQuery.viewPaddingOf(context).bottom;

    return ColoredBox(
      color: c.bg,
      child: Padding(
        padding: EdgeInsets.only(bottom: safeBottom),
        child: Row(
          children: [
            for (var i = 0; i < _items.length; i++)
              Expanded(
                child: CmPressable(
                  onTap: () => onSelected(i),
                  semanticLabel: _items[i].$2,
                  builder: (context, pressed) {
                    final active = selectedIndex == i;
                    final fg = active ? c.accent : c.neutral700;
                    return Opacity(
                      opacity: pressed ? 0.5 : 1,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 10, 0, 14),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          spacing: 5,
                          children: [
                            Icon(_items[i].$1, size: 21, color: fg),
                            Text(
                              _items[i].$2.toUpperCase(),
                              style: cm.heading(size: 10.5, color: fg, tracking: 0.08, height: CmTheme.natural),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}
