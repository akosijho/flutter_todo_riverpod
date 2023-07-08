import 'package:flutter/material.dart';

class MyOutlinedButton extends StatelessWidget {
  const MyOutlinedButton({
    super.key,
    required this.onPressed,
    this.buttonStyle,
    required this.child,
  });

  final void Function() onPressed;
  final Widget child;
  final ButtonStyle? buttonStyle;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: OutlinedButton(
        style: buttonStyle,
        onPressed: onPressed,
        child: child,
      ),
    );
  }
}
