import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:removal_flutter/domain/models/auth/user/user_model.dart';

part 'user_entity.freezed.dart';

part 'user_entity.g.dart';

@freezed
class UserEntity with _$UserEntity {
  factory UserEntity({
    required String accountId,
    required String name,
  }) = _UserEntity;

  factory UserEntity.fromJson(Map<String, dynamic> json) =>
      _$UserEntityFromJson(json);
}

extension UserExtension on UserEntity {
  UserModel toModel() => UserModel(
    accountId: accountId,
    name: name,
  );
}
