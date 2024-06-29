import 'package:flutter/cupertino.dart';

mixin AuthMixin {
  late TextEditingController emailController;
  late TextEditingController userNameController;
  late TextEditingController passwordController;

  void initController() {
    emailController = TextEditingController();
    userNameController = TextEditingController();
    passwordController = TextEditingController();
  }

  void disposeController() {
    emailController.dispose();
    userNameController.dispose();
    passwordController.dispose();
  }
}
