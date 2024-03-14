import 'package:flutter/material.dart';
import 'package:removal_flutter/core/removal_color.dart';
import 'package:removal_flutter/presentation/sign_up/widget/sign_up_app_bar.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: RemovalColor.gray100,
      appBar: const SignUpAppBar(),
    );
  }
}
