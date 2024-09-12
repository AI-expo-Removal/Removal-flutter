import 'package:flutter/material.dart';
import 'package:removal_flutter/core/component/fonts/removal_text_style.dart';
import 'package:removal_flutter/core/constants/removal_style.dart';
import 'package:removal_flutter/presentation/main/widget/main_setting_option_item_widget.dart';

class MainSettingBottomSheet extends StatelessWidget {
  const MainSettingBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: RemovalColor.gray90,
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(12),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: RemovalColor.gray70,
                    width: 1,
                  ),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "33333333333",
                      style: RemovalTextStyle.body1(
                        color: RemovalColor.gray40,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      "33333333333",
                      style: RemovalTextStyle.caption2(
                        color: RemovalColor.gray40,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            MainSettingOptionItemWidget(
              title: "제목 수정",
              iconPath: "assets/images/icon/main/edit_project_title_icon.svg",
              color: RemovalColor.white,
            ),
            MainSettingOptionItemWidget(
              title: "삭제",
              iconPath: "assets/images/icon/main/trash_can_icon.svg",
              color: RemovalColor.red,
            ),
          ],
        ),
      ),
    );
  }
}
