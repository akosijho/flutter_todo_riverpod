import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_todo_riverpod/common/utils/constants.dart';
import 'package:flutter_todo_riverpod/common/widgets/app_style.dart';
import 'package:flutter_todo_riverpod/common/widgets/gap.dart';
import 'package:flutter_todo_riverpod/common/widgets/my_text.dart';
import 'package:flutter_todo_riverpod/features/onboarding/widgets/page_one.dart';
import 'package:flutter_todo_riverpod/features/onboarding/widgets/page_two.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  final PageController pageController = PageController();

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: pageController,
            physics: const AlwaysScrollableScrollPhysics(),
            children: const [
              PageOne(),
              PageTwo(),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Ionicons.chevron_forward_circle,
                            size: 30, color: AppConstants.kLight),
                        onPressed: () {},
                      ),
                      const Gap(
                        width: 8,
                      ),
                      MyText(
                          text: 'Skip',
                          style: appStyle(
                              16, AppConstants.kLight, FontWeight.w500))
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
