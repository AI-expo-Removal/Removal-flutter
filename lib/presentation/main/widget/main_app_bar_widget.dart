import 'package:flutter/material.dart';
import 'package:removal_flutter/core/removal_color.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {

  const MainAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: PreferredSize(
        preferredSize: preferredSize,
        child: AppBar(
          backgroundColor: RemovalColor.gray100,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                "assets/images/logo/removal_title.png",
                width: 120,
              ),
              Spacer(),
              IconButton(
                  onPressed: (){

                  },
                  icon: Icon(
                    Icons.account_circle,
                      color: RemovalColor.white,
                      size: 28,
                  )
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(54);
}
