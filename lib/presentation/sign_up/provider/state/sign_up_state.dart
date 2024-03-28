import 'package:flutter_riverpod/flutter_riverpod.dart';

enum SignUpState {
  initial,
  loading,
  success,
  failure,
  duplicate, // 아이디가 중복 되었을 때
}

final signUpUserInfoFieldStateProvider = StateProvider<bool>((ref) => false);
final signUpIdPwFieldStateProvider = StateProvider<bool>((ref) => false);