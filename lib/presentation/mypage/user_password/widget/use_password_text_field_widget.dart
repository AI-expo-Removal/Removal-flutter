import 'package:flutter/material.dart';

class PasswordTextField extends StatelessWidget {
  const PasswordTextField ({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Padding(padding: const EdgeInsets.only(left: 35, right: 35),
          child: TextField(
            obscureText: true,
          ),
        )
      ],
    );
  }
}
