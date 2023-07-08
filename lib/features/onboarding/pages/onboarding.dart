import 'package:flutter/material.dart';
import 'package:flutter_todo_riverpod/features/onboarding/widgets/page_one.dart';
import 'package:flutter_todo_riverpod/features/onboarding/widgets/page_two.dart';

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
          )
        ],
      ),
    );
  }
}
