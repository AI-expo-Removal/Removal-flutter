import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:removal_flutter/core/component/widget/removal_button.dart';
import 'package:removal_flutter/core/component/widget/removal_text_field.dart';
import 'package:removal_flutter/core/removal.dart';
import 'package:removal_flutter/presentation/sign_up/provider/sms_view_model_provider.dart';
import 'package:removal_flutter/presentation/sign_up/provider/state/sign_up_state.dart';
import 'package:removal_flutter/presentation/sign_up/widget/user_info/sign_up_user_info_app_bar.dart';
import 'package:removal_flutter/presentation/sign_up/widget/sign_up_title_widget.dart';

class SignUpUserInfoScreen extends ConsumerStatefulWidget {
  const SignUpUserInfoScreen({super.key});

  @override
  ConsumerState<SignUpUserInfoScreen> createState() =>
      _SignUpUserInfoScreenState();
}

class _SignUpUserInfoScreenState extends ConsumerState<SignUpUserInfoScreen> {
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
    nameController.text.isNotEmpty &&
            phoneNumberController.text.isNotEmpty &&
            phoneNumberCheckController.text.isNotEmpty
        ? ref.read(signUpUserInfoFieldStateProvider.notifier).state = true
        : ref.read(signUpUserInfoFieldStateProvider.notifier).state = false;
  }

  @override
  Widget build(BuildContext context) {
    final signUpUserInfoFieldState = ref.watch(signUpUserInfoFieldStateProvider);
    final smsViewModelNotifier = ref.read(smsViewModelProvider.notifier);
    return Scaffold(
      backgroundColor: RemovalColor.gray100,
      appBar: const SignUpUserInfoAppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SignUpTitleWidget(),
              const SizedBox(height: 36),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  RemovalTextField(
                    controller: nameController,
                    focusNode: nameFocusNode,
                    title: "이름",
                    widgetTitle: "최소 1자, 최대 5자",
                    maxLength: 5,
                  ),
                  const SizedBox(height: 20),
                  RemovalTextField(
                    controller: phoneNumberController,
                    focusNode: phoneNumberFocusNode,
                    textInputType: TextInputType.number,
                    widgetTitle: "\"-\" 제외 11 ~ 12자",
                    title: "전화번호",
                    maxLength: 12,
                    suffix: GestureDetector(
                      onTap: () {
                        if (phoneNumberController.text.isNotEmpty &&
                            phoneNumberController.text.length <= 12) {
                          smsViewModelNotifier.postSMS(phoneNumber: phoneNumberController.text);
                        }
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
                    widgetTitle: "인증번호 4자리",
                    maxLength: 4,
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
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  if (signUpUserInfoFieldState) {
                    context.push('/signUpIdPw');
                  }
                },
                child: RemovalButton(
                  gradient: signUpUserInfoFieldState ? RemovalColor.main : null,
                  backgroundColor:
                      signUpUserInfoFieldState ? null : RemovalColor.gray50,
                  color: RemovalColor.white,
                  text: "다음",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
