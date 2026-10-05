import 'package:flutter/widgets.dart';

import '../../app/theme/cm_theme.dart';

/// Rows are separated by 1px dividers and sections by 2px rules.
class CmDivider extends StatelessWidget {
  const CmDivider({super.key, this.thick = false});

  final bool thick;

  @override
  Widget build(BuildContext context) =>
      SizedBox(height: thick ? 2 : 1, child: ColoredBox(color: context.cm.colors.divider));
}
