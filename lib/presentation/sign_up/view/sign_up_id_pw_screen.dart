import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:removal_flutter/core/component/widget/removal_button.dart';
import 'package:removal_flutter/core/component/widget/removal_text_field.dart';
import 'package:removal_flutter/core/removal.dart';
import 'package:removal_flutter/presentation/sign_up/provider/sign_up_id_duplicate_provider.dart';
import 'package:removal_flutter/presentation/sign_up/provider/sign_up_view_model_provider.dart';
import 'package:removal_flutter/presentation/sign_up/provider/state/sign_up_state.dart';
import 'package:removal_flutter/presentation/sign_up/widget/id_pw/sign_up_id_pw_app_bar.dart';
import 'package:removal_flutter/presentation/sign_up/widget/sign_up_title_widget.dart';

class SignUpIdPwScreen extends ConsumerStatefulWidget {
  final String name;

  const SignUpIdPwScreen({
    super.key,
    required this.name,
  });

  @override
  ConsumerState<SignUpIdPwScreen> createState() => _SignUpIdPwScreenState();
}

class _SignUpIdPwScreenState extends ConsumerState<SignUpIdPwScreen> {
  late TextEditingController idController;
  late TextEditingController pwdController;

  late FocusNode idFocusNode;
  late FocusNode pwFocusNode;

  @override
  void initState() {
    super.initState();
    idController = TextEditingController();
    idController.addListener(_buttonUpdate);
    pwdController = TextEditingController();
    pwdController.addListener(_buttonUpdate);

    idFocusNode = FocusNode();
    pwFocusNode = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    idController.dispose();
    pwdController.dispose();

    idFocusNode.dispose();
    pwFocusNode.dispose();
  }

  void _buttonUpdate() {
    (idController.text.isNotEmpty && idController.text.length >= 8) &&
            (pwdController.text.isNotEmpty && pwdController.text.length >= 8)
        ? ref.read(signUpIdPwFieldStateProvider.notifier).state = true
        : ref.read(signUpIdPwFieldStateProvider.notifier).state = false;
  }

  @override
  Widget build(BuildContext context) {
    final signUpIdPwFieldState = ref.watch(signUpIdPwFieldStateProvider);
    final signUpNotifier = ref.read(signUpViewModelProvider.notifier);
    final signUpIdDuplicateState = ref.watch(signUpIdDuplicateProvider);
    final signUpIdDuplicateNotifier =
        ref.read(signUpIdDuplicateProvider.notifier);
    ref.listen(signUpViewModelProvider.select((value) => value),
        (previous, next) {
      switch (next) {
        case SignUpState.failure:
          signUpIdDuplicateNotifier.state = true;
          break;
        case SignUpState.success:
          signUpIdDuplicateNotifier.state = false;
          context.go('/onBoarding');
          break;
        default:
          signUpIdDuplicateNotifier.state = false;
          break;
      }
    });
    return Scaffold(
      backgroundColor: RemovalColor.gray100,
      appBar: const SignUpIdPwAppBar(),
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
                    controller: idController,
                    focusNode: idFocusNode,
                    title: "아이디",
                    widgetTitle: "최소 8자, 최대 15자",
                    maxLength: 15,
                  ),
                  SizedBox(height: signUpIdDuplicateState ? 4 : 20),
                  if (signUpIdDuplicateState)
                    Text(
                      "이미 있는 아이디 입니다.",
                      style: RemovalTextStyle.label2(
                        color: RemovalColor.red,
                      ),
                    ),
                  RemovalTextField(
                    type: RemovalTextFieldType.password,
                    controller: pwdController,
                    focusNode: pwFocusNode,
                    title: "비밀번호",
                    widgetTitle: "최소 8자, 최대 20자 (영어, 특수 문자, 숫자 포함)",
                    maxLength: 20,
                  ),
                ],
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  if (signUpIdPwFieldState) {
                    signUpNotifier.postSignUp(
                      accountId: idController.text,
                      password: pwdController.text,
                      name: widget.name,
                    );
                  }
                },
                child: RemovalButton(
                  gradient: signUpIdPwFieldState ? RemovalColor.main : null,
                  backgroundColor:
                      signUpIdPwFieldState ? null : RemovalColor.gray50,
                  color: RemovalColor.white,
                  text: "가입하기",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
