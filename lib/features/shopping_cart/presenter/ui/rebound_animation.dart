import 'package:flutter/material.dart';

class ReboundAnimation extends StatelessWidget {
  const ReboundAnimation({
    Key key,
    @required this.child,
    this.duration = const Duration(
      milliseconds: 1350,
    ),
    this.offset = 140.0,
    this.axis = Axis.horizontal,
  }) : super(key: key);

  final Widget child;
  final Duration duration;
  final double offset;
  final Axis axis;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      duration: duration,
      curve: Curves.elasticOut,
      tween: Tween<double>(begin: 1.0, end: 0.0),
      builder: (_, double value, Widget child) {
        return Transform.translate(
          offset: axis == Axis.horizontal
              ? Offset(
                  value * offset,
                  0.0,
                )
              : Offset(
                  0.0,
                  value * offset,
                ),
          child: child,
        );
      },
      child: child,
    );
  }
}
