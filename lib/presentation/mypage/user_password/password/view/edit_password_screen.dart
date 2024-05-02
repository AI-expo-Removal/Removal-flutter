import 'package:flutter/material.dart';
import 'package:removal_flutter/core/removal.dart';
import 'package:removal_flutter/presentation/mypage/user_password/password/widget/edit_password_app_bar_widget.dart';
import 'package:removal_flutter/presentation/mypage/user_password/password/widget/edit_password_button_widget.dart';
import 'package:removal_flutter/presentation/mypage/user_password/password/widget/edit_password_widget.dart';
import 'package:removal_flutter/presentation/mypage/user_password/password/widget/password_widget.dart';

class EditPasswordScreen extends StatelessWidget {
  const EditPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: RemovalColor.gray100,
      appBar: const EditPasswordAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const EditPassword(),
          const RenewalPassword(),
          Spacer(),
          const EditPasswordButton()
        ],
      ),
    );
  }
}
