import 'package:flutter/material.dart';
import 'package:removal_flutter/core/component/fonts/removal_text_style.dart';
import 'package:removal_flutter/core/removal_color.dart';
import 'package:removal_flutter/presentation/on_boarding/widget/on_boarding_app_bar.dart';
import 'package:removal_flutter/presentation/on_boarding/widget/on_boarding_center_image_widget.dart';
import 'package:removal_flutter/presentation/on_boarding/widget/on_boarding_function_button_list.dart';
import 'package:removal_flutter/presentation/on_boarding/widget/on_boarding_title_widget.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: RemovalColor.gray100,
      appBar: const OnBoardingAppBar(),
      body: const SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              OnBoardingTitleWidget(),
              OnBoardingCenterImageWidget(),
              OnBoardingFunctionButtonList(),
            ],
          ),
        ),
      ),
    );
  }
}
