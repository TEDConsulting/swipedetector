# swipedetector

A Flutter package to detect up, down, left, right swipes.

## Getting Started

For help getting started with Flutter, view our online
[documentation](https://flutter.io/).

## Usage

Using `SwipeDetector` is straightforward, just wrap it around the `Widget` you want to detect swipes on.

```dart
SwipeDetector(
    child: ... //You Widget Tree here
    ),
    onSwipeUp: () {
        setState(() {
            _swipeDirection = "Swipe Up";
        });
    },
    onSwipeDown: () {
        setState(() {
            _swipeDirection = "Swipe Down";
        });
    },
)
```