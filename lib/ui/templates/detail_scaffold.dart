import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../app/theme/cm_theme.dart';
import '../atoms/cm_icon_button.dart';

/// Pushed screen: back bar (title, optional subtitle, trailing actions) over a
/// body. [bottom] is pinned under the body (the improve screen's save bar).
class DetailScaffold extends StatelessWidget {
  const DetailScaffold({
    super.key,
    required this.title,
    required this.onBack,
    required this.body,
    this.subtitle,
    this.actions = const [],
    this.bottom,
    this.titleSize = 16,
    this.gap = 8,
  });

  final String title;
  final String? subtitle;
  final VoidCallback onBack;
  final List<Widget> actions;
  final Widget body;
  final Widget? bottom;
  final double titleSize;
  final double gap;

  @override
  Widget build(BuildContext context) {
    final cm = context.cm;
    return Scaffold(
      backgroundColor: cm.colors.bg,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(border: Border(bottom: cm.rule)),
              child: Row(
                spacing: gap,
                children: [
                  CmIconButton(icon: LucideIcons.arrowLeft, label: 'Back', onPressed: onBack),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: cm.heading(size: titleSize),
                        ),
                        if (subtitle != null)
                          Text(
                            subtitle!,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: cm.body(size: 11, color: cm.colors.neutral700),
                          ),
                      ],
                    ),
                  ),
                  ...actions,
                ],
              ),
            ),
            Expanded(child: body),
            ?bottom,
          ],
        ),
      ),
    );
  }
}
