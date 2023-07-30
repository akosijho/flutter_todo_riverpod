import 'package:flutter/material.dart';

class MyMaterialButton extends StatelessWidget {
  const MyMaterialButton(
      {super.key,
      required this.onPressed,
      required this.text,
      required this.textStyle,
      required this.buttonColor,
      this.width,
      this.height});

  final void Function() onPressed;
  final String text;
  final TextStyle textStyle;
  final Color buttonColor;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      height: height ?? 56,
      child: MaterialButton(
        color: buttonColor,
        onPressed: onPressed,
        padding: const EdgeInsets.all(8),
        child: Text(
          text,
          style: textStyle,
        ),
      ),
    );
  }
}
