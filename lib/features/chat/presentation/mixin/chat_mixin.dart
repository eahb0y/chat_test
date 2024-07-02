import 'dart:async';

import 'package:flutter/cupertino.dart';

mixin ChatMixin{
  late TextEditingController controller;
  late StreamController stream;
  late Timer timer;

  void initController(){
    controller = TextEditingController();
    stream = StreamController();
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      stream.add(timer.tick);
    });
  }

  void disposeController(){
    controller.dispose();
    timer.cancel();
    stream.close();
  }
}