import 'package:flutter/material.dart';
import 'package:removal_flutter/core/removal.dart';
import 'package:removal_flutter/presentation/login/widget/login_action_button.dart';
import 'package:removal_flutter/presentation/login/widget/login_app_bar.dart';
import 'package:removal_flutter/presentation/login/widget/login_text_field_list.dart';
import 'package:removal_flutter/presentation/login/widget/login_title_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: RemovalColor.gray100,
      appBar: const LoginAppBar(),
      body: const SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25, vertical: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LoginTitleWidget(),
              SizedBox(height: 36),
              LoginTextFieldList(),
              Spacer(),
              LoginActionButton(),
            ],
          ),
        ),
      ),
    );
  }
}
