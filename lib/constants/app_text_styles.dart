import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import 'app_colors.dart';

class AppTextStyles {
  static TextStyle robotoRegular({
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    double? letterSpacing,
  }) {
    return GoogleFonts.roboto(
      fontSize: fontSize ?? 11.sp,
      color: color ?? AppColors.black,
      fontWeight: fontWeight ?? FontWeight.normal,
      letterSpacing: letterSpacing ?? 0,
    );
  }

  static TextStyle interRegular({
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    double? letterSpacing,
  }) {
    return GoogleFonts.inter(
      fontSize: fontSize ?? 11.sp,
      color: color ?? AppColors.black,
      fontWeight: fontWeight ?? FontWeight.normal,
      letterSpacing: letterSpacing ?? 0,
    );
  }

  static TextStyle robotoSemiBold({
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    double? letterSpacing,
  }) {
    return GoogleFonts.roboto(
      fontSize: fontSize ?? 12.sp,
      color: color ?? AppColors.black,
      fontWeight: fontWeight ?? FontWeight.w600,
      letterSpacing: letterSpacing ?? 0,
    );
  }

  static TextStyle latoSemiBold({
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    double? letterSpacing,
  }) {
    return GoogleFonts.lato(
      fontSize: fontSize ?? 12.sp,
      color: color ?? AppColors.black,
      fontWeight: fontWeight ?? FontWeight.w600,
      letterSpacing: letterSpacing ?? 0,
    );
  }

  static TextStyle robotoBold({
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    double? letterSpacing,
  }) {
    return GoogleFonts.roboto(
      fontSize: fontSize ?? 12.sp,
      color: color ?? AppColors.black,
      fontWeight: fontWeight ?? FontWeight.bold,
      letterSpacing: letterSpacing ?? 0,
    );
  }

  static TextStyle robotoMedium({
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    double? letterSpacing,
  }) {
    return GoogleFonts.roboto(
      fontSize: fontSize ?? 12.sp,
      color: color ?? AppColors.black,
      fontWeight: fontWeight ?? FontWeight.w500,
      letterSpacing: letterSpacing ?? 0,
    );
  }
}
