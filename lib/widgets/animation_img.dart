import 'package:flutter/material.dart';

class CustomTransition extends StatelessWidget {
  final Animation<double> animation;
  final Widget child;

  const CustomTransition({
    super.key,
    required this.animation,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, _) {
        final scale = Tween<double>(begin: 2, end: 1).animate(animation);
        final rotate = Tween<double>(begin: 0, end: -3.141592653589793 / 2)
            .animate(animation);

        return Center(
          child: Transform.scale(
            scale: scale.value,
            child: Transform.rotate(
              angle: rotate.value,
              child: child,
            ),
          ),
        );
      },
    );
  }
}
