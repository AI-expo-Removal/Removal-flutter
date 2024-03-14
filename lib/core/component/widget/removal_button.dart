import 'package:flutter/material.dart';
import 'package:removal_flutter/core/component/fonts/removal_text_style.dart';

class RemovalButton extends StatelessWidget {
  final Color backgroundColor;
  final Color color;
  final String text;

  const RemovalButton({
    super.key,
    required this.backgroundColor,
    required this.color,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 48,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Center(
        child: Text(
          text,
          style: RemovalTextStyle.button2(
            color: color,
          ),
        ),
      ),
    );
  }
}
