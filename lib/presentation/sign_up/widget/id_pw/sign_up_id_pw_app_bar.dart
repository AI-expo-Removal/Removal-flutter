import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:removal_flutter/core/removal.dart';

class SignUpIdPwAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SignUpIdPwAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: PreferredSize(
        preferredSize: preferredSize,
        child: AppBar(
          backgroundColor: RemovalColor.gray100,
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () {
                  context.pop('/signUpUserInfo');
                },
                child: SvgPicture.asset(
                  "assets/images/icon/core/left_arrow_icon.svg",
                ),
              ),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: '2',
                      style: RemovalTextStyle.label1(
                        color: RemovalColor.main50,
                      ),
                    ),
                    TextSpan(
                      text: '/2',
                      style: RemovalTextStyle.label1(
                        color: RemovalColor.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(48);
}