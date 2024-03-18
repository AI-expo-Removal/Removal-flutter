import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:removal_flutter/core/component/widget/removal_button.dart';
import 'package:removal_flutter/core/removal.dart';
import 'package:removal_flutter/presentation/sign_up/provider/state/sign_up_state.dart';

class SignUpUserInfoActionButton extends ConsumerWidget {
  const SignUpUserInfoActionButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final signUpUserInfoFieldState = ref.watch(signUpUserInfoFieldStateProvider);
    return GestureDetector(
      onTap: () {
        if (signUpUserInfoFieldState) {
          context.push('/signUpIdPw');
        }
      },
      child: RemovalButton(
        gradient: signUpUserInfoFieldState ? RemovalColor.main : null,
        backgroundColor: signUpUserInfoFieldState ? null : RemovalColor.gray50,
        color: RemovalColor.white,
        text: "다음",
      ),
    );
  }
}
