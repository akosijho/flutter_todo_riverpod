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
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              child: Container(
                height: AppConstants.kHeight * 0.7,
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
                      Padding(
                        padding: EdgeInsets.only(left: 48.w),
                        child: MyText(
                          text: "Reminder",
                          style: appStyle(40, AppConstants.kLight, FontWeight.bold),
                        ),
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
                child: Image.asset(
              AppConstants.bell,
              width: 72.w,
              height: 72.h,
            ))
          ],
        ),
      ),
    );
  }
}
