import 'package:flutter/material.dart';
import 'package:removal_flutter/core/component/fonts/removal_text_style.dart';
import 'package:removal_flutter/core/removal_color.dart';

class UserName extends StatelessWidget {
  const UserName({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const SizedBox(height: 79),
          Text('강해민님', style: RemovalTextStyle.heading2(color: RemovalColor.white),),
          const SizedBox(height: 16),
          Text('kangharmdkn', style: RemovalTextStyle.subTitle2(color: RemovalColor.white),),
        ],
      ),
    );
  }
}
