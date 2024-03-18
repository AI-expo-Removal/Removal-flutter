import 'package:flutter/material.dart';
import 'package:removal_flutter/core/removal.dart';

class PreviousProjectText extends StatefulWidget {
  const PreviousProjectText({super.key});

  @override
  State<PreviousProjectText> createState() => _PreviousProjectTextState();
}

class _PreviousProjectTextState extends State<PreviousProjectText> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(height: 52),
        Text(
          '이전 프로젝트 (6)',
          style: RemovalTextStyle.subTitle1(color: RemovalColor.white),
        )
      ],
    );
  }
}
