import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:removal_flutter/core/component/widget/removal_button.dart';
import 'package:removal_flutter/core/removal.dart';

class OnBoardingFunctionButtonList extends StatelessWidget {
  const OnBoardingFunctionButtonList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () => context.push('/login'),
          child: RemovalButton(
            backgroundColor: RemovalColor.main60,
            color: RemovalColor.white,
            text: "시작하기",
          ),
        ),
        const SizedBox(height: 12),
        GestureDetector(
          onTap: () => context.push('/signUpUserInfo'),
          child: RemovalButton(
            backgroundColor: RemovalColor.gray60,
            color: RemovalColor.white,
            text: "회원가입",
          ),
        )
      ],
    );
  }
}
