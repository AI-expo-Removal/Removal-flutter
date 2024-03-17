import 'package:flutter/material.dart';
import 'package:removal_flutter/core/removal.dart';
import 'package:removal_flutter/core/removal_color.dart';

class CreateProject extends StatelessWidget {
  const CreateProject({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 28),
        Container(
          height: 100,
          padding: const EdgeInsets.only(left: 20, right: 20),
          decoration: BoxDecoration(
            gradient: RemovalColor.main,
            borderRadius: BorderRadius.circular(8)
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.add_circle_rounded,
                color: RemovalColor.white,
                size: 22,
              ),
              const SizedBox(width: 8),
              Text(
                '새 프로젝트',
                style: RemovalTextStyle.button1(
                  color: RemovalColor.white,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
