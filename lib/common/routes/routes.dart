import 'package:flutter/material.dart';
import 'package:flutter_todo_riverpod/features/auth/pages/login_page.dart';
import 'package:flutter_todo_riverpod/features/auth/pages/otp_page.dart';
import 'package:flutter_todo_riverpod/features/onboarding/pages/onboarding.dart';
import 'package:flutter_todo_riverpod/features/todo/pages/homepage.dart';

class Routes {
  static const onboarding = 'onboarding';
  static const login = 'login';
  static const otp = 'otp';
  static const home = 'home';

  static Route<dynamic> onGenereteRoute(RouteSettings settings) {
    switch (settings.name) {
      case onboarding:
        return MaterialPageRoute(builder: (context) {
          return const OnBoarding();
        });
      case login:
        return MaterialPageRoute(builder: (context) {
          return const LoginPage();
        });
      case otp:
        final Map args = settings.arguments as Map;
        return MaterialPageRoute(builder: (context) {
          return OtpPage(
            phone: args['phone'],
            smsCodeId: args['smsCodeId'],
          );
        });
      case home:
        return MaterialPageRoute(builder: (context) {
          return const MyHomePage();
        });
      default:
        return MaterialPageRoute(builder: (context) {
          return const MyHomePage();
        });
    }
  }
}
