import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:removal_flutter/domain/models/auth/token/token_model.dart';

part 'token_entity.freezed.dart';

part 'token_entity.g.dart';

@freezed
class TokenEntity with _$TokenEntity {
  factory TokenEntity({
    required String accessToken,
    required String refreshToken,
  }) = _TokenEntity;

  factory TokenEntity.fromJson(Map<String, dynamic> json) =>
      _$TokenEntityFromJson(json);
}

extension TokenExtension on TokenEntity {
  TokenModel toModel() => TokenModel(
        accessToken: accessToken,
        refreshToken: refreshToken,
      );
}
