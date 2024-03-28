import 'package:dio/dio.dart';
import 'package:removal_flutter/core/di/dio.dart';

class RemoteSMSDataSource {
  Future<void> postSMS({
    required String phoneNumber,
  }) async {
    Map<String, dynamic> data = {
      "phoneNumber": phoneNumber,
    };

    try {
      await dio.post(
        "/sms",
        data: data,
        options: Options(
          headers: {"Content-Type": "application/json"},
        ),
      );
    } catch (err) {
      throw Exception(err.toString());
    }
  }

  Future<void> getSMS({
    required String phoneNumber,
    required String randomNumber,
  }) async {
    Map<String, dynamic> data = {
      "phoneNumber": phoneNumber,
      "randomNumber": randomNumber,
    };

    try {
      await dio.get(
        "/sms",
        data: data,
        options: Options(
          headers: {"Content-Type": "application/json"},
        ),
      );
    } catch (err) {
      throw Exception(err.toString());
    }
  }
}
