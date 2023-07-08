import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_todo_riverpod/common/utils/constants.dart';
import 'package:flutter_todo_riverpod/features/todo/pages/homepage.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        useInheritedMediaQuery: true,
        minTextAdapt: true,
        designSize: const Size(375, 825),
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Todo - Riverpod',
            themeMode: ThemeMode.dark,
            theme: ThemeData(
                scaffoldBackgroundColor: AppConstants.kBkDark,
                primarySwatch: Colors.blue, useMaterial3: true),
            home: const MyHomePage(),
          );
        });
  }
}
