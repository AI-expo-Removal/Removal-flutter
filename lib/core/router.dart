import 'package:go_router/go_router.dart';
import 'package:removal_flutter/core/view/splash_screen.dart';
import 'package:removal_flutter/presentation/on_boarding/view/on_boarding_screen.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: '/splash',
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: '/onBoarding',
      name: '/onBoarding',
      builder: (context, state) => const OnBoardingScreen(),
    ),
  ],
);
