import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';

import '../../app/theme/cm_theme.dart';
import '../atoms/cm_monogram.dart';
import '../atoms/cm_pressable.dart';
import '../atoms/cm_score_bar.dart';
import '../atoms/cm_tag.dart';
import '../molecules/cm_swipe_background.dart';

/// One dense inbox row. Swipe right marks replied, swipe left archives.
/// Pure view: all state and intents come in as props.
class ApplicationRow extends StatelessWidget {
  const ApplicationRow({
    super.key,
    required this.id,
    required this.company,
    required this.role,
    required this.cvName,
    required this.dateLabel,
    required this.statusLabel,
    required this.statusVariant,
    required this.score,
    required this.unread,
    required this.selected,
    required this.onOpen,
    required this.onSelect,
    required this.onMarkReplied,
    this.onArchive,
    this.snippet,
    this.showScore = true,
  });

  final String id;
  final String company;
  final String role;
  final String cvName;
  final String dateLabel;
  final String statusLabel;
  final CmTagVariant statusVariant;
  final int score;
  final bool unread;
  final bool selected;
  final String? snippet;
  final bool showScore;
  final VoidCallback onOpen;
  final VoidCallback onSelect;
  final VoidCallback onMarkReplied;

  /// Null disables swipe-to-archive (the Archived label).
  final VoidCallback? onArchive;

  @override
  Widget build(BuildContext context) {
    final cm = context.cm;
    final c = cm.colors;

    return Semantics(
      customSemanticsActions: {
        const CustomSemanticsAction(label: 'Mark replied'): onMarkReplied,
        const CustomSemanticsAction(label: 'Archive'): ?onArchive,
      },
      child: Dismissible(
        key: ValueKey('application-$id'),
        direction: onArchive == null ? DismissDirection.startToEnd : DismissDirection.horizontal,
        dismissThresholds: const {
          DismissDirection.startToEnd: 0.21,
          DismissDirection.endToStart: 0.21,
        },
        background: const CmSwipeBackground(label: 'Mark replied', alignment: Alignment.centerLeft),
        secondaryBackground: const CmSwipeBackground(label: 'Archive', alignment: Alignment.centerRight),
        confirmDismiss: (direction) async {
          if (direction == DismissDirection.startToEnd) {
            onMarkReplied();
            return false;
          }
          return true;
        },
        onDismissed: (_) => onArchive?.call(),
        child: DecoratedBox(
          decoration: BoxDecoration(border: Border(bottom: cm.hairline)),
          child: CmPressable(
            onTap: onOpen,
            isButton: false,
            builder: (context, pressed) => Container(
              color: pressed ? c.surface : c.bg,
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 13),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CmMonogram(
                    text: company.length >= 2 ? company.substring(0, 2) : company,
                    unread: unread,
                    selected: selected,
                    onTap: onSelect,
                  ),
                  const SizedBox(width: 12),
                  Expanded(child: _body(cm)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _body(CmTheme cm) {
    final c = cm.colors;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Expanded(
              child: Text(
                company,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: cm.body(
                  size: 15,
                  weight: unread ? FontWeight.w800 : FontWeight.w400,
                  letterSpacing: -0.15,
                ),
              ),
            ),
            const SizedBox(width: 8),
            Text(
              dateLabel,
              style: cm.body(
                size: 11,
                weight: unread ? FontWeight.w800 : FontWeight.w400,
                color: unread ? c.accent : c.neutral700,
              ),
            ),
          ],
        ),
        const SizedBox(height: 1),
        Row(
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Flexible(
              child: Text(
                role,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: cm.body(size: 13, weight: unread ? FontWeight.w600 : FontWeight.w400),
              ),
            ),
            const SizedBox(width: 6),
            Text('· $cvName', style: cm.body(size: 11, color: c.neutral700)),
          ],
        ),
        if (snippet != null)
          Padding(
            padding: const EdgeInsets.only(top: 3),
            child: Text(
              snippet!,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: cm.body(size: 12, color: c.neutral700, height: 1.4),
            ),
          ),
        const SizedBox(height: 7),
        Row(
          children: [
            CmTag(statusLabel, variant: statusVariant, fontSize: 10, tracking: 0.08),
            const Spacer(),
            if (showScore) CmScoreBar(score: score),
          ],
        ),
      ],
    );
  }
}
