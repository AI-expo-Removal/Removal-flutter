import 'package:flutter/material.dart';
import 'package:removal_flutter/core/component/fonts/removal_text_style.dart';

class RemovalButton extends StatelessWidget {
  final Color color;
  final String text;
  final Color? backgroundColor;
  final Gradient? gradient;

  const RemovalButton({
    super.key,
    required this.color,
    required this.text,
    this.backgroundColor,
    this.gradient,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 48,
      decoration: BoxDecoration(
        gradient: gradient,
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
