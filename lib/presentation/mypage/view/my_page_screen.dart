import 'package:flutter/material.dart';
import 'package:removal_flutter/core/removal_color.dart';
import 'package:removal_flutter/presentation/mypage/widget/my_page_app_bar_widget.dart';
import 'package:removal_flutter/presentation/mypage/widget/user_name_widget.dart';
import 'package:removal_flutter/presentation/mypage/widget/user_password_widget.dart';
import 'package:removal_flutter/presentation/mypage/widget/user_phone_number_widget.dart';

class MyPageScreen extends StatelessWidget {
  const MyPageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: RemovalColor.gray100,
      appBar: const MyPageAppBar(),
      body: Column(
        children: [
          UserName(),
          const SizedBox(height: 100),
          UserPhoneNumber(),
          UserPassword()
        ],
      ),
    );
  }
}
