import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:removal_flutter/core/di/base_url.dart';
import 'package:removal_flutter/core/di/provider/re_issue/re_issue_view_model_provider.dart';
import 'package:removal_flutter/core/jwt_store/jwt_store.dart';
import 'package:removal_flutter/core/jwt_store/jwt_store_properties.dart';

final Dio dio = Dio(BaseOptions(baseUrl: baseUrl));

class RemovalInterceptor extends Interceptor {
  final JwtStore jwtStore;
  final Ref ref;

  RemovalInterceptor({
    required this.jwtStore,
    required this.ref,
  });

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final accessToken = await jwtStore.load(properties: JwtStoreProperties.accessToken);
    options.headers.addAll({
      "Content-Type": "application/json",
      "Authorization": "Bearer $accessToken",
    });
    return super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    final refreshToken = await jwtStore.load(properties: JwtStoreProperties.refreshToken);
    final accessToken = await jwtStore.load(properties: JwtStoreProperties.accessToken);

    if (err.response?.statusCode == 401) {
      try {
        ref.read(reIssueViewModelProvider.notifier).reIssue(accessToken: accessToken);
      } on DioError catch(err) {
        jwtStore.delete(JwtStoreProperties.accessToken);
        jwtStore.delete(JwtStoreProperties.refreshToken);

        return handler.reject(err);
      }
    }

    super.onError(err, handler);
  }
}
