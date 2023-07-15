import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_todo_riverpod/common/helpers/db_helper.dart';
import 'package:flutter_todo_riverpod/common/routes/routes.dart';
import 'package:flutter_todo_riverpod/common/utils/app_esceptions.dart';

final authRepositoryProvider = Provider((ref) {
  return AuthRepository(auth: FirebaseAuth.instance);
});

class AuthRepository {
  final FirebaseAuth auth;

  AuthRepository({required this.auth});

  Future<Either<AppExceptions, bool>> verifyOTP(
      {required BuildContext context,
      required String smsCodeID,
      required String smsCode,
      required bool mounted}) async {
    try {
      final credential = PhoneAuthProvider.credential(
          verificationId: smsCodeID, smsCode: smsCode);

      await auth.signInWithCredential(credential);
      if (!mounted) {
        return const Right(false);
      }
      Navigator.pushNamedAndRemoveUntil(context, Routes.home, (route) => false);
      return const Right(true);
    } on FirebaseAuthException catch (e) {
      return Left(AppExceptions.show(e.message!));
    }
  }

  void sendOtp(
      {required BuildContext context, required String phoneNumber}) async {
    try {
      await auth.verifyPhoneNumber(
          phoneNumber: phoneNumber,
          verificationCompleted: (PhoneAuthCredential credential) async {
            await auth.signInWithCredential(credential);
          },
          verificationFailed: (e) {
            AppExceptions.show(e.message!);
          },
          codeSent: (smsCodeId, resendCodeId) {
            DBHelper.createUser(1);
            Navigator.pushNamedAndRemoveUntil(
                context, Routes.otp, (route) => false,
                arguments: {'phone': phoneNumber, 'smsCodeId': smsCodeId});
          },
          codeAutoRetrievalTimeout: (String smsCodeId) {});
    } on FirebaseAuthException catch (e) {
      AppExceptions.show(e.message!);
    }
  }
}
