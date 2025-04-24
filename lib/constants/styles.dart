import 'package:flutter/material.dart';

import 'app_colors.dart';

class Styles {
  static LinearGradient verticalGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      const Color(0xff94B9FF),
      const Color(0xff94B9FF).withOpacity(0.8),
      const Color(0xffCDFFD8),
    ],
  );

  static LinearGradient horizontalGradient = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [
      AppColors.primaryLightBlue,
      AppColors.primaryLightBlue.withOpacity(0.8),
      AppColors.primaryLightGreen
    ],
  );

  static LinearGradient scaffoldGradient = const LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [AppColors.primaryLightBlue, AppColors.primaryLightGreen],
  );

  static const List<Color> blueButtonGradientColors = [
    Color(0xff1D71B8),
    Color(0xff003A6B),
  ];
  static const List<Color> redButtonGradientColors = [
    Color(0xffFF0000),
    Color(0xff520000),
  ];

  static final mapsSearchFieldBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none);
}
