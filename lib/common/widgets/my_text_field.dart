import 'package:flutter/material.dart';
import 'package:flutter_todo_riverpod/common/utils/constants.dart';
import 'package:flutter_todo_riverpod/common/widgets/app_style.dart';

class MyTextField extends StatelessWidget {
  const MyTextField(
      {super.key,
      this.keyboardType,
      required this.hintText,
      this.prefixIcon,
      this.suffixIcon,
      this.hintStyle,
      required this.textEditingController,
      this.onChanged,
      this.textStyle});

  final TextInputType? keyboardType;
  final String hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextStyle? hintStyle;
  final TextEditingController textEditingController;
  final void Function(String)? onChanged;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppConstants.kWidth * 0.9,
      decoration: BoxDecoration(
        color: AppConstants.kLight,
        borderRadius: BorderRadius.circular(AppConstants.kRadius),
      ),
      child: TextFormField(
        keyboardType: keyboardType,
        controller: textEditingController,
        cursorHeight: 24,
        onChanged: onChanged,
        style: appStyle(18, AppConstants.kBkDark, FontWeight.w700),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: hintStyle,
          suffixIcon: suffixIcon,
          suffixIconColor: AppConstants.kBkDark,
          prefixIcon: prefixIcon,
          errorBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.zero,
              borderSide: BorderSide(color: AppConstants.kRed)),
          focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.zero,
              borderSide: BorderSide(color: Colors.transparent)),
          focusedErrorBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.zero,
              borderSide: BorderSide(color: AppConstants.kRed)),
          disabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.zero,
              borderSide: BorderSide(color: AppConstants.kGreyDk)),
          enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.zero,
              borderSide: BorderSide(color: AppConstants.kBkDark)),
        ),
      ),
    );
  }
}
