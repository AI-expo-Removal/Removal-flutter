import 'package:flutter/material.dart';
import 'package:removal_flutter/core/constants/removal_style.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MainAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: PreferredSize(
        preferredSize: preferredSize,
        child: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: RemovalColor.gray100,
          scrolledUnderElevation: 0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                "assets/images/logo/removal_title.png",
                width: 120,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(54);
}
