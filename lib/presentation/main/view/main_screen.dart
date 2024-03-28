import 'package:flutter/material.dart';
import 'package:removal_flutter/core/removal.dart';
import 'package:removal_flutter/presentation/main/widget/main_app_bar.dart';
import 'package:removal_flutter/presentation/main/widget/main_previous_project_text.dart';
import 'package:removal_flutter/presentation/main/widget/main_create_project_widget.dart';
import 'package:removal_flutter/presentation/main/widget/main_project_list.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: RemovalColor.gray100,
      appBar: const MainAppBar(),
      body: const SingleChildScrollView(
        child: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MainCreateProjectWidget(),
                  SizedBox(height: 50),
                  MainPreviousProjectText(),
                  SizedBox(height: 6),
                  MainProjectList(),
                ],
              ),
            )
        ),
      ),
    );
  }
}
