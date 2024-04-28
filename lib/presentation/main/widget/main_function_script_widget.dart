import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:removal_flutter/core/removal.dart';

class MainFunctionScriptWidget extends StatelessWidget {
  final String iconPath;
  final String title;
  final String localDescription;
  final String translateDescription;

  const MainFunctionScriptWidget({
    super.key,
    required this.iconPath,
    required this.title,
    required this.localDescription,
    required this.translateDescription,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: RemovalColor.gray90,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(iconPath),
            const SizedBox(height: 12),
            Text(
              title,
              style: RemovalTextStyle.heading4(
                color: RemovalColor.gray20,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              localDescription,
              textAlign: TextAlign.center,
              style: RemovalTextStyle.caption1(
                color: RemovalColor.gray30,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              translateDescription,
              textAlign: TextAlign.center,
              style: RemovalTextStyle.caption2(
                color: RemovalColor.gray40,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
