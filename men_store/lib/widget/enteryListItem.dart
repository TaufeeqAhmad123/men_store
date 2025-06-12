import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class Enterylistitem extends StatelessWidget {
  final int index;
  final Widget child;
  const Enterylistitem({super.key, required this.index, required this.child});

  @override
  Widget build(BuildContext context) {
    return AnimationConfiguration.staggeredList(
      position: index,
      delay: const Duration(milliseconds: 100),

      child: SlideAnimation(
        verticalOffset: -100,
        duration: const Duration(milliseconds: 2500),
        curve: Curves.fastLinearToSlowEaseIn,

        child: FadeInAnimation(
          curve: Curves.fastLinearToSlowEaseIn,
          duration: const Duration(milliseconds: 2500),
          child: child,
        ),
      ),
    );
  }
}
