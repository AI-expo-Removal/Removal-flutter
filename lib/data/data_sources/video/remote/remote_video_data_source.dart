import 'package:dio/dio.dart';
import 'package:removal_flutter/core/di/dio.dart';

class RemoteVideoDataSource {
  Future<void> uploadVideo({
    required String videoUrl,
  }) async {
    Map<String, dynamic> data = {
      "videoUrl": videoUrl,
    };

    try {
      await dio.post(
        "/video",
        data: data,
        options: Options(
          headers: {
            "Content-Type": "application/json",
          },
        ),
      );
    } catch (err) {
      throw Exception(err.toString());
    }
  }

  Future<void> getVideo() async {

  }
}
