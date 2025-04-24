import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';

class TitleWidgetSmall extends StatelessWidget {
  final String title;
  final VoidCallback? onTap;
  final double? customFontSize;
  final Color? fontColor;

  const TitleWidgetSmall(
      {super.key,
      required this.title,
      this.onTap,
      this.customFontSize,
      this.fontColor});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          title,
          style: TextStyle(
              fontSize: customFontSize ?? 12.0,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.5,
              color: fontColor ?? Colors.grey.shade800),
        ),
        if (onTap != null)
          GestureDetector(
              onTap: onTap,
              child: const Text(
                "View All",
                style: TextStyle(
                  color: AppColors.primaryColor,
                ),
              )),
      ],
    );
  }
}
