import 'package:flutter/widgets.dart';

import '../../app/theme/cm_theme.dart';
import '../../app/theme/tokens.dart';
import '../atoms/cm_button.dart';

/// Dark confirmation bar with an OK action. Rises in over 180ms.
class ToastBubble extends StatelessWidget {
  const ToastBubble({super.key, required this.text, required this.onDismiss});

  final String text;
  final VoidCallback onDismiss;

  @override
  Widget build(BuildContext context) {
    final cm = context.cm;
    final c = cm.colors;
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0, end: 1),
      duration: const Duration(milliseconds: 180),
      curve: Curves.easeOut,
      builder: (context, t, child) => Opacity(
        opacity: t,
        child: Transform.translate(offset: Offset(0, 14 * (1 - t)), child: child),
      ),
      child: Semantics(
        liveRegion: true,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 13),
          decoration: BoxDecoration(
            color: c.neutral900,
            borderRadius: cm.radius.mdAll,
            boxShadow: cmShadowLg,
          ),
          child: Row(
            spacing: 10,
            children: [
              SizedBox.square(dimension: 8, child: ColoredBox(color: c.accent500)),
              Expanded(
                child: Text(
                  text,
                  style: cm.body(size: 13, color: const Color(0xFFFFFFFF)),
                ),
              ),
              CmButton(
                label: 'OK',
                variant: CmButtonVariant.ghost,
                textColor: c.accent400,
                onPressed: onDismiss,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
