import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:removal_flutter/core/component/widget/removal_text_field.dart';
import 'package:removal_flutter/core/removal.dart';
import 'package:removal_flutter/presentation/sign_up/provider/state/sign_up_state.dart';

class SignUpUserInfoTextFieldList extends ConsumerStatefulWidget {
  const SignUpUserInfoTextFieldList({super.key});

  @override
  ConsumerState<SignUpUserInfoTextFieldList> createState() =>
      _SignUpUserInfoTextFieldListState();
}

class _SignUpUserInfoTextFieldListState
    extends ConsumerState<SignUpUserInfoTextFieldList> {
  late TextEditingController nameController;
  late TextEditingController phoneNumberController;
  late TextEditingController phoneNumberCheckController;

  late FocusNode nameFocusNode;
  late FocusNode phoneNumberFocusNode;
  late FocusNode phoneNumberCheckFocusNode;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    nameController.addListener(_buttonUpdate);
    phoneNumberController = TextEditingController();
    phoneNumberController.addListener(_buttonUpdate);
    phoneNumberCheckController = TextEditingController();
    phoneNumberCheckController.addListener(_buttonUpdate);

    nameFocusNode = FocusNode();
    phoneNumberFocusNode = FocusNode();
    phoneNumberCheckFocusNode = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    phoneNumberController.dispose();
    phoneNumberCheckController.dispose();

    nameFocusNode.dispose();
    phoneNumberFocusNode.dispose();
    phoneNumberCheckFocusNode.dispose();
  }

  void _buttonUpdate() {
    nameController.text.isNotEmpty && phoneNumberController.text.isNotEmpty && phoneNumberCheckController.text.isNotEmpty
        ? ref.read(signUpUserInfoFieldStateProvider.notifier).state = true
        : ref.read(signUpUserInfoFieldStateProvider.notifier).state = false;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        RemovalTextField(
          controller: nameController,
          focusNode: nameFocusNode,
          title: "이름",
        ),
        const SizedBox(height: 20),
        RemovalTextField(
          controller: phoneNumberController,
          focusNode: phoneNumberFocusNode,
          textInputType: TextInputType.number,
          title: "전화번호",
          suffix: GestureDetector(
            onTap: () {
              /// 인증 post api 호출
            },
            child: Text(
              "인증하기",
              style: RemovalTextStyle.button2(
                color: RemovalColor.main40,
              ),
            ),
          ),
        ),
        Text(
          "남은 시간 05:00",
          style: RemovalTextStyle.label2(
            color: RemovalColor.white,
          ),
        ),
        RemovalTextField(
          controller: phoneNumberCheckController,
          focusNode: phoneNumberCheckFocusNode,
          textInputType: TextInputType.number,
          title: "전화번호 인증",
          widgetTitle: "인증번호",
          suffix: GestureDetector(
            child: Text(
              "확인",
              style: RemovalTextStyle.button2(
                color: RemovalColor.main40,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
