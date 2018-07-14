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
    onSwipeLeft: () {
      setState(() {
        _swipeDirection = "Swipe Left";
      });
    },
    onSwipeRight: () {
      setState(() {
        _swipeDirection = "Swipe Right";
      });
    },
)
```

### Configuration Options
In case you don't require the default configuration and want to tune the sensitivity of swipes, you can pass your own configuration values.

```dart
SwipeDetector(
    child: ... //You Widget Tree here
    ),
    onSwipeUp: ...
    onSwipeDown: ...
    onSwipeLeft: ...
    onSwipeRight: ...,
    swipeConfiguration: SwipeConfiguration(
      verticalSwipeMinVelocity: 100.0,
      verticalSwipeMinDisplacement: 50.0,
      verticalSwipeMaxWidthThreshold:100.0,
      horizontalSwipeMaxHeightThreshold: 50.0,
      horizontalSwipeMinDisplacement:50.0,
      horizontalSwipeMinVelocity: 200.0),
    ),
)
```

All the parameters are optional, so you can register for any swipe direction and provide any configuration value.

Here is a simple example. Copy and Past to run it.

```dart
import 'package:flutter/material.dart';
import 'package:swipedetector/swipedetector.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _swipeDirection = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Container(
          child: Row(
            children: <Widget>[
              Expanded(
                child: SwipeDetector(
                  child: Card(
                    child: Container(
                      padding: EdgeInsets.only(
                        top: 80.0,
                        bottom: 80.0,
                        left: 16.0,
                        right: 16.0,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text(
                            'Swipe Me!',
                            style: TextStyle(
                              fontSize: 40.0,
                            ),
                          ),
                          Text(
                            '$_swipeDirection',
                            style: TextStyle(),
                          ),
                        ],
                      ),
                    ),
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
                  onSwipeLeft: () {
                    setState(() {
                      _swipeDirection = "Swipe Left";
                    });
                  },
                  onSwipeRight: () {
                    setState(() {
                      _swipeDirection = "Swipe Right";
                    });
                  },
                  swipeConfiguration: SwipeConfiguration(
                      verticalSwipeMinVelocity: 100.0,
                      verticalSwipeMinDisplacement: 50.0,
                      verticalSwipeMaxWidthThreshold:100.0,
                      horizontalSwipeMaxHeightThreshold: 50.0,
                      horizontalSwipeMinDisplacement:50.0,
                      horizontalSwipeMinVelocity: 200.0),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
``` 