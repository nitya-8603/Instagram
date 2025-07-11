import 'package:flutter/material.dart';

class LikesAnimation extends StatefulWidget {
  final Widget child;
  final bool isAnimating;
  final Duration duration;
  final VoidCallback? onEnd;
  final bool smallLike;
  const LikesAnimation({
    Key? key,
    required this.child,
    this.duration = const Duration(milliseconds: 150),
    required this.isAnimating,
    this.onEnd,
    this.smallLike = false,
  }) : super(key: key);

  @override
  State<LikesAnimation> createState() => _LikesAnimationState();
}

class _LikesAnimationState extends State<LikesAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> scale;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: widget.duration.inMilliseconds ~/ 2),
    );
    scale = Tween<double>(begin: 1, end: 1.2).animate(controller);
  }

  @override
  void didUpdateWidget(covariant LikesAnimation oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);

    if (widget.isAnimating != oldWidget.isAnimating) {
      startAnimation();
    }
  }

  startAnimation() async {
    if (widget.isAnimating || widget.smallLike) {
      await controller.forward();
      await controller.reverse();
      await Future.delayed(const Duration(milliseconds: 200));
      if (widget.onEnd != null) {
        widget.onEnd!();
      }
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(scale: scale, child: widget.child);
  }
}
