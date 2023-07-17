import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_todo_riverpod/common/utils/constants.dart';
import 'package:flutter_todo_riverpod/common/widgets/app_style.dart';
import 'package:flutter_todo_riverpod/common/widgets/gap.dart';
import 'package:flutter_todo_riverpod/common/widgets/my_text.dart';

class Notfications extends StatelessWidget {
  const Notfications({super.key, this.payload});

  final String? payload;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w,
                  vertical: 20.h),
              child: Container(
                height: AppConstants.kHeight * 0.8,
                width: AppConstants.kWidth,
                decoration: BoxDecoration(
                  color: AppConstants.kBkLight,
                  borderRadius: BorderRadius.circular(AppConstants.kRadius),
                ),
                child: Padding(
                  padding: EdgeInsets.all(12.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MyText(
                        text: "Reminder",
                        style: appStyle(40, AppConstants.kLight, FontWeight.bold),
                      ),
                      const Gap(
                        height: 4,
                      ),
                      Container(
                        width: AppConstants.kWidth,
                        padding: const EdgeInsets.only(left: 8),
                        decoration:
                            BoxDecoration(color: AppConstants.kYellow, borderRadius: BorderRadius.circular(9.h)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            MyText(
                              text: "Today",
                              style: appStyle(14, AppConstants.kBkDark, FontWeight.bold),
                            ),
                            const Gap(
                              width: 16,
                            ),
                            MyText(
                              text: "From : start To : end",
                              style: appStyle(14, AppConstants.kBkDark, FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      const Gap(
                        height: 8,
                      ),
                      MyText(
                        text: "Title",
                        style: appStyle(14, AppConstants.kBkDark, FontWeight.bold),
                      ),
                      const Gap(
                        height: 8,
                      ),
                      Text(
                        'Task Details',
                        maxLines: 8,
                        textAlign: TextAlign.justify,
                        style: appStyle(16, AppConstants.kLight, FontWeight.normal),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              right: 08.w,
                child: Image.asset(
              AppConstants.bell,
              width: 64.w,
              height: 64.h,
            )),
            Positioned(
                bottom: -AppConstants.kHeight*0.056,
                left: 0,
                right: 0,
                child: Image.asset(
                  AppConstants.notification,
                  width: AppConstants.kWidth*0.8,
                  height: AppConstants.kHeight*0.6,
                ))
          ],
        ),
      ),
    );
  }
}
