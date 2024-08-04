import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:removal_flutter/domain/models/video/compressed_video_response_model.dart';
import 'package:removal_flutter/domain/use_cases/video_use_case.dart';

class CompressVideoViewModel extends StateNotifier<CompressedVideoResponseModel> {
  final VideoUseCase _videoUseCase;

  CompressVideoViewModel({
    required VideoUseCase videoUseCase,
  })  : _videoUseCase = videoUseCase,
        super(CompressedVideoResponseModel(statusCode: null));

  Future<void> compressVideo({
    required String path,
  }) async {
    try {
      final res = await _videoUseCase.compressVideo(path: path);
      state =  CompressedVideoResponseModel(statusCode: res.statusCode);
    } catch (err) {
      throw Exception(err.toString());
    }
  }
}
