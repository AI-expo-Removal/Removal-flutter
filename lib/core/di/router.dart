import 'dart:io';

import 'package:go_router/go_router.dart';
import 'package:removal_flutter/presentation/main/view/main_screen.dart';
import 'package:removal_flutter/presentation/video/view/compressed_video_screen.dart';
import 'package:removal_flutter/presentation/video/view/video_amplify_screen.dart';
import 'package:removal_flutter/presentation/video/view/video_screen.dart';
import 'package:video_editor/video_editor.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const MainScreen(),
    ),
    GoRoute(
      path: '/video',
      builder: (context, state) {
        return VideoScreen(file: state.extra as File);
      },
    ),
    GoRoute(
      path: '/videoAmplify',
      builder: (context, state) {
        return VideoAmplifyScreen(controller: state.extra as VideoEditorController);
      },
    ),
    GoRoute(
      path: '/compressed',
      builder: (context, state) {
        return CompressedVideoScreen(path: state.extra as String);
      },
    ),
  ],
);
