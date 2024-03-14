import 'package:flutter/material.dart';
import 'package:removal_flutter/core/removal.dart';

class OnBoardingTitleWidget extends StatelessWidget {
  const OnBoardingTitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'AI로 새로운 영상의 세계',
          style: RemovalTextStyle.heading2(
            color: RemovalColor.gray10,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Removal로 시작해보세요!',
          style: RemovalTextStyle.subTitle1(
            color: RemovalColor.gray10,
          ),
        ),
      ],
    );
  }
}
