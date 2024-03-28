import 'package:removal_flutter/core/jwt_store/jwt_store.dart';
import 'package:removal_flutter/core/jwt_store/jwt_store_properties.dart';

class LocalAuthDataSource {
  final JwtStore _jwtStore;

  LocalAuthDataSource({required JwtStore jwtStore}) : _jwtStore = jwtStore;

  Future<void> saveToken({
    required String accessToken,
    required String refreshToken,
  }) async {
    await _jwtStore.save(
      properties: JwtStoreProperties.accessToken,
      value: accessToken,
    );
    await _jwtStore.save(
      properties: JwtStoreProperties.refreshToken,
      value: refreshToken,
    );
  }

  Future<void> logOut() async {
    await _jwtStore.delete(JwtStoreProperties.accessToken);
    await _jwtStore.delete(JwtStoreProperties.refreshToken);
  }
}
