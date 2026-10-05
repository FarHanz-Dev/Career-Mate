import 'package:flutter/widgets.dart';

import '../../app/theme/cm_theme.dart';
import '../atoms/cm_pressable.dart';

/// `.seg`: options in one bordered strip, the selected one filled with accent.
/// Hugs its content unless [expand] is set (the reply status toggle).
class CmSegmented extends StatelessWidget {
  const CmSegmented({
    super.key,
    required this.options,
    required this.selected,
    required this.onChanged,
    this.expand = false,
    this.heading = false,
  });

  final List<String> options;

  /// Index of the selected option, or null when none applies.
  final int? selected;
  final ValueChanged<int> onChanged;
  final bool expand;

  /// Reply-toggle style: heading 12.5/800 with 11px/8px padding instead of 13px body.
  final bool heading;

  @override
  Widget build(BuildContext context) {
    final cm = context.cm;
    final c = cm.colors;

    final cells = [
      for (var i = 0; i < options.length; i++)
        _cell(context, i, c.divider, cm),
    ];

    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border.fromBorderSide(cm.hairline),
        borderRadius: cm.radius.mdAll,
      ),
      child: ClipRRect(
        borderRadius: cm.radius.mdAll,
        child: IntrinsicHeight(
          child: Row(
            mainAxisSize: expand ? MainAxisSize.max : MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: cells,
          ),
        ),
      ),
    );
  }

  Widget _cell(BuildContext context, int i, Color divider, CmTheme cm) {
    final isSelected = selected == i;
    final fg = isSelected ? cm.colors.bg : cm.colors.text;
    final cell = CmPressable(
      onTap: () => onChanged(i),
      semanticLabel: options[i],
      builder: (context, pressed) => Container(
        padding: heading
            ? const EdgeInsets.symmetric(horizontal: 8, vertical: 11)
            : const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
        alignment: heading ? Alignment.centerLeft : Alignment.center,
        decoration: BoxDecoration(
          color: isSelected
              ? cm.colors.accent
              : (pressed ? cm.colors.text.withValues(alpha: 0.07) : null),
          border: i == 0 ? null : Border(left: BorderSide(color: divider)),
        ),
        child: Text(
          options[i],
          maxLines: 1,
          softWrap: false,
          style: heading
              ? cm.heading(size: 12.5, color: fg, height: CmTheme.natural)
              : cm.body(size: 13, color: fg),
        ),
      ),
    );
    return expand ? Expanded(child: cell) : cell;
  }
}
