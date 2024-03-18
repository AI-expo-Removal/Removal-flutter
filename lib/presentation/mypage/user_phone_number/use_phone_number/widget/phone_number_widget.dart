import 'package:flutter/material.dart';
import 'package:removal_flutter/core/component/fonts/removal_text_style.dart';
import 'package:removal_flutter/core/removal.dart';
import 'package:removal_flutter/core/removal_color.dart';

class PhoneNumber extends StatelessWidget {
  const PhoneNumber({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(padding: EdgeInsets.only(left: 35, top: 79),
          child: Text(
            '현재 등록 된 전화번호',
            style: RemovalTextStyle.label2(color: RemovalColor.white),
          ),
        ),
      ],
    );
  }
}
