import 'package:flutter/material.dart';
import 'package:removal_flutter/core/removal.dart';

class EditPassword extends StatelessWidget {
  const EditPassword ({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(padding: EdgeInsets.only(left: 35, top: 79),
          child: Text('현재 비밀번호 입력', style: RemovalTextStyle.label2(color: RemovalColor.white),),
        ),
        Padding(padding: EdgeInsets.only(left: 35, right: 35),
          child: TextField(style: RemovalTextStyle.label2(color: RemovalColor.white),
          ),
        ),
      ],
    );
  }
}
