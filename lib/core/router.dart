import 'package:go_router/go_router.dart';
import 'package:removal_flutter/core/view/splash_screen.dart';
import 'package:removal_flutter/presentation/login/view/login_screen.dart';
import 'package:removal_flutter/presentation/on_boarding/view/on_boarding_screen.dart';
import 'package:removal_flutter/presentation/sign_up/view/sign_up_user_info_screen.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: '/onBoarding',
      builder: (context, state) => const OnBoardingScreen(),
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/signUp',
      builder: (context, state) => const SignUpScreen(),
    ),
  ],
);
