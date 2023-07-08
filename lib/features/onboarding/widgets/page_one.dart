import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_todo_riverpod/common/utils/constants.dart';
import 'package:flutter_todo_riverpod/common/widgets/app_style.dart';
import 'package:flutter_todo_riverpod/common/widgets/gap.dart';
import 'package:flutter_todo_riverpod/common/widgets/my_text.dart';

class PageOne extends StatelessWidget {
  const PageOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppConstants.kHeight,
      width: AppConstants.kWidth,
      color: AppConstants.kBkDark,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: Image.asset(AppConstants.todo),
          ),
          const Gap(
            height: 96,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              MyText(
                  text: 'ToDo with Riverpod',
                  style: appStyle(30.sp, AppConstants.kLight, FontWeight.w600)),
              const Gap(
                height: 10,
              ),
              MyText(
                  text: 'Welcome! Do you want to create a task fast and easy?',
                  textAlign: TextAlign.justify,
                  style:
                      appStyle(16, AppConstants.kLight, FontWeight.normal)),

            ],
          )
        ],
      ),
    );
  }
}
