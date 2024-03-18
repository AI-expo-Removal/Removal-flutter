import 'package:flutter/material.dart';
import 'package:removal_flutter/core/removal.dart';
import 'package:removal_flutter/presentation/mypage/user_phone_number/use_phone_number/widget/phone_number_text_field_widget.dart';
import 'package:removal_flutter/presentation/mypage/user_phone_number/use_phone_number/widget/phone_number_widget.dart';
import 'package:removal_flutter/presentation/mypage/user_phone_number/use_phone_number/widget/use_phone_number_app_bar.dart';

class UsePhoneNumber extends StatelessWidget {
  const UsePhoneNumber({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: RemovalColor.gray100,
      appBar: const UsePhoneNumberAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PhoneNumber(),
          PhoneNumberTextField()
        ],
      ),
    );
  }
}
