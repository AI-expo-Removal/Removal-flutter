import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:removal_flutter/domain/use_cases/video_use_case.dart';
import 'package:removal_flutter/presentation/video/provider/state/video_state.dart';

class VideoViewModel extends StateNotifier<VideoState> {
  final VideoUseCase _videoUseCase;

  VideoViewModel({
    required VideoUseCase videoUseCase,
  })  : _videoUseCase = videoUseCase,
        super(VideoState.initial);

  Future<void> uploadS3(File video) async {
    state = VideoState.loading;
    try {
      await _videoUseCase.uploadS3(video);
      state = VideoState.success;
    } catch (err) {
      state = VideoState.failure;
      throw Exception(err.toString());
    }
  }

  Future<void> uploadRemoval({
    required File video,
  }) async {
    state = VideoState.loading;
    try {
      await _videoUseCase.uploadRemoval(video: video);
      state = VideoState.success;
    } catch (err) {
      state = VideoState.failure;
      throw Exception(err.toString());
    }
  }

  Future<void> uploadTranslate({
    required File video,
  }) async {
    state = VideoState.loading;
    try {
      await _videoUseCase.uploadTranslate(video: video);
      state = VideoState.success;
    } catch (err) {
      state = VideoState.failure;
      throw Exception(err.toString());
    }
  }

  Future<void> uploadVideo({
    required File video,
  }) async {
    state = VideoState.loading;
    try {
      await _videoUseCase.uploadVideo(video: video);
      state = VideoState.success;
    } catch (err) {
      state = VideoState.failure;
      throw Exception(err.toString());
    }
  }
}
