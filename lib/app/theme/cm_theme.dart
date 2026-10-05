import 'package:flutter/material.dart';

import 'tokens.dart';

const _family = 'Archivo';

/// Design tokens and text styles, read through `context.cm`.
@immutable
class CmTheme extends ThemeExtension<CmTheme> {
  const CmTheme({this.colors = CmColors.light, this.radius = CmRadius.soft});

  final CmColors colors;
  final CmRadius radius;

  /// Pass as `height` for the font's own line height. HTML buttons use it,
  /// so chips, tabs and toggles are shorter than 1.55 text.
  static const natural = -1.0;

  /// Body copy. Weights: 400 regular, 600 emphasis. The prototype inherits
  /// `line-height: 1.55` everywhere unless a node overrides it.
  TextStyle body({
    double size = 14,
    FontWeight weight = FontWeight.w400,
    Color? color,
    double? height,
    double? letterSpacing,
  }) => TextStyle(
    // Not inherited: Material's bodyMedium would otherwise leak in its
    // letter spacing (0.25) and line height (1.43).
    inherit: false,
    textBaseline: TextBaseline.alphabetic,
    fontFamily: _family,
    fontSize: size,
    fontWeight: weight,
    color: color ?? colors.text,
    height: height == natural ? null : (height ?? 1.55),
    letterSpacing: letterSpacing ?? 0,
    leadingDistribution: TextLeadingDistribution.even,
  );

  /// Headings and buttons: weight 800. [tracking] is in em, like the CSS.
  TextStyle heading({
    double size = 15,
    Color? color,
    double? height,
    double tracking = 0,
  }) => body(
    size: size,
    weight: FontWeight.w800,
    color: color,
    height: height,
    letterSpacing: tracking * size,
  );

  /// Uppercase section label: 10 to 11px, tracking .1em. Callers uppercase the string.
  TextStyle label({double size = 11, Color? color, double tracking = 0.1}) => body(
    size: size,
    color: color ?? colors.neutral700,
    letterSpacing: tracking * size,
  );

  /// 1px row divider and 2px section rule.
  BorderSide get hairline => BorderSide(color: colors.divider);
  BorderSide get rule => BorderSide(color: colors.divider, width: 2);

  @override
  CmTheme copyWith({CmColors? colors, CmRadius? radius}) =>
      CmTheme(colors: colors ?? this.colors, radius: radius ?? this.radius);

  @override
  CmTheme lerp(ThemeExtension<CmTheme>? other, double t) => this;
}

extension CmThemeContext on BuildContext {
  CmTheme get cm => Theme.of(this).extension<CmTheme>()!;
}
