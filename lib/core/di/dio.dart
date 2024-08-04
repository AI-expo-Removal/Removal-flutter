import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:removal_flutter/core/di/base_url.dart';
import 'package:removal_flutter/core/di/provider/re_issue/re_issue_view_model_provider.dart';
import 'package:removal_flutter/core/jwt_store/jwt_store.dart';
import 'package:removal_flutter/core/jwt_store/jwt_store_properties.dart';

final Dio dio = Dio(
  BaseOptions(
    baseUrl: baseUrl,
  ),
);
