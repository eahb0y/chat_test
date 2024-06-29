import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Constants {}

class Firebase {
  static FirebaseAuth authFireBase = FirebaseAuth.instance;
  static FirebaseFirestore cloudFireBase = FirebaseFirestore.instance;
}

class Validations {
  static const someThingWentWrong = 'Something went wrong!';
}

class AppKeys{
static const EMAIL = "email";
static const PASSWORD = "password";
}
