import 'package:flutter/material.dart';

extension GlobalExtensions on BuildContext {
  Size get screenSize => MediaQuery.sizeOf(this);
  double get width => screenSize.width;
  double get height => screenSize.height;
}
