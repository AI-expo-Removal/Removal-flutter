import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:removal_flutter/core/component/fonts/removal_text_style.dart';
import 'package:removal_flutter/core/removal_color.dart';

class MyPageAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyPageAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: PreferredSize(
        preferredSize: preferredSize,
        child: AppBar(
          automaticallyImplyLeading: false,
          scrolledUnderElevation: 0,
          centerTitle: true,
          backgroundColor: RemovalColor.gray100,
          leading: Center(
            child: GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () {
                context.pop('/main');
              },
              child: SvgPicture.asset(
                "assets/images/icon/core/left_arrow_icon.svg",
              ),
            ),
          ),
          title: Text(
            'My',
            style: RemovalTextStyle.subTitle1(
              color: RemovalColor.white,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(48);
}
