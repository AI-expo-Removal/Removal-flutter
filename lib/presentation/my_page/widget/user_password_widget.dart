import 'package:flutter/material.dart';
import 'package:removal_flutter/core/removal.dart';

class UserPasswordWidget extends StatelessWidget {
  const UserPasswordWidget({super.key});

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
