import 'package:flutter/material.dart';
import 'package:flutter_todo_riverpod/common/utils/constants.dart';
import 'package:flutter_todo_riverpod/common/widgets/app_style.dart';
import 'package:flutter_todo_riverpod/common/widgets/gap.dart';
import 'package:flutter_todo_riverpod/common/widgets/my_text.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BottomTitles extends StatelessWidget {
  const BottomTitles(
      {super.key,
      required this.text,
      required this.text2,
      this.color});

  final String text, text2;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppConstants.kWidth,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Consumer(builder: (context, ref, child) {
              return Container(
                height: 56,
                width: 5,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(AppConstants.kRadius),
                    color: AppConstants.kGreen),
              );
            }),
            const Gap(
              width: 16,
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyText(
                      text: text,
                      style:
                          appStyle(24, AppConstants.kLight, FontWeight.bold)),
                  const Gap(
                    height: 12,
                  ),
                  MyText(
                      text: text2,
                      style:
                          appStyle(12, AppConstants.kLight, FontWeight.normal)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
