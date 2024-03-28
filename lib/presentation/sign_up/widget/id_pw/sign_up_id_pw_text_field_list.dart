import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:removal_flutter/core/component/widget/removal_text_field.dart';
import 'package:removal_flutter/core/removal.dart';
import 'package:removal_flutter/presentation/sign_up/provider/state/sign_up_state.dart';

class SignUpIdPwTextFieldList extends ConsumerStatefulWidget {
  const SignUpIdPwTextFieldList({super.key});

  @override
  ConsumerState<SignUpIdPwTextFieldList> createState() =>
      _SignUpIdPwTextFieldListState();
}

class _SignUpIdPwTextFieldListState extends ConsumerState<SignUpIdPwTextFieldList> {
  late TextEditingController idController;
  late TextEditingController pwController;

  late FocusNode idFocusNode;
  late FocusNode pwFocusNode;

  @override
  void initState() {
    super.initState();
    idController = TextEditingController();
    idController.addListener(_buttonUpdate);
    pwController = TextEditingController();
    pwController.addListener(_buttonUpdate);

    idFocusNode = FocusNode();
    pwFocusNode = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    idController.dispose();
    pwController.dispose();

    idFocusNode.dispose();
    pwFocusNode.dispose();
  }

  void _buttonUpdate() {
    idController.text.isNotEmpty && pwController.text.isNotEmpty
        ? ref.read(signUpIdPwFieldStateProvider.notifier).state = true
        : ref.read(signUpIdPwFieldStateProvider.notifier).state = false;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        RemovalTextField(
          controller: idController,
          focusNode: idFocusNode,
          title: "아이디",
          maxLength: 15,
        ),
        const SizedBox(height: 4),
        Text(
          "이미 있는 아이디 입니다.",
          style: RemovalTextStyle.label2(
            color: RemovalColor.red,
          ),
        ),
        RemovalTextField(
          type: RemovalTextFieldType.password,
          controller: pwController,
          focusNode: pwFocusNode,
          title: "비밀번호",
          maxLength: 20,
        ),
      ],
    );
  }
}
