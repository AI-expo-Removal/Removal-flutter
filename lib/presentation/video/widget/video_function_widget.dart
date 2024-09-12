import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:removal_flutter/core/constants/removal_style.dart';

class VideoFunctionWidget extends StatelessWidget {
  final String iconPath;
  final String title;

  const VideoFunctionWidget({
    super.key,
    required this.iconPath,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(iconPath),
        const SizedBox(height: 2),
        Text(
          title,
          style: RemovalTextStyle.caption2(
            color: RemovalColor.gray20,
          ),
        ),
      ],
    );
  }
}
