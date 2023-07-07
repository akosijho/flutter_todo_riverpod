import 'package:flutter/material.dart';

class Gap extends StatelessWidget {
  const Gap({super.key, this.height, this.width});

  final double? height, width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
    );
  }
}
