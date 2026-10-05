import 'package:flutter/widgets.dart';

import '../../app/theme/cm_theme.dart';

/// 34x44 file thumbnail with the extension at the bottom.
class CmFileIcon extends StatelessWidget {
  const CmFileIcon(this.ext, {super.key, this.rounded = false});

  final String ext;
  final bool rounded;

  @override
  Widget build(BuildContext context) {
    final cm = context.cm;
    return Container(
      width: 34,
      height: 44,
      alignment: Alignment.bottomCenter,
      padding: const EdgeInsets.only(bottom: 3),
      decoration: BoxDecoration(
        color: cm.colors.surface,
        border: Border.fromBorderSide(cm.hairline),
        borderRadius: rounded ? cm.radius.smAll : null,
      ),
      child: Text(
        ext.toUpperCase(),
        style: cm.body(size: 8, color: cm.colors.neutral700, letterSpacing: 0.48, height: CmTheme.natural),
      ),
    );
  }
}
