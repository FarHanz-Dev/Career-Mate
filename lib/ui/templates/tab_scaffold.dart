import 'package:flutter/widgets.dart';

import '../../app/theme/cm_theme.dart';

/// Body of a bottom-tab screen: a pinned [header], then the list with an
/// optional [floating] layer (the FAB) stacked above it. The tab bar and
/// drawer belong to the shell, not to this template.
class TabScaffold extends StatelessWidget {
  const TabScaffold({super.key, required this.header, required this.body, this.floating});

  final Widget header;
  final Widget body;

  /// Positioned children laid over [body].
  final List<Widget>? floating;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          header,
          Expanded(
            child: Stack(children: [Positioned.fill(child: body), ...?floating]),
          ),
        ],
      ),
    );
  }
}

/// Search bar (and chips) block: 14px gutters, 2px rule underneath.
class TabHeader extends StatelessWidget {
  const TabHeader({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(14, 14, 14, 12),
      decoration: BoxDecoration(border: Border(bottom: context.cm.rule)),
      child: child,
    );
  }
}
