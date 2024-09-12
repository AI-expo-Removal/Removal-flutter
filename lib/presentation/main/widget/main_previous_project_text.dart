import 'package:flutter/material.dart';
import 'package:removal_flutter/core/constants/removal_style.dart';

class MainPreviousProjectText extends StatefulWidget {
  const MainPreviousProjectText({super.key});

  @override
  State<MainPreviousProjectText> createState() =>
      _MainPreviousProjectTextState();
}

class _MainPreviousProjectTextState extends State<MainPreviousProjectText> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          "이전 프로젝트 (6)",
          style: RemovalTextStyle.subTitle1(
            color: RemovalColor.white,
          ),
        )
      ],
    );
  }
}
