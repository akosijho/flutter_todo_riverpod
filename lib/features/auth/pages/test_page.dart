import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_todo_riverpod/common/utils/constants.dart';
import 'package:flutter_todo_riverpod/common/widgets/app_style.dart';
import 'package:flutter_todo_riverpod/common/widgets/my_text.dart';
import 'package:flutter_todo_riverpod/features/auth/controllers/code_provider.dart';


/*
* Test page for watching and reading providers using [ConsumerWidget] from Riverpod
* */
class TestPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String code = ref.watch(codeStateProvider);
    return Scaffold(
      appBar: AppBar(),
      body: Center(
          child: Column(
            children: [
              MyText(text: code, style: appStyle(30, AppConstants.kLight, FontWeight.bold)),
              TextButton(onPressed: () {
                ref.read(codeStateProvider.notifier).setStart('Generated value from Riverpod');
              }, child: Text('Press Me'))
            ],
          )
      ),
    );
  }

}