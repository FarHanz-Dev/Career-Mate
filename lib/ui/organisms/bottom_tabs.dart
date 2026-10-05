import 'package:flutter/widgets.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../app/theme/cm_theme.dart';
import '../atoms/cm_pressable.dart';

/// Inbox / CV Bank / Insights. Icon plus title only. The active tab is
/// accent-100 with accent-800 content.
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

    return DecoratedBox(
      decoration: BoxDecoration(color: c.bg, border: Border(top: cm.rule)),
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
                    final fg = active ? c.accent800 : c.neutral700;
                    return Container(
                      padding: const EdgeInsets.fromLTRB(0, 10, 0, 14),
                      decoration: BoxDecoration(
                        color: active ? c.accent100 : (pressed ? c.surface : null),
                        border: i < _items.length - 1 ? Border(right: cm.hairline) : null,
                      ),
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
