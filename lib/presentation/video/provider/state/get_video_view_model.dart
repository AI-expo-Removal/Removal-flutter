
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:removal_flutter/domain/models/video/video_response_model.dart';
import 'package:removal_flutter/domain/use_cases/video_use_case.dart';

class GetVideoViewModel extends StateNotifier<VideoResponseModel> {
  final VideoUseCase _videoUseCase;

  GetVideoViewModel({
    required VideoUseCase videoUseCase,
  })  : _videoUseCase = videoUseCase,
        super(VideoResponseModel(videoPath: null, statusCode: null));

  // Future<void> uploadVideo({
  //   required File video,
  // }) async {
  //   try {
  //     final res = await _videoUseCase.uploadVideo(video: video);
  //     state = res;
  //   } catch (err) {
  //     throw Exception(err.toString());
  //   }
  // }

  Future<void> getVideo({
    required String videoName,
  }) async {
    try {
      final res = await _videoUseCase.getVideo(videoName: videoName);
      state = state.copyWith(statusCode: res.statusCode, videoPath: res.videoPath);
    } catch (err) {
      throw Exception(err.toString());
    }
  }
}
