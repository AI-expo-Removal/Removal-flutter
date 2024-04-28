import 'dart:io';

import 'package:removal_flutter/domain/repositories/video_repository.dart';

class VideoUseCase {
  final VideoRepository _repository;

  VideoUseCase({required VideoRepository repository}) : _repository = repository;

  Future<void> uploadRemoval({required File video}) async {
    await _repository.uploadRemoval(video: video);
  }

  Future<void> uploadTranslate({required File video}) async {
    await _repository.uploadTranslate(video: video);
  }

  Future<void> uploadVideo({required File video}) async {
    await _repository.uploadVideo(video: video);
  }
}