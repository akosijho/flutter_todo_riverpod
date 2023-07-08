import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_todo_riverpod/common/utils/constants.dart';
import 'package:flutter_todo_riverpod/common/widgets/app_style.dart';
import 'package:flutter_todo_riverpod/common/widgets/gap.dart';
import 'package:flutter_todo_riverpod/common/widgets/my_outlined_button.dart';
import 'package:flutter_todo_riverpod/common/widgets/my_text.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends ConsumerState<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          child: ListView(
            children: [
              const Gap(
                height: 16,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                child: Image.asset(
                  AppConstants.todo,
                  width: 300,
                ),
              ),
              const Gap(
                height: 48,
              ),
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.only(left: 16.w),
                child: MyText(
                  text: 'Please enter your phone number',
                  style: appStyle(16, AppConstants.kLight, FontWeight.w500),
                ),
              ),
              const Gap(
                height: 24,
              ),
              const Gap(
                height: 24,
              ),
              MyOutlinedButton(
                  buttonStyle: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(AppConstants.kLight),
                      side: MaterialStateProperty.all(BorderSide.none)),
                  onPressed: () {},
                  child: MyText(
                    text: 'Send Code',
                    style: appStyle(24, AppConstants.kBkDark, FontWeight.bold),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
