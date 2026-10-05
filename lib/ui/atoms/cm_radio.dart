import 'package:flutter/widgets.dart';

import '../../app/theme/cm_theme.dart';
import 'cm_pressable.dart';

/// `.radio` with an optional note under the label (the mail tone options).
class CmRadioOption extends StatelessWidget {
  const CmRadioOption({
    super.key,
    required this.label,
    required this.selected,
    required this.onTap,
    this.note,
  });

  final String label;
  final String? note;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final cm = context.cm;
    final c = cm.colors;
    return Semantics(
      inMutuallyExclusiveGroup: true,
      checked: selected,
      child: CmPressable(
        onTap: onTap,
        semanticLabel: label,
        builder: (context, _) => Row(
          crossAxisAlignment: note == null ? CrossAxisAlignment.center : CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: note == null ? 0 : 3),
              child: _Dot(selected: selected),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(label, style: cm.body(weight: note == null ? FontWeight.w400 : FontWeight.w600)),
                  if (note != null)
                    Text(note!, style: cm.body(size: 11.5, color: c.neutral700)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// 16px dot. Selected: accent ring, bg gap, accent center (the CSS inset shadow).
class _Dot extends StatelessWidget {
  const _Dot({required this.selected});

  final bool selected;

  @override
  Widget build(BuildContext context) {
    final c = context.cm.colors;
    return Container(
      width: 16,
      height: 16,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: c.bg,
        border: Border.all(color: selected ? c.accent : c.divider, width: 1.5),
      ),
      child: selected
          ? DecoratedBox(
              decoration: BoxDecoration(shape: BoxShape.circle, color: c.accent),
              child: const SizedBox.square(dimension: 5),
            )
          : null,
    );
  }
}
