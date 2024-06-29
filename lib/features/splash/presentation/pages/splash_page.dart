import 'package:chat_test/core/local_source/local_source.dart';
import 'package:chat_test/injection_container.dart';
import 'package:chat_test/router/name_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Future.delayed(
      const Duration(milliseconds: 500),
      () {
        FlutterNativeSplash.remove();
      },
    );
    Future.delayed(
      const Duration(milliseconds: 1500),
      () {
        if (context.mounted) {
          if (sl<LocalSource>().getUserEmail().isNotEmpty &&
              sl<LocalSource>().getUserPassword().isNotEmpty) {
            Navigator.of(context).pushReplacementNamed(Routes.main);
          } else {
            Navigator.of(context).pushReplacementNamed(Routes.auth);
          }
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.blue,
    );
  }
}