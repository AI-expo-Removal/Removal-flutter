import 'package:flutter/material.dart';
import 'package:removal_flutter/core/removal_color.dart';
import 'package:removal_flutter/presentation/sign_up/widget/user_info/sign_up_user_info_app_bar.dart';
import 'package:removal_flutter/presentation/sign_up/widget/user_info/sign_up_user_info_action_button.dart';
import 'package:removal_flutter/presentation/sign_up/widget/user_info/sign_up_user_info_text_field_list.dart';
import 'package:removal_flutter/presentation/sign_up/widget/sign_up_title_widget.dart';

class SignUpUserInfoScreen extends StatelessWidget {
  const SignUpUserInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: RemovalColor.gray100,
      appBar: const SignUpUserInfoAppBar(),
      body: const SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25, vertical: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SignUpTitleWidget(),
              SizedBox(height: 36),
              SignUpUserInfoTextFieldList(),
              Spacer(),
              SignUpUserInfoActionButton(),
            ],
          ),
        ),
      ),
    );
  }
}
