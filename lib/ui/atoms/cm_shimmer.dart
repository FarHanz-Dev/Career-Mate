import 'package:flutter/widgets.dart';

import '../../app/theme/cm_theme.dart';

/// Pulses its child between 35% and 100% opacity (`cmShimmer` in the prototype).
class CmShimmer extends StatefulWidget {
  const CmShimmer({
    super.key,
    required this.child,
    this.period = const Duration(milliseconds: 1100),
    this.delay = Duration.zero,
  });

  final Widget child;
  final Duration period;
  final Duration delay;

  @override
  State<CmShimmer> createState() => _CmShimmerState();
}

class _CmShimmerState extends State<CmShimmer> with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: widget.period,
  );

  @override
  void initState() {
    super.initState();
    if (widget.delay == Duration.zero) {
      _controller.repeat();
    } else {
      Future<void>.delayed(widget.delay, () {
        if (mounted) _controller.repeat();
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => AnimatedBuilder(
    animation: _controller,
    child: widget.child,
    builder: (context, child) {
      final t = _controller.value;
      final wave = Curves.ease.transform(t < 0.5 ? t * 2 : (1 - t) * 2);
      return Opacity(opacity: 0.35 + 0.65 * wave, child: child);
    },
  );
}

/// A solid shimmering block, used for the reading-state placeholder lines.
class CmShimmerBar extends StatelessWidget {
  const CmShimmerBar({super.key, required this.widthFactor, required this.height, this.delay = Duration.zero});

  final double widthFactor;
  final double height;
  final Duration delay;

  @override
  Widget build(BuildContext context) => FractionallySizedBox(
    widthFactor: widthFactor,
    alignment: Alignment.centerLeft,
    child: CmShimmer(
      delay: delay,
      child: SizedBox(height: height, child: ColoredBox(color: context.cm.colors.neutral300)),
    ),
  );
}
