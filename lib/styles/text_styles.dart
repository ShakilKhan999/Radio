import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextStyles {
  TextStyle? titleTextStyle() {
    return TextStyle(
      fontSize: 20.sp,
      color: Colors.white,

    );
  }

    TextStyle? titleMediumTextStyle() {
    return TextStyle(
      fontSize: 25.sp,
      color: Colors.white,
      fontWeight: FontWeight.bold

    );
  }
}