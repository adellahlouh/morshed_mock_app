import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Debouncer {
  Debouncer(this.interval);
  final Duration interval;

  VoidCallback? _action;
  Timer? _timer;

  void call(VoidCallback action) {
    // Let the latest action override whatever was there before
    _action = action;
    // Always cancel and restart the timer
    _timer?.cancel();
    _timer = Timer(interval, _callAction);
  }

  void _callAction() {
    _action?.call(); // If we have an action queued up, complete it.
    _timer = null;
  }

  void reset() {
    _action = null;
    _timer = null;
  }
}

Widget getCenterCircularProgress({
  double? padding,
  double? size,
  Color? color,
  double? value,
  double strokeWidth = 3.0,
}) {
  return Container(
    padding: EdgeInsets.all(padding ?? 0.0),
    height: size,
    width: size,
    child: Center(
      child: CircularProgressIndicator(
        value: value,
        strokeWidth: strokeWidth,
        valueColor: color != null ? AlwaysStoppedAnimation<Color>(color) : null,
      ),
    ),
  );
}