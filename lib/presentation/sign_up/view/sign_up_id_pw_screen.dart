import 'package:flutter/material.dart';
import 'package:removal_flutter/core/removal.dart';
import 'package:removal_flutter/presentation/sign_up/widget/id_pw/sign_up_id_pw_action_button.dart';
import 'package:removal_flutter/presentation/sign_up/widget/id_pw/sign_up_id_pw_app_bar.dart';
import 'package:removal_flutter/presentation/sign_up/widget/id_pw/sign_up_id_pw_text_field_list.dart';
import 'package:removal_flutter/presentation/sign_up/widget/sign_up_title_widget.dart';

class SignUpIdPwScreen extends StatelessWidget {
  const SignUpIdPwScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: RemovalColor.gray100,
      appBar: const SignUpIdPwAppBar(),
      body: const SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25, vertical: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SignUpTitleWidget(),
              SizedBox(height: 36),
              SignUpIdPwTextFieldList(),
              Spacer(),
              SignUpIdPwActionButton(),
            ],
          ),
        ),
      ),
    );
  }
}
