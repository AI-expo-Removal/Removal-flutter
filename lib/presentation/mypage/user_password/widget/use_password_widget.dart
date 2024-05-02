import 'package:flutter/material.dart';
import 'package:removal_flutter/core/removal.dart';
import 'package:removal_flutter/presentation/mypage/user_password/password/view/edit_password_screen.dart';

class Password extends StatelessWidget {
  const Password ({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 35, top: 79),
          child: Text(
            '현재 등록 된 비밀번호',
            style: RemovalTextStyle.label2(color: RemovalColor.white),
          ),
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.only(right: 35, top: 79),
          child: TextButton(
            style: TextButton.styleFrom(
              minimumSize: Size.zero,
              padding: EdgeInsets.zero,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            onPressed: (){
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const EditPasswordScreen(),)
              );
            },
            child: Text(
              '비밀번호 변경',
              style: RemovalTextStyle.label2(color: RemovalColor.main50),
            ),
          ),
        ),
      ],
    );
  }
}
