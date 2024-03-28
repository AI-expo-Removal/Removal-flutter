import 'package:removal_flutter/domain/models/auth/token/token_model.dart';
import 'package:removal_flutter/domain/models/auth/user/user_model.dart';
import 'package:removal_flutter/domain/repositories/auth_repository.dart';

class AuthUseCase {
  final AuthRepository _repository;

  AuthUseCase({required AuthRepository repository}) : _repository = repository;

  Future<TokenModel> postLogin({
    required String accountId,
    required String password,
  }) async {
    return await _repository.postLogin(
      accountId: accountId,
      password: password,
    );
  }

  Future<void> postSignUp({
    required String accountId,
    required String password,
    required String name,
    required String phoneNumber,
  }) async {
    await _repository.postSignUp(
      accountId: accountId,
      password: password,
      name: name,
      phoneNumber: phoneNumber,
    );
  }

  Future<TokenModel> reIssue({
    required String accessToken,
  }) async {
    return await _repository.reIssue(
      accessToken: accessToken,
    );
  }

  Future<UserModel> getUser({
    required String accessToken,
  }) async {
    return await _repository.getUser(
      accessToken: accessToken,
    );
  }

  Future<void> patchPassword({
    required String accessToken,
    required String password,
  }) async {
    await _repository.patchPassword(
      accessToken: accessToken,
      password: password,
    );
  }

  Future<void> deleteUser({
    required String accessToken,
    required String accountId,
  }) async {
    await _repository.deleteUser(
      accessToken: accessToken,
      accountId: accountId,
    );
  }

  Future<void> saveToken({
    required String accessToken,
    required String refreshToken,
  }) async {
    await _repository.saveToken(
      accessToken: accessToken,
      refreshToken: refreshToken,
    );
  }
}
