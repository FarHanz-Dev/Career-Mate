import 'package:flutter/widgets.dart';

import '../../app/theme/cm_theme.dart';
import '../atoms/cm_logo.dart';
import '../atoms/cm_pressable.dart';

class LabelDrawerItem {
  const LabelDrawerItem({required this.name, required this.count});

  final String name;
  final int count;
}

/// 284px drawer. Status labels take the place of Gmail folders.
class LabelDrawer extends StatelessWidget {
  const LabelDrawer({
    super.key,
    required this.email,
    required this.items,
    required this.selectedName,
    required this.onSelectLabel,
    required this.onProfile,
    required this.onCvBank,
    required this.onSignOut,
  });

  static const width = 284.0;

  final String email;
  final List<LabelDrawerItem> items;
  final String selectedName;
  final ValueChanged<String> onSelectLabel;
  final VoidCallback onProfile;
  final VoidCallback onCvBank;
  final VoidCallback onSignOut;

  @override
  Widget build(BuildContext context) {
    final cm = context.cm;
    final c = cm.colors;
    const white = Color(0xFFFFFFFF);

    return Container(
      width: width,
      decoration: BoxDecoration(
        color: c.bg,
        border: Border(right: cm.rule),
        boxShadow: const [
          BoxShadow(color: Color(0x382D2B2B), blurRadius: 32, offset: Offset(0, 12)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(18, 22 + MediaQuery.viewPaddingOf(context).top, 18, 16),
            decoration: BoxDecoration(color: c.accent, border: Border(bottom: cm.rule)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  spacing: 10,
                  children: [
                    const CmLogo(size: 30, inverse: true),
                    Text('CAREERMATE', style: cm.heading(size: 22, color: white, tracking: -0.02)),
                  ],
                ),
                const SizedBox(height: 4),
                Opacity(opacity: 0.9, child: Text(email, style: cm.body(size: 12, color: white))),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(vertical: 8),
              children: [
                for (final item in items) _labelRow(context, item),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                  child: SizedBox(height: 2, child: ColoredBox(color: c.divider)),
                ),
                _textRow(context, 'Career profile', c.text, onProfile),
                _textRow(context, 'CV Bank', c.text, onCvBank),
                _textRow(context, 'Sign out', c.accent700, onSignOut),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _labelRow(BuildContext context, LabelDrawerItem item) {
    final cm = context.cm;
    final c = cm.colors;
    final selected = item.name == selectedName;
    final fg = selected ? c.accent800 : c.text;
    return CmPressable(
      onTap: () => onSelectLabel(item.name),
      semanticLabel: '${item.name}, ${item.count}',
      builder: (context, pressed) => Container(
        color: selected ? c.accent100 : (pressed ? c.surface : null),
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 13),
        child: Row(
          spacing: 12,
          children: [
            SizedBox.square(
              dimension: 10,
              child: ColoredBox(color: selected ? c.accent : c.neutral400),
            ),
            Expanded(child: Text(item.name, style: cm.body(color: fg, height: CmTheme.natural))),
            Text('${item.count}', style: cm.heading(size: 12, color: fg, height: CmTheme.natural)),
          ],
        ),
      ),
    );
  }

  Widget _textRow(BuildContext context, String label, Color color, VoidCallback onTap) {
    final cm = context.cm;
    return CmPressable(
      onTap: onTap,
      semanticLabel: label,
      builder: (context, pressed) => Container(
        color: pressed ? cm.colors.surface : null,
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 13),
        child: Text(label, style: cm.body(color: color, height: CmTheme.natural)),
      ),
    );
  }
}
