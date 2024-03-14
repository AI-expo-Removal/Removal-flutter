import 'package:flutter/material.dart';
import 'package:removal_flutter/core/component/fonts/removal_text_style.dart';
import 'package:removal_flutter/core/removal_color.dart';

class SignUpAppBar extends StatelessWidget implements PreferredSizeWidget {

  const SignUpAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: PreferredSize(
          preferredSize: preferredSize,
          child: AppBar(
            backgroundColor: RemovalColor.gray100,
            title: Row(
              children: [
                SizedBox(width: 347),
                Text('1',
                  style: RemovalTextStyle.label1(
                    color: RemovalColor.main50
                  )
                ),
                Text(
                  '/2',
                  style: RemovalTextStyle.label1(
                      color: RemovalColor.white,
                  ),
                )
              ],
            ),
          ),
        )
    );
  }
  @override
  Size get preferredSize => const Size.fromHeight(48);
}
