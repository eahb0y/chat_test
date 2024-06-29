import 'dart:async';
import 'package:flutter/cupertino.dart';

class Debouncer {
  static VoidCallback? action;
  static Timer? _timer;

  static run(VoidCallback action) {
    if (null != _timer) {
      _timer?.cancel();
    }
    _timer = Timer(const Duration(milliseconds: 300), action);
  }
}
