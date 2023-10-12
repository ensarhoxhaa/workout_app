import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:workout_app/features/authentication/authentication.dart';

const String _home = '/home';
const String _login = '/login';
const String _register = '/register';

typedef AppRoute = String;

abstract class AppRoutes {
  static AppRoute get login => _login;

  static AppRoute get register => _register;

  static AppRoute get home => _home;
}

final _rootNavigatorKey = GlobalKey<NavigatorState>();

final goRouterProvider = Provider(
  (ref) {
    return GoRouter(
      initialLocation: AppRoutes.login,
      debugLogDiagnostics: true,
      navigatorKey: _rootNavigatorKey,
      routes: [
        GoRoute(
          path: AppRoutes.home,
          pageBuilder: (context, state) => const NoTransitionPage(
            child: SizedBox(),
          ),
        ),
        GoRoute(
          path: AppRoutes.login,
          pageBuilder: (context, state) => const NoTransitionPage(
            child: LoginScreen(),
          ),
        ),
        GoRoute(
          path: AppRoutes.register,
          pageBuilder: (context, state) => const NoTransitionPage(
            child: SizedBox(),
          ),
        ),
      ],
    );
  },
);
