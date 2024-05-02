import 'package:flutter/material.dart';
import 'package:removal_flutter/core/component/widget/removal_button.dart';
import 'package:removal_flutter/core/removal.dart';

class EditPasswordButton extends StatelessWidget {
  const EditPasswordButton({super.key});

  @override
  Widget build(BuildContext context) {
    return RemovalButton(
      text: '변경하기', color: RemovalColor.white,
    );
  }
}
