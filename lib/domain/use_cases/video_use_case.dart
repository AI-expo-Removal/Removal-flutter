import 'dart:io';
import 'package:removal_flutter/domain/models/video/upload_video_response_model.dart';
import 'package:removal_flutter/domain/models/video/video_response_model.dart';
import 'package:removal_flutter/domain/repositories/video_repository.dart';

class VideoUseCase {
  final VideoRepository _repository;

  VideoUseCase({required VideoRepository repository}) : _repository = repository;

  Future<UploadVideoResponseModel> uploadVideo({required File video}) async {
    return await _repository.uploadVideo(video: video);
  }

  Future<VideoResponseModel> getBasicSubtitleVideo({required String videoPath}) async {
    return await _repository.getBasicSubtitleVideo(videoPath: videoPath);
  }
}
