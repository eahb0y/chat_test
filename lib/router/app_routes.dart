import 'package:chat_test/core/local_source/local_source.dart';
import 'package:chat_test/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:chat_test/features/auth/presentation/pages/auth_page.dart';
import 'package:chat_test/features/chat/presentation/arguments/chat_arguments.dart';
import 'package:chat_test/features/chat/presentation/bloc/chat_bloc.dart';
import 'package:chat_test/features/chat/presentation/page/chat_page.dart';
import 'package:chat_test/features/main/presentation/bloc/main_bloc.dart';
import 'package:chat_test/features/main/presentation/pages/main_page.dart';
import 'package:chat_test/features/search/presentation/bloc/search_bloc.dart';
import 'package:chat_test/features/search/presentation/page/search_page.dart';
import 'package:chat_test/features/splash/presentation/pages/splash_page.dart';
import 'package:chat_test/injection_container.dart';
import 'package:chat_test/router/name_routes.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>();
final shellRootNavigatorKey = GlobalKey<NavigatorState>();
final localSource = sl<LocalSource>();

class AppRoutes {
  AppRoutes._();

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    if (kDebugMode) {
      print("route : ${settings.name}");
    }
    switch (settings.name) {
      case Routes.initial:
        return MaterialPageRoute(builder: (_) => const SplashPage());
      case Routes.main:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => sl<MainBloc>(),
                  child: const MainPage(),
                ));
      case Routes.auth:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => sl<AuthBloc>(),
                  child: const AuthPage(),
                ));
      case Routes.search:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => sl<SearchBloc>(),
                  child: const SearchPage(),
                ));
      case Routes.chat:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => sl<ChatBloc>(),
                  child: ChatPage(
                    arguments: settings.arguments is ChatArguments
                        ? settings.arguments as ChatArguments
                        : null,
                  ),
                ));
      default:
        return MaterialPageRoute(builder: (_) => const SizedBox());
    }
  }
}
