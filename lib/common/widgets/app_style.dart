import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle appStyle(double size, Color color, FontWeight fontWeight) =>
    GoogleFonts.poppins(
        fontWeight: fontWeight, fontSize: size.sp, color: color);
