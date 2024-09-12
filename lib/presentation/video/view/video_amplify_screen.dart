import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:removal_flutter/core/constants/removal_style.dart';
import 'package:video_editor/video_editor.dart';

class VideoAmplifyScreen extends StatefulWidget {
  final VideoEditorController? controller;

  const VideoAmplifyScreen({
    super.key,
    required this.controller,
  });

  @override
  State<VideoAmplifyScreen> createState() => _VideoAmplifyScreenState();
}

class _VideoAmplifyScreenState extends State<VideoAmplifyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: RemovalColor.gray100,
      body: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          Center(
            child: CropGridViewer.preview(
              controller: widget.controller as VideoEditorController,
            ),
          ),
          Positioned(
            bottom: 52,
            left: 20,
            child: GestureDetector(
              onTap: () {
                context.pop('/video');
              },
              child: SvgPicture.asset(
                "assets/images/icon/video/reduce_icon.svg",
              ),
            ),
          ),
        ],
      ),
    );
  }
}
