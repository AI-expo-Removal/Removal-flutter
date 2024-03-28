import 'package:removal_flutter/data/data_sources/auth/local/local_auth_data_source.dart';
import 'package:removal_flutter/data/data_sources/auth/remote/remote_auth_data_source.dart';
import 'package:removal_flutter/data/entities/auth/token/token_entity.dart';
import 'package:removal_flutter/data/entities/auth/user/user_entity.dart';
import 'package:removal_flutter/domain/models/auth/token/token_model.dart';
import 'package:removal_flutter/domain/models/auth/user/user_model.dart';
import 'package:removal_flutter/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final RemoteAuthDataSource _remoteAuthDataSource;
  final LocalAuthDataSource _localAuthDataSource;

  AuthRepositoryImpl({
    required RemoteAuthDataSource remoteAuthDataSource,
    required LocalAuthDataSource localAuthDataSource,
  })  : _remoteAuthDataSource = remoteAuthDataSource,
        _localAuthDataSource = localAuthDataSource;

  @override
  Future<TokenModel> postLogin({
    required String accountId,
    required String password,
  }) async {
    final entity = await _remoteAuthDataSource.postLogin(
      accountId: accountId,
      password: password,
    );
    return entity.toModel();
  }

  @override
  Future<void> postSignUp({
    required String accountId,
    required String password,
    required String name,
    required String phoneNumber,
  }) async {
    await _remoteAuthDataSource.postSignUp(
      accountId: accountId,
      password: password,
      name: name,
      phoneNumber: phoneNumber,
    );
  }

  @override
  Future<TokenModel> reIssue({
    required String accessToken,
  }) async {
    final entity = await _remoteAuthDataSource.reIssue(
      accessToken: accessToken,
    );
    return entity.toModel();
  }

  @override
  Future<UserModel> getUser({
    required String accessToken,
  }) async {
    final entity = await _remoteAuthDataSource.getUser(
      accessToken: accessToken,
    );
    return entity.toModel();
  }

  @override
  Future<void> patchPassword({
    required String accessToken,
    required String password,
  }) async {
    await _remoteAuthDataSource.patchPassword(
      accessToken: accessToken,
      password: password,
    );
  }

  @override
  Future<void> deleteUser({
    required String accessToken,
    required String accountId,
  }) async {
    await _remoteAuthDataSource.deleteUser(
      accessToken: accessToken,
      accountId: accountId,
    );
  }

  @override
  Future<void> saveToken({
    required String accessToken,
    required String refreshToken,
  }) async {
    await _localAuthDataSource.saveToken(
      accessToken: accessToken,
      refreshToken: refreshToken,
    );
  }
}
