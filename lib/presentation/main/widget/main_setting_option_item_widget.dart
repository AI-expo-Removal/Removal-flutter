import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:removal_flutter/core/removal.dart';

class MainSettingOptionItemWidget extends StatelessWidget {
  final String title;
  final String iconPath;
  final Color color;

  const MainSettingOptionItemWidget({
    super.key,
    required this.title,
    required this.iconPath,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          SvgPicture.asset(
            iconPath,
            color: color,
          ),
          const SizedBox(width: 16),
          Text(
            title,
            style: RemovalTextStyle.body1(
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}
