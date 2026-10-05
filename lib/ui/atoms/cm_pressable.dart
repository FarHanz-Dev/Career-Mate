import 'package:flutter/widgets.dart';

/// Tap target with a pressed flag, instead of Material ink. Surfaces here are
/// flat, so feedback is a background change driven by [builder].
class CmPressable extends StatefulWidget {
  const CmPressable({
    super.key,
    required this.builder,
    this.onTap,
    this.semanticLabel,
    this.isButton = true,
  });

  final Widget Function(BuildContext context, bool pressed) builder;
  final VoidCallback? onTap;
  final String? semanticLabel;
  final bool isButton;

  @override
  State<CmPressable> createState() => _CmPressableState();
}

class _CmPressableState extends State<CmPressable> {
  bool _pressed = false;

  void _set(bool value) {
    if (_pressed != value) setState(() => _pressed = value);
  }

  @override
  Widget build(BuildContext context) {
    final enabled = widget.onTap != null;
    return Semantics(
      button: widget.isButton,
      enabled: enabled,
      label: widget.semanticLabel,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: widget.onTap,
        onTapDown: enabled ? (_) => _set(true) : null,
        onTapUp: enabled ? (_) => _set(false) : null,
        onTapCancel: enabled ? () => _set(false) : null,
        child: widget.builder(context, _pressed),
      ),
    );
  }
}
