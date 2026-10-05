import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../app/theme/cm_theme.dart';
import '../atoms/cm_icon_button.dart';
import '../atoms/cm_logo.dart';
import '../atoms/cm_text_field.dart';

/// Pinned search: hamburger on the left, input, logo tile (opens the profile) on the right.
class CmSearchBar extends StatelessWidget {
  const CmSearchBar({
    super.key,
    required this.hint,
    required this.onMenu,
    required this.onAccount,
    this.value = '',
    this.onChanged,
  });

  final String hint;
  final String value;
  final ValueChanged<String>? onChanged;
  final VoidCallback onMenu;
  final VoidCallback onAccount;

  @override
  Widget build(BuildContext context) {
    final cm = context.cm;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        color: cm.colors.surface,
        border: Border.fromBorderSide(cm.hairline),
        borderRadius: cm.radius.mdAll,
      ),
      child: Row(
        children: [
          CmIconButton(
            icon: LucideIcons.menu,
            label: 'Menu',
            size: 26,
            onPressed: onMenu,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: CmTextField(
              bare: true,
              hint: hint,
              value: value,
              onChanged: onChanged,
              minHeight: 26,
              textInputAction: TextInputAction.search,
            ),
          ),
          const SizedBox(width: 10),
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: onAccount,
            child: Semantics(
              button: true,
              label: 'Account',
              child: const CmLogo(size: 30),
            ),
          ),
        ],
      ),
    );
  }
}
