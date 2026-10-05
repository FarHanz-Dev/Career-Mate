import 'package:flutter/painting.dart';

/// Raw design tokens from the handoff README. Widgets never read these
/// directly: they go through [CmTheme] (see `cm_theme.dart`).
class CmColors {
  const CmColors({
    this.accent = const Color(0xFF0A66C2),
    this.accent100 = const Color(0xFFEEF5FC),
    this.accent200 = const Color(0xFFD7E8F8),
    this.accent300 = const Color(0xFFB0D2F2),
    this.accent400 = const Color(0xFF6EA9E3),
    this.accent500 = const Color(0xFF2D80D2),
    this.accent700 = const Color(0xFF084F97),
    this.accent800 = const Color(0xFF073A6E),
    this.accent900 = const Color(0xFF0A2B4F),
    this.bg = const Color(0xFFF3F2F2),
    this.surface = const Color(0xFFEAE9E9),
    this.text = const Color(0xFF201E1D),
    this.divider = const Color(0x66201E1D), // text at 40%
    this.neutral100 = const Color(0xFFF8F4F4),
    this.neutral300 = const Color(0xFFD7D3D3),
    this.neutral400 = const Color(0xFFBAB6B6),
    this.neutral500 = const Color(0xFF9B9797),
    this.neutral600 = const Color(0xFF7D7979),
    this.neutral700 = const Color(0xFF605D5D),
    this.neutral800 = const Color(0xFF444141),
    this.neutral900 = const Color(0xFF2D2B2B),
    this.scrim = const Color(0x732D2B2B), // 45%, FAB menu backdrop
    this.scrimDrawer = const Color(0x802D2B2B), // 50%, drawer backdrop
  });

  final Color accent;
  final Color accent100, accent200, accent300, accent400, accent500;
  final Color accent700, accent800, accent900;
  final Color bg, surface, text, divider;
  final Color neutral100, neutral300, neutral400, neutral500, neutral600;
  final Color neutral700, neutral800, neutral900;
  final Color scrim, scrimDrawer;

  static const light = CmColors();
}

/// Corner radii. "Soft" is the default; the prototype also ships Sharp and Rounded.
class CmRadius {
  const CmRadius({required this.sm, required this.md, required this.lg});

  final double sm, md, lg;

  static const soft = CmRadius(sm: 3, md: 5, lg: 7);
  static const sharp = CmRadius(sm: 0, md: 0, lg: 0);
  static const rounded = CmRadius(sm: 8, md: 12, lg: 16);

  BorderRadius get smAll => BorderRadius.circular(sm);
  BorderRadius get mdAll => BorderRadius.circular(md);
  BorderRadius get lgAll => BorderRadius.circular(lg);
}

/// 4px spacing scale. The standard screen gutter is [s4].
abstract class CmSpace {
  static const s1 = 4.0, s2 = 8.0, s3 = 12.0, s4 = 16.0, s5 = 20.0, s6 = 24.0, s8 = 32.0;
}

/// Floating layers only (drawer, FAB menu, toast): `0 12px 32px rgba(45,43,43,.22)`.
const cmShadowLg = [
  BoxShadow(color: Color(0x382D2B2B), blurRadius: 32, offset: Offset(0, 12)),
];

/// FAB shadow from the prototype: `0 3px 10px rgba(45,43,43,.16)`.
const cmShadowMd = [
  BoxShadow(color: Color(0x292D2B2B), blurRadius: 10, offset: Offset(0, 3)),
];
