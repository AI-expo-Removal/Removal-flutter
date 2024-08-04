import 'dart:io';

import 'package:removal_flutter/domain/models/video/compressed_video_response_model.dart';
import 'package:removal_flutter/domain/models/video/upload_video_response_model.dart';
import 'package:removal_flutter/domain/models/video/video_response_model.dart';

abstract class VideoRepository {
  Future<UploadVideoResponseModel> uploadVideo({
    required File video,
  });

  Future<CompressedVideoResponseModel> compressVideo({
    required String path,
  });

  Future<VideoResponseModel> getVideo({
    required String videoName,
  });
}
