import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:removal_flutter/core/jwt_store/jwt_store.dart';
import 'package:removal_flutter/core/jwt_store/jwt_store_impl.dart';

final jwtStoreProvider = Provider<JwtStore>((ref) {
  FlutterSecureStorage storage = const FlutterSecureStorage();
  return JwtStoreImpl(storage: storage);
});