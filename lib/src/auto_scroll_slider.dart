import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

/// AutoScrollSlider is a widget that automatically scrolls through a list of items.
/// Animation is used to scroll through the list of items.
/// The list of items is displayed in a [ListView].

class AutoScrollSlider extends StatefulWidget {
  /// The length of the list of items.
  final int length;

  /// The controller for the [ListView].
  final ScrollController scrollController;

  /// Whether the [ListView] scrolls in the reading direction.
  final bool? reverse;

  /// The curve to use in the animation.
  final Curve? curve;

  /// The duration of the animation.
  final int? duration;

  /// The direction in which the [ListView] scrolls.
  final Axis? scrollDirection;

  /// The builder for the [ListView].
  /// The builder is a callback function that returns a widget for each item in the list of items.
  /// The builder is called for each item in the list of items.
  /// The builder is called with the following parameters:
  /// [BuildContext] context, [int] index.
  /// The builder returns a widget for each item in the list of items.
  final Widget? Function(BuildContext context, int index) itemBuilder;

  /// The drag start behavior for the [ListView].
  final DragStartBehavior? dragStartBehavior;

  /// The padding for the [ListView].
  final EdgeInsetsGeometry? padding;

  /// Whether the [ListView] should shrink-wrap its contents.
  final bool? shrinkWrap;

  const AutoScrollSlider({
    super.key,
    required this.length,
    required this.scrollController,
    this.reverse,
    this.curve,
    this.duration,
    this.scrollDirection,
    required this.itemBuilder,
    this.dragStartBehavior,
    this.padding,
    this.shrinkWrap,
  });

  @override
  State<AutoScrollSlider> createState() => _AutoScrollSliderState();
}

class _AutoScrollSliderState extends State<AutoScrollSlider> {
  @override

  /// Initializes the state of the [AutoScrollSlider].
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      /// The minimum scroll extent of the [ListView].
      double minScrollExtent1 =
          widget.scrollController.position.minScrollExtent;

      /// The maximum scroll extent of the [ListView].
      double maxScrollExtent1 =
          widget.scrollController.position.maxScrollExtent;

      /// Animates the [ListView] to the maximum and minimum scroll extents.
      animateToMaxMin(
          scrollController: widget.scrollController,
          direction: maxScrollExtent1,
          max: maxScrollExtent1,
          min: minScrollExtent1,
          sec: widget.duration ?? 15);
    });
    super.initState();
  }

  /// Animates the [ListView] to the maximum and minimum scroll extents.
  /// The [ListView] scrolls in the reading direction.
  /// The duration of the animation is 15 seconds.
  /// The [ListView] scrolls to the maximum scroll extent and then to the minimum scroll extent.
  /// The animation is repeated indefinitely.
  animateToMaxMin(
      {double? max,
      double? min,
      double? direction,
      int? sec,
      ScrollController? scrollController}) {
    scrollController!
        .animateTo(direction!,
            duration: Duration(seconds: sec!),
            curve: widget.curve ?? Curves.linear)
        .then((value) {
      direction = direction == max ? min : max;
      animateToMaxMin(
          sec: sec,
          min: min,
          max: max,
          scrollController: scrollController,
          direction: direction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WidgetsListView(
        length: widget.length,
        scrollController: widget.scrollController,
        reverse: widget.reverse,
        scrollDirection: widget.scrollDirection,
        itemBuilder: widget.itemBuilder,
        dragStartBehavior: widget.dragStartBehavior,
        padding: widget.padding,
        shrinkWrap: widget.shrinkWrap,
      ),
    );
  }
}

class WidgetsListView extends StatelessWidget {
  /// The controller for the [ListView].
  final ScrollController scrollController;

  /// The length of the list of items.
  final int length;

  /// Whether the [ListView] scrolls in the reading direction.
  final bool? reverse;

  /// The direction in which the [ListView] scrolls.
  final Axis? scrollDirection;

  /// The builder for the [ListView].
  final Widget? Function(BuildContext context, int index) itemBuilder;

  /// The drag start behavior for the [ListView].
  final DragStartBehavior? dragStartBehavior;

  /// The padding for the [ListView].
  final EdgeInsetsGeometry? padding;

  /// Whether the [ListView] should shrink-wrap its contents.
  final bool? shrinkWrap;

  const WidgetsListView(
      {Key? key,
      required this.scrollController,
      required this.length,
      this.reverse,
      this.scrollDirection,
      required this.itemBuilder,
      this.dragStartBehavior,
      this.padding,
      this.shrinkWrap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      /// The [ScrollConfiguration] widget is used to configure the scrolling behavior of the [ListView].
      behavior: ScrollConfiguration.of(context).copyWith(
          scrollbars: false,
          dragDevices: {PointerDeviceKind.unknown},
          physics: const NeverScrollableScrollPhysics()),

      /// The [ListView] is displayed in a [ScrollConfiguration] widget.
      /// The [ListView] is displayed in a [ListView.builder] widget.
      child: ListView.builder(
        padding: EdgeInsets.zero,
        controller: scrollController,
        shrinkWrap: shrinkWrap ?? true,
        dragStartBehavior: DragStartBehavior.start,
        reverse: reverse ?? false,
        scrollDirection: scrollDirection ?? Axis.vertical,
        itemCount: length,
        itemBuilder: itemBuilder,
      ),
    );
  }
}
