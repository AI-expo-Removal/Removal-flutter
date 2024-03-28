import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:removal_flutter/core/removal.dart';
import 'package:removal_flutter/presentation/main/widget/main_setting_bottom_sheet.dart';

class MainProjectWidget extends StatelessWidget {
  const MainProjectWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  color: RemovalColor.gray20,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              const SizedBox(width: 12),
              SizedBox(
                width: 180,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'dsdsdsdsdsddsdsdsdsdddddd',
                      style: RemovalTextStyle.subTitle3(
                        color: RemovalColor.white,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '2024. 3. 10 오후 3:08',
                      style: RemovalTextStyle.body3(
                        color: RemovalColor.gray30,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '00 : 20',
                      style: RemovalTextStyle.body3(
                        color: RemovalColor.gray30,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return const MainSettingBottomSheet();
                },
              );
            },
            child: SvgPicture.asset(
              "assets/images/icon/main/dots_vertical_icon.svg",
            ),
          ),
        ],
      ),
    );
  }
}
