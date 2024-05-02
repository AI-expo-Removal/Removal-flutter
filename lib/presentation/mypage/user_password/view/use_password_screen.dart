import 'package:flutter/material.dart';
import 'package:removal_flutter/core/removal.dart';
import 'package:removal_flutter/presentation/mypage/user_password/widget/use_password_app_bar_widget.dart';
import 'package:removal_flutter/presentation/mypage/user_password/widget/use_password_text_field_widget.dart';
import 'package:removal_flutter/presentation/mypage/user_password/widget/use_password_widget.dart';

class UsePassword extends StatelessWidget {
  const UsePassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: RemovalColor.gray100,
      appBar: const UsePasswordAppBar(),
      body: Column(
        children: [
          Password(),
          PasswordTextField()
        ],
      ),
    );
  }
}
