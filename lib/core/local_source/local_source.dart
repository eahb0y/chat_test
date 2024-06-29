import 'package:chat_test/constants/constants.dart';
import 'package:hive/hive.dart';

class LocalSource {
  final Box<dynamic> box;

  LocalSource(this.box);

  void setUserEmail(String email) {
    box.put(AppKeys.EMAIL, email);
  }

  String getUserEmail() {
    return box.get(AppKeys.EMAIL) ?? "";
  }

  void setUserPassword(String password) {
    box.put(AppKeys.PASSWORD, password);
  }

  String getUserPassword() {
    return box.get(AppKeys.PASSWORD) ?? "";
  }
}
