import 'package:flutter_riverpod/flutter_riverpod.dart';

enum SignUpState {
  initial,
  loading,
  success,
  failure,
}

final signUpUserInfoFieldStateProvider = StateProvider<bool>((ref) => false);
final signUpIdPwFieldStateProvider = StateProvider<bool>((ref) => false);