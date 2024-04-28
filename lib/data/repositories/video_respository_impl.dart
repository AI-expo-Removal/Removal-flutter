import 'dart:io';

import 'package:removal_flutter/data/data_sources/video/remote/remote_video_data_source.dart';
import 'package:removal_flutter/domain/repositories/video_repository.dart';

class VideoRepositoryImpl implements VideoRepository {
  final RemoteVideoDataSource _remoteVideoDataSource;

  VideoRepositoryImpl({required RemoteVideoDataSource remoteVideoDataSource}) : _remoteVideoDataSource = remoteVideoDataSource;


  @override
  Future<void> uploadRemoval({required File video}) async {
    await _remoteVideoDataSource.uploadRemoval(video: video);
  }

  @override
  Future<void> uploadTranslate({required File video}) async {
    await _remoteVideoDataSource.uploadTranslate(video: video);
  }

  @override
  Future<void> uploadVideo({required File video}) async {
    await _remoteVideoDataSource.uploadVideo(video: video);
  }
}