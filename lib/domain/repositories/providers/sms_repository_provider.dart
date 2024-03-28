import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:removal_flutter/data/data_sources/sms/remote/remote_sms_data_source_provider.dart';
import 'package:removal_flutter/data/repositories/sms_repository_impl.dart';

final smsRepositoryProvider = Provider<SMSRepositoryImpl>((ref) {
  final remoteSMSDataSource = ref.watch(remoteSMSDataSourceProvider);
  return SMSRepositoryImpl(remoteSMSDataSource: remoteSMSDataSource);
});
