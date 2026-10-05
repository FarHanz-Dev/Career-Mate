import 'package:flutter/widgets.dart';

import '../../app/theme/cm_theme.dart';

/// 38px square monogram. It is also the multi-select target, so selection
/// never needs a long press the user can't discover.
class CmMonogram extends StatelessWidget {
  const CmMonogram({
    super.key,
    required this.text,
    this.unread = false,
    this.selected = false,
    this.onTap,
  });

  final String text;
  final bool unread;
  final bool selected;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final cm = context.cm;
    final c = cm.colors;
    final bg = selected ? c.accent : (unread ? c.neutral900 : c.neutral300);
    final fg = (selected || unread) ? const Color(0xFFFFFFFF) : c.text;

    return Semantics(
      button: true,
      selected: selected,
      label: selected ? 'Deselect' : 'Select',
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: onTap,
        child: Container(
          width: 38,
          height: 38,
          alignment: Alignment.center,
          decoration: BoxDecoration(color: bg, borderRadius: cm.radius.mdAll),
          child: Text(text.toUpperCase(), style: cm.heading(size: 13, color: fg)),
        ),
      ),
    );
  }
}
