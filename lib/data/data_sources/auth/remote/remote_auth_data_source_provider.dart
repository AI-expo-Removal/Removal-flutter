import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:removal_flutter/data/data_sources/auth/remote/remote_auth_data_source.dart';

final remoteAuthDataSourceProvider =
    Provider<RemoteAuthDataSource>((ref) => RemoteAuthDataSource());
