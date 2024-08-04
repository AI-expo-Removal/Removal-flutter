import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:removal_flutter/core/removal.dart';
import 'package:video_editor/video_editor.dart';

class CompressedVideoScreen extends StatefulWidget {
  final String path;

  const CompressedVideoScreen({
    super.key,
    required this.path,
  });

  @override
  State<CompressedVideoScreen> createState() => _CompressedVideoScreenState();
}

class _CompressedVideoScreenState extends State<CompressedVideoScreen> {
  late final VideoEditorController _controller;

  @override
  void initState() {
    super.initState();
    _initVideoController();
  }

  Future<void> _initVideoController() async {
    _controller = VideoEditorController.file(
      File(widget.path),
      minDuration: const Duration(seconds: 0),
      maxDuration: const Duration(seconds: 60),
    );
    await _controller.initialize().then((_) {
      setState(() {});
    }).catchError((error) {
      if (error is VideoMinDurationError) {
        // handle minimum duration bigger than video duration error
        context.pop('/');
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!_controller.initialized) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    return Scaffold(
      backgroundColor: RemovalColor.gray100,
      body: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          Center(
            child: CropGridViewer.preview(
              controller: _controller,
            ),
          ),
          Positioned(
            bottom: 52,
            left: 20,
            child: GestureDetector(
              onTap: () {
                context.pop('/');
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
