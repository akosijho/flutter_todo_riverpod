import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppConstants {
  AppConstants._();

  static double kWidth = 375.w;
  static double kHeight = 825.h;
  static double kRadius = 12.h;

  static const Color kBkDark = Color(0xff2a2b2e);
  static const Color kLight = Color(0xffffffff);
  static const Color kRed = Color(0xffd80000);
  static const Color kBlueLight = Color(0xff027eb5);
  static const Color kGreyDk = Color(0xff707070);
  static const Color kGreen = Color(0xff20a31e);
  static const Color kYellow = Color(0xfff9f900);
  static const Color kBkLight = Color(0x58797777);
  static const Color kGryBk = Color(0xff202c33);

  static const String _rootPath = 'assets/images/';
  static const String todo = '${_rootPath}todo.png';
  static const String bell = '${_rootPath}bell.pmg';
  static const String notification = '{$_rootPath}notification.pmg';

  static const List<Color> colors = [
    Color(0xffd80000),
    Color(0xff027eb5),
    Color(0xff20a31e),
    Color(0xfff9f900),
    Color(0xff79017b),
    Color(0xffffffff),
  ];
}

typedef EitherOr<T> = Either<String, T>;
