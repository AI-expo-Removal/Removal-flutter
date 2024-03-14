import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    _navigateToNextScreen();
    super.initState();
  }

  /// 1.5초간 로고가 박힌 화면을 보여준 후 다음 페이지로 넘어감
  _navigateToNextScreen() async {
    await Future.delayed(const Duration(milliseconds: 1500)); // 1.5초(1500밀리초) 지연
    context.goNamed('/onBoarding');
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 70),
      child: Center(
        child: Image.asset(
          'assets/images/logo/splash_removal_title.png',
        ),
      ),
    );
  }
}
