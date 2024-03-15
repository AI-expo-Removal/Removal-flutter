import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:removal_flutter/core/component/widget/removal_button.dart';
import 'package:removal_flutter/core/removal.dart';
import 'package:removal_flutter/presentation/login/provider/state/login_state.dart';

class LoginActionButton extends ConsumerWidget {
  const LoginActionButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loginFieldState = ref.watch(loginFieldStateProvider);
    return RemovalButton(
      gradient: loginFieldState ? RemovalColor.main : null,
      backgroundColor: loginFieldState ? null : RemovalColor.gray50,
      color: RemovalColor.white,
      text: "로그인",
    );
  }
}
