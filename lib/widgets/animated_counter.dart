import 'package:flutter/material.dart';

class AnimatedCount extends ImplicitlyAnimatedWidget {
  final num count;
  final Color? color;
  const AnimatedCount({
    super.key,
    required this.count,
    this.color,
    super.duration = const Duration(milliseconds: 600),
    super.curve = Curves.fastOutSlowIn,
  });

  @override
  ImplicitlyAnimatedWidgetState<ImplicitlyAnimatedWidget> createState() {
    return _AnimatedCountState();
  }
}

class _AnimatedCountState extends AnimatedWidgetBaseState<AnimatedCount> {
  IntTween _intCount = IntTween(begin: 0, end: 1);
  Tween<double> _doubleCount = Tween<double>(begin: 0, end: 1);

  @override
  void initState() {
    super.initState();
    if (widget.count is int) {
      _intCount = IntTween(begin: 0, end: widget.count.toInt());
    } else {
      _doubleCount = Tween<double>(begin: 0, end: widget.count.toDouble());
    }
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    final String text;
    if (widget.count is int) {
      final countStr = _intCount.evaluate(animation).toString();
      text = countStr;
    } else {
      final countStr = _doubleCount.evaluate(animation).toStringAsFixed(1);
      text = countStr;
    }

    return Text(
      text,
      style: TextStyle(
        color: widget.color ?? Colors.white,
        fontSize: 50,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  @override
  void forEachTween(TweenVisitor<dynamic> visitor) {
    if (widget.count is int) {
      _intCount = visitor(
        _intCount,
        widget.count,
        (dynamic value) => IntTween(begin: value),
      ) as IntTween;
    } else {
      _doubleCount = visitor(
        _doubleCount,
        widget.count,
        (dynamic value) => Tween<double>(begin: value),
      ) as Tween<double>;
    }
  }
}
