import 'package:flutter/material.dart';
import 'package:removal_flutter/core/removal_color.dart';

class OnBoardingAppBar extends StatelessWidget implements PreferredSizeWidget {

  const OnBoardingAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: PreferredSize(
        preferredSize: preferredSize,
        child: AppBar(
          backgroundColor: RemovalColor.gray100,
          title: Row(
            children: [
              Image.asset(
                "assets/images/logo/removal_title.png",
                width: 100,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(49.25);
}
