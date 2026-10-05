import 'package:flutter/widgets.dart';

import '../../app/theme/cm_theme.dart';
import '../atoms/cm_tag.dart';

/// Horizontally scrolling bordered chips. Selected chips switch to the accent tag.
class CmChipRow extends StatelessWidget {
  const CmChipRow({
    super.key,
    required this.labels,
    required this.isSelected,
    required this.onTap,
    this.padding = EdgeInsets.zero,
  });

  final List<String> labels;
  final bool Function(int index) isSelected;
  final ValueChanged<int> onTap;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    final divider = context.cm.colors.divider;
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: padding,
      child: Row(
        spacing: 6,
        children: [
          for (var i = 0; i < labels.length; i++)
            CmTag(
              labels[i],
              variant: isSelected(i) ? CmTagVariant.accent : CmTagVariant.neutral,
              borderColor: divider,
              onTap: () => onTap(i),
            ),
        ],
      ),
    );
  }
}
