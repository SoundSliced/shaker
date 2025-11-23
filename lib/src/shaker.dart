import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class Shaker extends StatelessWidget {
  final Widget child;
  final bool isShaking;
  final Duration? duration;
  final Function? onComplete;
  final Curve? curve;
  final double? hz;
  final double? rotation;
  final Offset? offset;

  const Shaker({
    super.key,
    required this.child,
    this.isShaking = false,
    this.duration,
    this.onComplete,
    this.curve,
    this.hz,
    this.rotation,
    this.offset,
  });

  @override
  Widget build(BuildContext context) {
    return child.animate(
      effects: isShaking == true
          ? [
              ShakeEffect(
                duration: duration ?? const Duration(milliseconds: 1500),
                curve: curve ?? Curves.easeInOut,
                hz: hz ?? 4,
                rotation: rotation ?? -0.03,
                offset: offset ?? const Offset(0.2, 0.5),
              ),
            ]
          : null,
      onComplete: (controller) => onComplete?.call(),
    );
  }
}
