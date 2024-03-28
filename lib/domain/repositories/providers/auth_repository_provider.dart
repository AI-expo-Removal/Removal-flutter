import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:removal_flutter/data/data_sources/auth/local/local_auth_data_source_provider.dart';
import 'package:removal_flutter/data/data_sources/auth/remote/remote_auth_data_source_provider.dart';
import 'package:removal_flutter/data/repositories/auth_repository_impl.dart';

final authRepositoryProvider = Provider<AuthRepositoryImpl>((ref) {
  final remoteAuthDataSource = ref.watch(remoteAuthDataSourceProvider);
  final localAuthDataSource = ref.watch(localAuthDataSourceProvider);
  return AuthRepositoryImpl(
    remoteAuthDataSource: remoteAuthDataSource,
    localAuthDataSource: localAuthDataSource,
  );
});
