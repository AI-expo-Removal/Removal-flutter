import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:removal_flutter/core/component/widget/removal_text_field.dart';
import 'package:removal_flutter/presentation/login/provider/state/login_state.dart';

class LoginTextFieldList extends ConsumerStatefulWidget {
  const LoginTextFieldList({super.key});

  @override
  ConsumerState<LoginTextFieldList> createState() => _LoginTextFieldListState();
}

class _LoginTextFieldListState extends ConsumerState<LoginTextFieldList> {
  late TextEditingController idController;
  late TextEditingController pwdController;

  late FocusNode idFocusNode;
  late FocusNode pwdFocusNode;

  @override
  void initState() {
    super.initState();
    idController = TextEditingController();
    idController.addListener(_buttonUpdate);
    pwdController = TextEditingController();
    pwdController.addListener(_buttonUpdate);

    idFocusNode = FocusNode();
    pwdFocusNode = FocusNode();
  }

  void _buttonUpdate() {
    idController.text.isNotEmpty && pwdController.text.isNotEmpty
        ? ref.read(loginFieldStateProvider.notifier).state = true
        : ref.read(loginFieldStateProvider.notifier).state = false;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RemovalTextField(
          controller: idController,
          focusNode: idFocusNode,
          title: "아이디",
        ),
        const SizedBox(height: 20),
        RemovalTextField(
          type: RemovalTextFieldType.password,
          controller: pwdController,
          focusNode: pwdFocusNode,
          title: "비밀번호",
        ),
      ],
    );
  }
}
