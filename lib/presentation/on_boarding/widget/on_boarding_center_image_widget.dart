import 'package:flutter/material.dart';

class OnBoardingCenterImageWidget extends StatelessWidget {
  const OnBoardingCenterImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Image.asset(
        "assets/images/icon/on_boarding/on_boarding_player_cuate.png",
      ),
    );
  }
}
