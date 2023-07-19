import 'package:dynamic_color/dynamic_color.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_todo_riverpod/common/models/user.dart';
import 'package:flutter_todo_riverpod/common/routes/routes.dart';
import 'package:flutter_todo_riverpod/common/utils/constants.dart';
import 'package:flutter_todo_riverpod/features/auth/controllers/user_controller.dart';
import 'package:flutter_todo_riverpod/features/auth/pages/notifications.dart';
import 'package:flutter_todo_riverpod/features/onboarding/pages/onboarding.dart';
import 'package:flutter_todo_riverpod/firebase_options.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  static final defaultLightColorScheme =
      ColorScheme.fromSwatch(primarySwatch: Colors.blue);

  static final defaultDarkColorScheme = ColorScheme.fromSwatch(
      brightness: Brightness.dark, primarySwatch: Colors.blue);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.read(userProvider.notifier).refresh();
    List<User> users = ref.watch(userProvider);
    return ScreenUtilInit(
        useInheritedMediaQuery: true,
        minTextAdapt: true,
        designSize: const Size(375, 825),
        builder: (context, child) {
          return DynamicColorBuilder(builder: (lightScheme, darkScheme) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Todo - Riverpod',
              themeMode: ThemeMode.light,
              theme: ThemeData(
                  scaffoldBackgroundColor: AppConstants.kBkDark,
                  colorScheme: lightScheme ?? defaultLightColorScheme,
                  useMaterial3: true),
              darkTheme: ThemeData(
                  scaffoldBackgroundColor: AppConstants.kBkDark,
                  useMaterial3: true,
                  colorScheme: darkScheme ?? defaultDarkColorScheme),
              onGenerateRoute: Routes.onGenereteRoute,
              home: users.isEmpty ? const OnBoarding(): const Notifications(),
            );
          });
        });
  }
}
