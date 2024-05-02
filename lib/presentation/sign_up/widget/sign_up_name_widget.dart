import 'package:flutter/material.dart';
import 'package:removal_flutter/core/component/fonts/removal_text_style.dart';
import 'package:removal_flutter/core/removal_color.dart';

class SignUpName extends StatelessWidget {
  const SignUpName({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 25),
      child: TextField(
        decoration: InputDecoration(
          filled: true,
          fillColor: RemovalColor.gray80,
          hintText: '이름',
          hintStyle: RemovalTextStyle.label2(color: RemovalColor.gray40)
        ),
      ),
    );
  }
}
