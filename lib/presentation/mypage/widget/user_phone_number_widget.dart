import 'package:flutter/material.dart';
import 'package:removal_flutter/core/component/fonts/removal_text_style.dart';
import 'package:removal_flutter/core/removal.dart';
import 'package:removal_flutter/presentation/mypage/user_phone_number/use_phone_number/view/user_use_phone_number_screen.dart';

class UserPhoneNumber extends StatelessWidget {
  const UserPhoneNumber({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(padding: const EdgeInsets.only(left: 20)),
        Icon(Icons.call, color: RemovalColor.white,),
        TextButton(
            onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const UsePhoneNumber()),
              );
            },
            child: Text('전화번호',
              style: RemovalTextStyle.subTitle2(
                  color: RemovalColor.white
              ),
            )
        )
      ],
    );
  }
}
