import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_todo_riverpod/common/utils/constants.dart';
import 'package:flutter_todo_riverpod/common/widgets/app_style.dart';
import 'package:flutter_todo_riverpod/common/widgets/gap.dart';
import 'package:flutter_todo_riverpod/common/widgets/my_text.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class TodoTile extends StatelessWidget {
  const TodoTile(
      {super.key,
      this.color,
      this.title,
      this.description,
      this.start,
      this.end,
      this.editWidget,
      this.onPressed});

  final Color? color;
  final String? title, description, start, end;
  final Widget? editWidget;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.all(8.h),
            width: AppConstants.kWidth,
            decoration: BoxDecoration(
                color: AppConstants.kGreyDk,
                borderRadius: BorderRadius.circular(AppConstants.kRadius)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      height: 80,
                      width: 5,
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(AppConstants.kRadius),
                          color: color ?? AppConstants.kRed),
                    ),
                    const Gap(
                      width: 16,
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.h),
                      child: SizedBox(
                        // width: AppConstants.kWidth,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            MyText(
                                text: title ?? 'Task Title',
                                style: appStyle(
                                    18, AppConstants.kLight, FontWeight.bold)),
                            const Gap(
                              height: 4,
                            ),
                            MyText(
                                text: description ?? 'Task Title',
                                style: appStyle(
                                    12, AppConstants.kLight, FontWeight.bold)),
                            // const Gap(
                            //   height: 4,
                            // ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  width: AppConstants.kWidth * 0.3,
                                  height: 24.h,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 0.3,
                                          color: AppConstants.kGreyDk),
                                      borderRadius: BorderRadius.circular(
                                          AppConstants.kRadius),
                                      color: AppConstants.kBkDark),
                                  child: MyText(
                                      text: "$start | $end",
                                      style: appStyle(12, AppConstants.kLight,
                                          FontWeight.normal)),
                                ),
                                const Gap(
                                  width: 20,
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      child: editWidget,
                                    ),
                                    const Gap(
                                      width: 20,
                                    ),
                                    IconButton(
                                        onPressed: onPressed,
                                        icon: const Icon(MaterialCommunityIcons
                                            .delete_circle))
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
