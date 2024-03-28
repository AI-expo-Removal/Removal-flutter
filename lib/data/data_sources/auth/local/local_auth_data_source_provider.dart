import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:removal_flutter/core/jwt_store/jwt_store_provider.dart';
import 'package:removal_flutter/data/data_sources/auth/local/local_auth_data_source.dart';

final localAuthDataSourceProvider = Provider<LocalAuthDataSource>(
    (ref) => LocalAuthDataSource(jwtStore: ref.watch(jwtStoreProvider)));
