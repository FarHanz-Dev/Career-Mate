import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../ui/organisms/toast_bubble.dart';
import '../router.dart';
import 'toast_controller.dart';

/// Draws the current toast above every route. On the tab screens it sits
/// above the FAB (140px up); elsewhere 24px above the bottom edge.
class ToastHost extends ConsumerWidget {
  const ToastHost({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final toast = ref.watch(toastProvider);
    return Stack(
      fit: StackFit.expand,
      children: [
        child,
        if (toast != null) _ToastLayer(toast: toast),
      ],
    );
  }
}

class _ToastLayer extends ConsumerWidget {
  const _ToastLayer({required this.toast});

  final ToastMessage toast;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    final safeBottom = MediaQuery.viewPaddingOf(context).bottom;

    return ListenableBuilder(
      listenable: router.routerDelegate,
      builder: (context, _) {
        final path = router.routerDelegate.currentConfiguration.uri.path;
        final aboveFab = tabPaths.contains(path);
        return Positioned(
          left: 14,
          right: 14,
          bottom: safeBottom + (aboveFab ? 140 : 24),
          child: Material(
            type: MaterialType.transparency,
            child: ToastBubble(
              key: ValueKey(toast.id),
              text: toast.text,
              onDismiss: ref.read(toastProvider.notifier).hide,
            ),
          ),
        );
      },
    );
  }
}
