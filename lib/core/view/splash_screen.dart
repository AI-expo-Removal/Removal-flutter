import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:removal_flutter/core/removal.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {

    });
  }

  @override
  Widget build(BuildContext context) {
    context.go('/onBoarding');
    return Scaffold(
      backgroundColor: RemovalColor.gray100,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 70),
        child: Center(
          child: Image.asset(
            'assets/images/logo/removal_title.png',
          ),
        ),
      ),
    );
  }
}
