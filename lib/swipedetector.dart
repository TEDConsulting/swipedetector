library swipedetector;

import 'package:flutter/material.dart';

class SwipeConfiguration {
  double verticalSwipeMaxWidthThreshold = 50.0;
  double verticalSwipeMinDisplacement = 100.0;
  double verticalSwipeMinVelocity = 300.0;

  SwipeConfiguration({
    double verticalSwipeMaxWidthThreshold,
    double verticalSwipeMinDisplacement,
    double verticalSwipeMinVelocity,
  }) {
    if (verticalSwipeMaxWidthThreshold != null) {
      this.verticalSwipeMaxWidthThreshold = verticalSwipeMaxWidthThreshold;
    }

    if (verticalSwipeMinDisplacement != null) {
      this.verticalSwipeMinDisplacement = verticalSwipeMinDisplacement;
    }

    if (verticalSwipeMinVelocity != null) {
      this.verticalSwipeMinVelocity = verticalSwipeMinVelocity;
    }
  }
}

class SwipeDetector extends StatelessWidget {
  final Widget child;
  final Function() onSwipeUp;
  final Function() onSwipeDown;
  final Function() onSwipeLeft;
  final Function() onSwipeRight;
  final SwipeConfiguration swipeConfiguration;

  SwipeDetector(
      {@required this.child,
      this.onSwipeUp,
      this.onSwipeDown,
      this.onSwipeLeft,
      this.onSwipeRight,
      SwipeConfiguration swipeConfiguration})
      : this.swipeConfiguration = swipeConfiguration == null
            ? SwipeConfiguration()
            : swipeConfiguration;

  @override
  Widget build(BuildContext context) {
    DragStartDetails _startVerticalDragDetails;
    DragUpdateDetails _updateVerticalDragDetails;

    return GestureDetector(
      child: child,
      onVerticalDragStart: (dragDetails) {
        _startVerticalDragDetails = dragDetails;
      },
      onVerticalDragUpdate: (dragDetails) {
        _updateVerticalDragDetails = dragDetails;
      },
      onVerticalDragEnd: (endDetails) {
        double dx = _updateVerticalDragDetails.globalPosition.dx -
            _startVerticalDragDetails.globalPosition.dx;
        double dy = _updateVerticalDragDetails.globalPosition.dy -
            _startVerticalDragDetails.globalPosition.dy;
        double velocity = endDetails.primaryVelocity;

        if (dx < 0) dx = -dx;
        if (dy < 0) dy = -dy;
        double positiveVelocity = velocity < 0 ? -velocity : velocity;

        if (dx > swipeConfiguration.verticalSwipeMaxWidthThreshold) return;
        if (dy < swipeConfiguration.verticalSwipeMinDisplacement) return;
        if (positiveVelocity < swipeConfiguration.verticalSwipeMinVelocity)
          return;

        if (velocity < 0) {
          //Swipe Up
          if (onSwipeUp != null) {
            onSwipeUp();
          }
        } else {
          //Swipe Down
          if (onSwipeDown != null) {
            onSwipeDown();
          }
        }
      },
    );
  }
}
