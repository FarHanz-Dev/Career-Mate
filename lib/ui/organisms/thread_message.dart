import 'package:flutter/widgets.dart';

import '../../app/theme/cm_theme.dart';
import '../atoms/cm_pressable.dart';
import '../atoms/cm_tag.dart';

/// One message in a thread (AI draft, sent mail). Collapsed by default; the
/// body is only built when expanded.
class ThreadMessage extends StatelessWidget {
  const ThreadMessage({
    super.key,
    required this.from,
    required this.kind,
    required this.kindVariant,
    required this.date,
    required this.body,
    required this.expanded,
    required this.onToggle,
  });

  final String from;
  final String kind;
  final CmTagVariant kindVariant;
  final String date;
  final String body;
  final bool expanded;
  final VoidCallback onToggle;

  @override
  Widget build(BuildContext context) {
    final cm = context.cm;
    final c = cm.colors;
    return DecoratedBox(
      decoration: BoxDecoration(border: Border(bottom: cm.hairline)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CmPressable(
            onTap: onToggle,
            semanticLabel: '$from, $kind, ${expanded ? 'hide' : 'show'}',
            builder: (context, pressed) => Container(
              color: pressed ? c.surface : null,
              padding: const EdgeInsets.all(16).copyWith(top: 14, bottom: 14),
              child: Row(
                spacing: 8,
                children: [
                  Text(from, style: cm.heading(size: 13.5, height: CmTheme.natural)),
                  CmTag(kind, variant: kindVariant, fontSize: 10, tracking: 0.08, natural: true),
                  const Spacer(),
                  Text(date, style: cm.body(size: 11, color: c.neutral700, height: CmTheme.natural)),
                  Text(
                    expanded ? 'HIDE' : 'SHOW',
                    style: cm.heading(size: 10.5, color: c.accent700, tracking: 0.06, height: CmTheme.natural),
                  ),
                ],
              ),
            ),
          ),
          if (expanded)
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              child: Text(body, style: cm.body(size: 13, height: 1.55)),
            ),
        ],
      ),
    );
  }
}
