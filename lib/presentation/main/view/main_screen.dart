import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:removal_flutter/core/removal.dart';
import 'package:removal_flutter/presentation/main/widget/main_app_bar_widget.dart';
import 'package:removal_flutter/presentation/main/widget/previous_project_text.dart';
import 'package:removal_flutter/presentation/main/widget/project_list.dart';
import 'package:removal_flutter/presentation/main/widget/create_project_widget.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: RemovalColor.gray100,
      appBar: const MainAppBar(),
      body: const SafeArea(
          child: Padding(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CreateProject(),
                PreviousProjectText(),
                ProjectList()
              ],
            ),
          )
      ),
    );
  }
}
