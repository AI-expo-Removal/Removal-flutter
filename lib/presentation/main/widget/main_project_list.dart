import 'package:flutter/material.dart';
import 'package:removal_flutter/presentation/main/widget/main_project_widget.dart';

class MainProjectList extends StatefulWidget {
  const MainProjectList({super.key});

  @override
  State<MainProjectList> createState() => _MainProjectListState();
}

class _MainProjectListState extends State<MainProjectList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 12,
      itemBuilder: (context, index) {
        return const MainProjectWidget();
      },
    );
  }
}
