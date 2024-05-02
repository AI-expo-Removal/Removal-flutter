import 'package:flutter/material.dart';
import 'package:removal_flutter/core/removal.dart';

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
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: '1',
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
