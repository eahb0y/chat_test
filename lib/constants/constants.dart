import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Constants {}

class FirebaseInstance {
  static FirebaseAuth authFireBase = FirebaseAuth.instance;
  static FirebaseFirestore  cloudFireBase = FirebaseFirestore.instance;
}

class Validations {
  static const someThingWentWrong = 'Something went wrong!';
}

class AppKeys{
static const EMAIL = "email";
static const PASSWORD = "password";
}

class FireBaseCollection{
  static const String chatsBaseCollection = "chats";
  static const String usersBaseCollection = "users";
  static const String conversationBaseCollection = "conversations";
}

class FirebaseAuthErrors{
  static const String alreadyExists = "email-already-in-use";
  static const String invalidError = "invalid-email";
  static const String weakPassword = "weak-password";
  static const String wrongPassword = "wrong-password";
  static const String disableUser = "user-disabled";
  static const String userNotFound = "user-not-found";
}