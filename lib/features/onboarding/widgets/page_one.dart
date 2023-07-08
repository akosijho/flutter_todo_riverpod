import 'package:flutter/material.dart';
import 'package:flutter_todo_riverpod/common/utils/constants.dart';

class PageOne extends StatelessWidget {
  const PageOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppConstants.kHeight,
      width: AppConstants.kWidth,
      color: AppConstants.kBkDark,
    );
  }
}
