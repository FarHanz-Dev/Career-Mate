import 'package:flutter/widgets.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../app/theme/cm_theme.dart';
import '../atoms/cm_icon_button.dart';

/// Replaces the search bar during multi-select: "N selected" with archive,
/// mark-replied and more actions.
class SelectionBar extends StatelessWidget {
  const SelectionBar({
    super.key,
    required this.count,
    required this.onClose,
    required this.onArchive,
    required this.onMarkReplied,
    required this.onMore,
  });

  final int count;
  final VoidCallback onClose;
  final VoidCallback onArchive;
  final VoidCallback onMarkReplied;
  final VoidCallback onMore;

  @override
  Widget build(BuildContext context) {
    final cm = context.cm;
    const white = Color(0xFFFFFFFF);
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(color: cm.colors.accent, border: Border(bottom: cm.rule)),
      child: Row(
        spacing: 8,
        children: [
          CmIconButton(icon: LucideIcons.x, label: 'Close', color: white, onPressed: onClose),
          Text('$count selected', style: cm.heading(size: 16, color: white)),
          const Spacer(),
          Row(
            spacing: 2,
            children: [
              CmIconButton(
                icon: LucideIcons.archive,
                label: 'Archive',
                color: white,
                iconSize: 19,
                onPressed: onArchive,
              ),
              CmIconButton(
                icon: LucideIcons.check,
                label: 'Mark replied',
                color: white,
                iconSize: 19,
                onPressed: onMarkReplied,
              ),
              CmIconButton(
                icon: LucideIcons.ellipsisVertical,
                label: 'More',
                color: white,
                iconSize: 19,
                onPressed: onMore,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
