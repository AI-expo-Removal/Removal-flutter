import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:removal_flutter/domain/models/video/upload_video_response_model.dart';
import 'package:removal_flutter/domain/use_cases/video_use_case.dart';

class UploadVideoViewModel extends StateNotifier<UploadVideoResponseModel> {
  final VideoUseCase _videoUseCase;

  UploadVideoViewModel({
    required VideoUseCase videoUseCase,
  })  : _videoUseCase = videoUseCase,
        super(UploadVideoResponseModel(
          message: null,
          title: null,
          filePath: null,
          statusCode: const AsyncData(500),
        ));

  Future<void> uploadVideo({
    required File video,
  }) async {
    try {
      final res = await _videoUseCase.uploadVideo(video: video);
      state = res;
    } catch (err) {
      throw Exception(err.toString());
    }
  }
}
