import 'package:flutter/material.dart';
import 'package:removal_flutter/core/removal.dart';

class LoginAppBar extends StatelessWidget implements PreferredSizeWidget {
  const LoginAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: PreferredSize(
        preferredSize: preferredSize,
        child: AppBar(
          backgroundColor: RemovalColor.gray100,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(48);
}
