import 'package:flutter/cupertino.dart';
import 'package:flutter_todo_riverpod/features/auth/repository/auth_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final authControllerProvider = Provider((ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return AuthController(authRepository: authRepository);
});

class AuthController {
  final AuthRepository authRepository;

  AuthController({required this.authRepository});

  void verifyOtpCode({
    required BuildContext context,
    required String smsCodeID,
    required String smsCode,
    required bool mounted,
  }) {
    authRepository.verifyOTP(
        context: context,
        smsCodeID: smsCodeID,
        smsCode: smsCode,
        mounted: mounted);
  }

  void sendSms({required BuildContext context, required String phoneNumber}) {
    authRepository.sendOtp(context: context, phoneNumber: phoneNumber);
  }
}
