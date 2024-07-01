import 'package:flutter/cupertino.dart';

mixin ChatMixin{
  late TextEditingController controller;

  void initController(){
    controller = TextEditingController();
  }

  void disposeController(){
    controller.dispose();
  }
}