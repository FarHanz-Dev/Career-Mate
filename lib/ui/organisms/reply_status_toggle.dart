import 'package:flutter/widgets.dart';

import '../../app/theme/cm_theme.dart';
import '../atoms/cm_label.dart';
import '../molecules/cm_segmented.dart';

/// "Reply status, you set this". CareerMate never reads the mailbox, so this
/// toggle is the only source of truth for whether a company replied.
class ReplyStatusToggle extends StatelessWidget {
  const ReplyStatusToggle({super.key, required this.selected, required this.onChanged});

  /// 0 = "No response yet", 1 = "They replied", null = neither set yet.
  final int? selected;
  final ValueChanged<int> onChanged;

  static const options = ['No response yet', 'They replied'];

  @override
  Widget build(BuildContext context) {
    final cm = context.cm;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(border: Border(bottom: cm.rule)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        spacing: 9,
        children: [
          const CmLabel('Reply status, you set this', size: 10),
          CmSegmented(options: options, selected: selected, onChanged: onChanged, expand: true, heading: true),
        ],
      ),
    );
  }
}
