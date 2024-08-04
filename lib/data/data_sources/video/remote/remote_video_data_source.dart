import 'dart:io';
import 'package:dio/dio.dart';
import 'package:removal_flutter/core/di/dio.dart';
import 'package:removal_flutter/domain/models/video/compressed_video_response_model.dart';
import 'package:removal_flutter/domain/models/video/upload_video_response_model.dart';
import 'package:removal_flutter/domain/models/video/video_response_model.dart';

class RemoteVideoDataSource {
  Future<UploadVideoResponseModel> uploadVideo({
    required File video,
  }) async {
    FormData data = FormData.fromMap(
        {"video_file": await MultipartFile.fromFile(video.path)});

    try {
      final response = await dio.post(
        "/upload",
        data: data,
      );

      return UploadVideoResponseModel.fromJson(response.data);
    } catch (err) {
      throw Exception(err.toString());
    }
  }

  Future<CompressedVideoResponseModel> compressVideo({
    required String path,
  }) async {
    try {
      final response = await dio.post(
        "/basic-subtitle",
        queryParameters: {"video_path": path},
      );
      return CompressedVideoResponseModel(statusCode: response.statusCode);
    } catch (err) {
      throw Exception(err.toString());
    }
  }

  Future<VideoResponseModel> getVideo({
    required String videoName,
  }) async {
    try {
      final response = await dio.get(
        "/video/$videoName",
      );
      return VideoResponseModel.fromJson(response.data, response.statusCode);
    } catch (err) {
      throw Exception(err.toString());
    }
  }

}
