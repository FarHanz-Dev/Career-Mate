import 'package:flutter/widgets.dart';

import '../../app/theme/cm_theme.dart';

/// Uppercase section label: 10 to 11px, tracking .1em, neutral-700 or accent-700.
class CmLabel extends StatelessWidget {
  const CmLabel(this.text, {super.key, this.size = 11, this.color, this.tracking = 0.1});

  final String text;
  final double size;
  final Color? color;
  final double tracking;

  @override
  Widget build(BuildContext context) => Text(
    text.toUpperCase(),
    style: context.cm.label(size: size, color: color, tracking: tracking),
  );
}
