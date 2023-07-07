import 'package:flutter/material.dart';
import 'package:flutter_todo_riverpod/common/utils/constants.dart';
import 'package:flutter_todo_riverpod/common/widgets/app_style.dart';
import 'package:flutter_todo_riverpod/common/widgets/gap.dart';
import 'package:flutter_todo_riverpod/common/widgets/my_text.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center, children: [
          MyText(
            text: 'Todo with Rieverpod',
            style: appStyle(26, AppConstants.kBlueLight, FontWeight.bold),
          ),
          const Gap(height: 56),
          MyText(
            text: 'Todo with Rieverpod',
            style: appStyle(26, AppConstants.kBlueLight, FontWeight.bold),
          )
        ]),
      ),
    );
  }
}
