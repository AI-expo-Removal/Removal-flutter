import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:removal_flutter/core/component/widget/removal_button.dart';
import 'package:removal_flutter/core/removal.dart';
import 'package:removal_flutter/presentation/sign_up/provider/state/sign_up_state.dart';

class SignUpIdPwActionButton extends ConsumerWidget {
  const SignUpIdPwActionButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final signUpIdPwFieldState = ref.watch(signUpIdPwFieldStateProvider);
    final signUpIdPwFieldNotifier = ref.read(signUpIdPwFieldStateProvider.notifier);
    final signUpUserInfoFieldNotifier = ref.read(signUpUserInfoFieldStateProvider.notifier);
    return GestureDetector(
      onTap: () {
        if (signUpIdPwFieldState) {
          context.go("/onBoarding");
          signUpIdPwFieldNotifier.state = false;
          signUpUserInfoFieldNotifier.state = false;
        }
      },
      child: RemovalButton(
        gradient: signUpIdPwFieldState ? RemovalColor.main : null,
        backgroundColor: signUpIdPwFieldState ? null : RemovalColor.gray50,
        color: RemovalColor.white,
        text: "가입하기",
      ),
    );
  }
}
