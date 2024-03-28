import 'package:dio/dio.dart';
import 'package:removal_flutter/core/di/dio.dart';
import 'package:removal_flutter/data/entities/auth/token/token_entity.dart';
import 'package:removal_flutter/data/entities/auth/user/user_entity.dart';

class RemoteAuthDataSource {
  Future<TokenEntity> postLogin({
    required String accountId,
    required String password,
  }) async {
    Map<String, dynamic> data = {
      "accountId": accountId,
      "password": password,
    };

    try {
      final response = await dio.post(
        "/users/login",
        data: data,
        options: Options(
          headers: {"Content-Type": "application/json"},
        ),
      );
      return TokenEntity(
        accessToken: response.data['access_token'],
        refreshToken: response.data['refresh_token'],
      );
    } catch (err) {
      throw Exception(err.toString());
    }
  }

  Future<void> postSignUp({
    required String accountId,
    required String password,
    required String name,
    required String phoneNumber,
  }) async {
    Map<String, dynamic> data = {
      "accountId": accountId,
      "password": password,
      "name": name,
      "phoneNumber": phoneNumber,
    };

    try {
      await dio.post(
        "/users/signup",
        data: data,
        options: Options(
          headers: {"Content-Type": "application/json"},
        ),
      );
    } catch (err) {
      throw Exception(err.toString());
    }
  }

  Future<TokenEntity> reIssue({
    required String accessToken,
  }) async {
    try {
      final response = await dio.post(
        "/users/token",
        options: Options(
          headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer $accessToken",
          },
        ),
      );
      return TokenEntity(
        accessToken: response.data['access_token'],
        refreshToken: response.data['refresh_token'],
      );
    } catch (err) {
      throw Exception(err.toString());
    }
  }

  Future<UserEntity> getUser({
    required String accessToken,
  }) async {
    try {
      final response = await dio.get(
        "/users/user",
        options: Options(
          headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer $accessToken",
          },
        ),
      );
      return UserEntity(
        accountId: response.data['accountId'],
        name: response.data['name'],
      );
    } catch (err) {
      throw Exception(err.toString());
    }
  }

  Future<void> patchPassword({
    required String accessToken,
    required String password,
  }) async {
    Map<String, dynamic> data = {
      "password": password,
    };
    try {
      await dio.patch(
        "/users/password",
        data: data,
        options: Options(
          headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer $accessToken",
          },
        ),
      );
    } catch (err) {
      throw Exception(err.toString());
    }
  }

  Future<void> deleteUser({
    required String accessToken,
    required String accountId,
  }) async {
    try {
      await dio.delete(
        "/users/$accountId",
        options: Options(
          headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer $accessToken",
          },
        ),
      );
    } catch (err) {
      throw Exception(err.toString());
    }
  }
}
