import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:removal_flutter/core/removal.dart';

class VideoAppBar extends StatelessWidget implements PreferredSizeWidget {
  const VideoAppBar({super.key});

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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  context.pop('/main');
                },
                child: SvgPicture.asset(
                  "assets/images/icon/video/close_icon.svg",
                ),
              ),
              GestureDetector(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: RemovalColor.main,
                    borderRadius: BorderRadius.circular(2),
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                    child: Center(
                      child: Text(
                        "내보내기",
                        style: RemovalTextStyle.button3(
                          color: RemovalColor.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50);
}
