import 'dart:io';

import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:dio/dio.dart';
import 'package:amplify_storage_s3/amplify_storage_s3.dart';
import 'package:removal_flutter/core/di/dio.dart';

class RemoteVideoDataSource {
  Future<void> uploadS3(File file) async {
    // Upload image with the current time as the key
    final key = DateTime.now().toString();
    try {
      final result = await Amplify.Storage.uploadFile(
        local: file,
        key: key,
        onProgress: (progress) {
          safePrint('Fraction completed: ${progress.getFractionCompleted()}');
        },
      );
      safePrint('Successfully uploaded image: ${result.key}');
    } on StorageException catch (e) {
      safePrint('Error uploading image: $e');
    }
  }

  Future<void> uploadRemoval({
    required File video,
  }) async {
    try {
      await dio.post(
        "/removal",
        data: video,
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
