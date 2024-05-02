import 'package:flutter/material.dart';
import 'package:removal_flutter/core/removal.dart';

class RenewalPassword extends StatelessWidget {
  const RenewalPassword ({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(padding: EdgeInsets.only(left: 35, top: 36),
          child: Text('변경할 비밀번호 입력', style: RemovalTextStyle.label2(color: RemovalColor.white),),
        ),
        Padding(padding: EdgeInsets.only(left: 35, right: 35),
          child: TextField(style: RemovalTextStyle.label2(color: RemovalColor.white),
          ),
        ),
      ],
    );
  }
}
