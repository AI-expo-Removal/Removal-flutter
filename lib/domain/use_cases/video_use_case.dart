import 'dart:io';
import 'package:removal_flutter/domain/models/video/compressed_video_response_model.dart';
import 'package:removal_flutter/domain/models/video/upload_video_response_model.dart';
import 'package:removal_flutter/domain/models/video/video_response_model.dart';
import 'package:removal_flutter/domain/repositories/video_repository.dart';

class VideoUseCase {
  final VideoRepository _repository;

  VideoUseCase({required VideoRepository repository}) : _repository = repository;

  Future<UploadVideoResponseModel> uploadVideo({required File video}) async {
    return await _repository.uploadVideo(video: video);
  }

  Future<CompressedVideoResponseModel> compressVideo({required String path}) async {
    return await _repository.compressVideo(path: path);
  }

  Future<VideoResponseModel> getVideo({required String videoName}) async {
    return await _repository.getVideo(videoName: videoName);
  }
}
