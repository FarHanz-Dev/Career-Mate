import 'package:flutter/material.dart';

import 'cm_theme.dart';
import 'tokens.dart';

/// Material 3 base with a flat, custom skin. Components in `ui/` draw their
/// own surfaces, so only the global defaults live here.
ThemeData buildAppTheme({CmRadius radius = CmRadius.soft}) {
  const c = CmColors.light;
  final scheme = ColorScheme.light(
    primary: c.accent,
    onPrimary: c.bg,
    secondary: c.accent700,
    onSecondary: c.bg,
    surface: c.bg,
    onSurface: c.text,
    surfaceContainerHighest: c.surface,
    outline: c.divider,
    error: c.accent700,
  );

  return ThemeData(
    useMaterial3: true,
    colorScheme: scheme,
    fontFamily: 'Archivo',
    scaffoldBackgroundColor: c.bg,
    canvasColor: c.bg,
    splashFactory: NoSplash.splashFactory,
    highlightColor: c.surface,
    hoverColor: Colors.transparent,
    dividerColor: c.divider,
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: c.accent,
      selectionColor: c.accent.withValues(alpha: 0.3),
      selectionHandleColor: c.accent,
    ),
    textTheme: Typography.blackMountainView
        .apply(fontFamily: 'Archivo', bodyColor: c.text, displayColor: c.text),
    extensions: [CmTheme(colors: c, radius: radius)],
  );
}
