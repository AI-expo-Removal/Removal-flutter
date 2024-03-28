import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:removal_flutter/data/data_sources/sms/remote/remote_sms_data_source.dart';

final remoteSMSDataSourceProvider =
    Provider<RemoteSMSDataSource>((ref) => RemoteSMSDataSource());
