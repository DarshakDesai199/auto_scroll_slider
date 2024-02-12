![Alt Text](https://fluttercommunity.dev/_github/header/Auto-Scroll-Slider)

[![View on GitHub](https://github.com/SimformSolutionsPvtLtd/flutter_showcaseview/workflows/Build/badge.svg?branch=master)](https://github.com/DarshakDesai199/auto_scroll_slider)
[![View on GitHub](https://img.shields.io/pub/v/auto_scroll_slider?label=auto_scroll_slider)](https://pub.dev/packages/auto_scroll_slider)
[![View on Linkedin](https://img.shields.io/badge/Dev:-Darshak_Desai-blue.svg)](https://in.linkedin.com/in/darshak-desai-17251823b)
[![View on Github](https://img.shields.io/pub/points/auto_scroll_slider?color=FF474C&label=pub%20points)](https://pub.dev/packages/auto_scroll_slider/score)

## Preview
    
![Alt Text](https://github.com/DarshakDesai199/auto_scroll_slider/blob/main/preview/preview.gif)

## auto scroll slider Package

The Auto Scroll Slider package for Flutter provides a convenient solution for creating
auto-scrolling image lists with an animated interface, enhancing user experience and visual appeal.

## Installing

Add dependency to ```pubspec.yaml```
To use the latest version of `auto_scroll_slider`, add the following line to your `pubspec.yaml`
file:

```yaml
dependencies:
  auto_scroll_slider: ^1.0.1
```

Install it
You can install packages from the command line:
with ```Flutter```:

```shell    
$ flutter pub get
```

Import the package

```dart
import 'package:auto_scroll_slider/auto_scroll_slider.dart';
```

## Usage

```dart
AutoScroll(
length: list.length,
scrollController: scrollController,
reverse: true,
itemBuilder: (context, index) {
return Image.network(
list[index],
height: 250,
width: 400,
fit: BoxFit.cover);}
);
```

## Properties of ```Auro Scroll Slider```:

| Property Name     | Type                                | Default Value | Description                                                                                    |
|-------------------|-------------------------------------|---------------|------------------------------------------------------------------------------------------------|
| length            | int                                 | -             | The number of items in the list.                                                               |
| scrollController  | ScrollController                    | -             | Controller for the scroll position of the list.                                                |
| reverse           | bool?                               | -             | Whether the list should be displayed in reverse order.                                         |
| curve             | Curve?                              | -             | The curve to use for the animation.                                                            |
| duration          | int?                                | -             | The duration of the scroll animation.                                                          |
| scrollDirection   | Axis?                               | -             | The axis along which the list scrolls.                                                         |
| itemBuilder       | Widget? Function(BuildContext, int) | -             | A function that returns a widget for each item in the list.                                    |
| dragStartBehavior | DragStartBehavior?                  | -             | Determines the way drag start behavior is handled.                                             |
| padding           | EdgeInsetsGeometry?                 | -             | Padding around the list.                                                                       |
| shrinkWrap        | bool?                               | -             | Whether the extent of the scroll view should be determined by the contents of the scroll view. |

## Example

```dart
import 'package:auto_scroll_slider/auto_scroll_slider.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List A = [];

  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Expanded(
          child: AutoScrollSlider(
            length: A.length,
            scrollController: scrollController,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Image.network(
                  A[index],
                  height: 250,
                  width: 400,
                  fit: BoxFit.cover,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

```

## Support

For any inquiries or issues regarding the Auto Scroll Slider package, feel free
to [open an issue](https://github.com/DarshakDesai199/auto_scroll_slider/issues) on GitHub.

## License

This package is released under
the [MIT License](https://pub.dev/packages/auto_scroll_slider/license).

## Additional Information

👍 We're thrilled that our solution is adding value and positively impacting your project! ✨ Your
support means the world to us. 🌟 If you're loving the results, show your appreciation with a thumbs
up! 💫 We're committed to excellence and continuously strive to exceed your expectations. Thank you
for choosing us! 🚀

**-Darshak Desai**
