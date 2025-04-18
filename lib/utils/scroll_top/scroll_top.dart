import 'package:flutter/material.dart';

/// Scrolls the given controller to the top with an animation.
///
/// [controller] is the ScrollController to be animated.
/// The animation duration is 400ms using easeInOut curve.
void scrollToTop(ScrollController controller) {
  controller.animateTo(
    0,
    duration: const Duration(milliseconds: 400),
    curve: Curves.easeInOut,
  );
}
