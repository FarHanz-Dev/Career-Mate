import 'package:flutter/services.dart';

/// Widget tests render every glyph as a wide square unless real fonts are
/// loaded, which makes rows overflow. Load the bundled ones.
Future<void> loadTestFonts() async {
  Future<void> load(String family, List<String> assets) async {
    final loader = FontLoader(family);
    for (final a in assets) {
      loader.addFont(rootBundle.load(a));
    }
    await loader.load();
  }

  await load('Archivo', [
    'assets/fonts/Archivo-Regular.ttf',
    'assets/fonts/Archivo-SemiBold.ttf',
    'assets/fonts/Archivo-ExtraBold.ttf',
  ]);
  await load('packages/lucide_icons_flutter/Lucide', [
    'packages/lucide_icons_flutter/assets/lucide.ttf',
  ]);
}
