import 'package:flutter/material.dart';
import 'package:removal_flutter/core/component/fonts/removal_text_style.dart';
import 'package:removal_flutter/core/removal.dart';

class UserPassword extends StatelessWidget {
  const UserPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(padding: const EdgeInsets.only(left: 20)),
        Icon(Icons.lock, color: RemovalColor.white,),
        TextButton(
            onPressed: (){},
            child: Text('비밀번호',
              style: RemovalTextStyle.subTitle2(
                  color: RemovalColor.white
              ),
            )
        )
      ],
    );
  }
}
