import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:removal_flutter/core/component/widget/removal_button.dart';
import 'package:removal_flutter/core/component/widget/removal_text_field.dart';
import 'package:removal_flutter/core/removal.dart';
import 'package:removal_flutter/presentation/login/provider/login_view_model_provider.dart';
import 'package:removal_flutter/presentation/login/provider/state/login_state.dart';
import 'package:removal_flutter/presentation/login/widget/login_app_bar.dart';
import 'package:removal_flutter/presentation/login/widget/login_title_widget.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
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

  @override
  void dispose() {
    super.dispose();
    idController.dispose();
    pwdController.dispose();

    idFocusNode.dispose();
    pwdFocusNode.dispose();
  }

  void _buttonUpdate() {
    idController.text.isNotEmpty && pwdController.text.isNotEmpty
        ? ref.read(loginFieldStateProvider.notifier).state = true
        : ref.read(loginFieldStateProvider.notifier).state = false;
  }

  @override
  Widget build(BuildContext context) {
    final loginFieldState = ref.watch(loginFieldStateProvider);
    final loginViewModelState = ref.watch(loginViewModelProvider);
    final loginViewModelNotifier = ref.read(loginViewModelProvider.notifier);
    ref.listen(loginViewModelProvider.select((value) => value),
        (previous, next) {
      switch (next) {
        case LoginState.success:
          context.go('/myPage');
        default:
          null;
      }
    });
    return Scaffold(
      backgroundColor: RemovalColor.gray100,
      appBar: const LoginAppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const LoginTitleWidget(),
              const SizedBox(height: 36),

              /// 로그인 정보 입력 텍스트 필드
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  RemovalTextField(
                    controller: idController,
                    focusNode: idFocusNode,
                    title: "아이디",
                    maxLength: 15,
                  ),
                  const SizedBox(height: 20),
                  RemovalTextField(
                    type: RemovalTextFieldType.password,
                    controller: pwdController,
                    focusNode: pwdFocusNode,
                    title: "비밀번호",
                    maxLength: 20,
                  ),
                  if (loginViewModelState == LoginState.failure)
                    Text(
                      "아이디나 비밀번호가 일치하지 않습니다.",
                      style: RemovalTextStyle.label2(
                        color: RemovalColor.red,
                      ),
                    ),
                ],
              ),

              /// 로그인 버튼
              const Spacer(),
              GestureDetector(
                onTap: () {
                  if (loginFieldState) {
                    loginViewModelNotifier.postLogin(
                      accountId: idController.text,
                      password: pwdController.text,
                    );
                  }
                },
                child: RemovalButton(
                  gradient: loginFieldState ? RemovalColor.main : null,
                  backgroundColor: loginFieldState ? null : RemovalColor.gray50,
                  color: RemovalColor.white,
                  text: "로그인",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
