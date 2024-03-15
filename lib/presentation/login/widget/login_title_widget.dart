import 'package:flutter/material.dart';
import 'package:removal_flutter/core/removal.dart';

class LoginTitleWidget extends StatelessWidget {
  const LoginTitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      '로그인하고\nRemoval을 사용해보세요',
      style: RemovalTextStyle.heading3(
        color: RemovalColor.white,
      ),
    );
  }
}
