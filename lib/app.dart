import 'package:chat_test/core/theme/theme_data.dart';
import 'package:chat_test/generated/l10n.dart';
import 'package:chat_test/router/app_routes.dart';
import 'package:chat_test/router/name_routes.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: rootNavigatorKey,
      initialRoute: Routes.initial,
      onGenerateRoute: AppRoutes.onGenerateRoute,
      title: 'MediaPark',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: lightTheme,
      darkTheme: darkTheme,
      supportedLocales: AppLocalization.delegate.supportedLocales,
      localizationsDelegates: const [
        AppLocalization.delegate,
      ],
    );
  }
}
