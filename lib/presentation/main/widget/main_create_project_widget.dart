import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:removal_flutter/core/constants/removal_style.dart';

class MainCreateProjectWidget extends StatelessWidget {
  const MainCreateProjectWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            gradient: RemovalColor.main,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 38),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  "assets/images/icon/main/edit_project_icon.svg",
                ),
                const SizedBox(width: 8),
                Text(
                  '영상 업로드',
                  style: RemovalTextStyle.button1(
                    color: RemovalColor.white,
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
