import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_todo_riverpod/common/utils/constants.dart';
import 'package:flutter_todo_riverpod/common/widgets/app_style.dart';
import 'package:flutter_todo_riverpod/common/widgets/gap.dart';
import 'package:flutter_todo_riverpod/common/widgets/my_text.dart';
import 'package:flutter_todo_riverpod/features/auth/controllers/auth_controller.dart';
import 'package:pinput/pinput.dart';

class OtpPage extends ConsumerWidget {
  const OtpPage({super.key, required this.smsCodeId, required this.phone});

  final String smsCodeId;
  final String phone;

  verifyOtp(BuildContext context, WidgetRef ref, String smsCode) {
    ref
        .read(authControllerProvider)
        .verifyOtpCode(context: context, smsCodeID: smsCodeId, smsCode: smsCode, mounted: true);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Gap(
                height: AppConstants.kHeight * 0.15,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 32.w),
                child: Image.asset(
                  AppConstants.todo,
                  width: AppConstants.kWidth * 0.5,
                ),
              ),
              const Gap(
                height: 32,
              ),
              MyText(
                  text: 'Enter your otp',
                  style: appStyle(18, AppConstants.kLight, FontWeight.bold)),
              const Gap(
                height: 24,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                child: Pinput(
                  length: 6,
                  onCompleted: (value) {
                    if (value.length == 6) {
                      verifyOtp(context, ref, value);
                    }
                  },
                  onSubmitted: (value) {
                    if (value.length == 6) {
                      verifyOtp(context, ref, value);
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
