import 'package:flutter/material.dart';

extension BuildContextHelpers on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);
  Size get getSize => mediaQuery.size;
}
