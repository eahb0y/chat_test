import 'package:chat_test/app.dart';
import 'package:chat_test/injection_container.dart' as di;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
    apiKey: 'AIzaSyBLShbHzwPsTn6gx-xqImsWtNc3J0pSzZ0',
    appId: 'id',
    messagingSenderId: 'sendid',
    projectId: 'chat-33025',
    storageBucket: 'myapp-b9yt18.appspot.com',
  ));
  await di.init();
  FirebaseFirestore.instance.settings = const Settings(
    persistenceEnabled: true,
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const App();
  }
}
