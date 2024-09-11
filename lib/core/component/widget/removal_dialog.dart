import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:removal_flutter/core/constants/removal_style.dart';

class RemovalDialog extends StatelessWidget {
  final String content;
  final Function cancelFunc;
  final Function acceptFunc;

  const RemovalDialog({
    super.key,
    required this.content,
    required this.cancelFunc,
    required this.acceptFunc,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        decoration: BoxDecoration(
          color: RemovalColor.gray90,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 30, 0, 24),
              child: Text(
                content,
                style: RemovalTextStyle.subTitle3(
                  color: RemovalColor.white,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 46, vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      cancelFunc();
                    },
                    child: Text(
                      "취소",
                      style: RemovalTextStyle.subTitle3(
                        color: RemovalColor.white,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      acceptFunc();
                    },
                    child: Text(
                      "확인",
                      style: RemovalTextStyle.subTitle3(
                        color: RemovalColor.red,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
