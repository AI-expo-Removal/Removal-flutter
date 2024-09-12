import 'package:dio/dio.dart';
import 'package:removal_flutter/core/base_url.dart';

final Dio dio = Dio(
  BaseOptions(
    baseUrl: baseUrl,
  ),
);
