import 'dart:io';

import 'package:removal_flutter/data/data_sources/video/remote/remote_video_data_source.dart';
import 'package:removal_flutter/domain/models/video/upload_video_response_model.dart';
import 'package:removal_flutter/domain/models/video/video_response_model.dart';
import 'package:removal_flutter/domain/repositories/video_repository.dart';

class VideoRepositoryImpl implements VideoRepository {
  final RemoteVideoDataSource _remoteVideoDataSource;

  VideoRepositoryImpl({required RemoteVideoDataSource remoteVideoDataSource}) : _remoteVideoDataSource = remoteVideoDataSource;

  @override
  Future<UploadVideoResponseModel> uploadVideo({required File video}) async {
    return await _remoteVideoDataSource.uploadVideo(video: video);
  }

  @override
  Future<VideoResponseModel> getBasicSubtitleVideo({required String videoPath}) async {
    return await _remoteVideoDataSource.getBasicSubtitleVideo(videoPath: videoPath);
  }
}
