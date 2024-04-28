import 'dart:io';

import 'package:dio/dio.dart';
import 'package:removal_flutter/core/di/dio.dart';

class RemoteVideoDataSource {
  Future<void> uploadRemoval({
    required File video,
  }) async {

    try {
      await dio.post(
        "/removal",
        data: video,
        options: Options(
          headers: {
            "Content-Type" : "multipart/form-data",
          },
        ),
      );
    } catch (err) {
      throw Exception(err.toString());
    }
  }

  Future<void> uploadTranslate({
    required File video,
  }) async {
    try {
      await dio.post(
        "/translate",
        data: video,
        options: Options(
          headers: {
            "Content-Type": "multipart/form-data",
          },
        ),
      );
    } catch (err) {
      throw Exception(err.toString());
    }
  }

  Future<void> uploadVideo({
    required File video,
  }) async {
    FormData data = FormData.fromMap({
      'file': await MultipartFile.fromFile(video.path),
    });
    try {
      await dio.post(
        "/upload",
        data: data,
        options: Options(
          headers: {
            "Content-Type": "multipart/form-data",
          },
        ),
      );
    } catch (err) {
      throw Exception(err.toString());
    }
  }
}
