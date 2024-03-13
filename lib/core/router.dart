import 'package:go_router/go_router.dart';
import 'package:removal_flutter/core/view/splash_screen.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: '/splash',
      builder: (context, state) => const SplashScreen(),
    ),
  ],
);
