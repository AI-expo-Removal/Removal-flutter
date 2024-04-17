import 'package:removal_flutter/domain/models/auth/token/token_model.dart';
import 'package:removal_flutter/domain/models/auth/user/user_model.dart';

abstract class AuthRepository {
  Future<TokenModel> postLogin({
    required String accountId,
    required String password,
  });

  Future<void> postSignUp({
    required String accountId,
    required String password,
    required String name,
  });

  Future<TokenModel> reIssue({
    required String accessToken,
  });

  Future<UserModel> getUser({
    required String accessToken,
  });

  Future<void> patchPassword({
    required String accessToken,
    required String password,
  });

  Future<void> deleteUser({
    required String accessToken,
    required String accountId,
  });

  Future<void> saveToken({
    required String accessToken,
    required String refreshToken,
  });
}
