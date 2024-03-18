import 'package:flutter/material.dart';
import 'package:removal_flutter/core/removal.dart';

class SignUpTitleWidget extends StatelessWidget {
  const SignUpTitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      '회원가입하고\nRemoval을 사용해보세요',
      style: RemovalTextStyle.heading3(
        color: RemovalColor.white,
      ),
    );
  }
}
