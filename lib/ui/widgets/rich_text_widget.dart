import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';
import '../../constants/asset_paths.dart';

class RichTextWidget extends StatelessWidget {
  final double width;
  final double hMargin;
  final double vMargin;
  final String firstText;
  final String secondText;
  final Color firstTextColor;
  final Color secondTextColor;
  final Color firstBgColor;
  final Color secondBgColor;
  final double fontSize;
  final VoidCallback? onPressed;
  final FontWeight fontWeight;
  final bool isUnderline;

  const RichTextWidget({
    super.key,
    this.width = double.infinity,
    this.hMargin = 5,
    required this.firstText,
    required this.secondText,
    this.firstTextColor = AppColors.lightGrey,
    this.secondTextColor = AppColors.lightGrey,
    this.firstBgColor = Colors.transparent,
    this.secondBgColor = Colors.transparent,
    this.fontSize = 28,
    this.vMargin = 10,
    this.onPressed,
    this.fontWeight = FontWeight.w400,
    this.isUnderline = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      margin: EdgeInsets.symmetric(horizontal: hMargin, vertical: vMargin),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          text: "$firstText ",
          style: TextStyle(
              fontWeight: fontWeight,
              color: firstTextColor,
              fontFamily: AssetPaths.dmSans,
              fontSize: fontSize,
              backgroundColor: firstBgColor),
          children: [
            TextSpan(
              text: secondText,
              recognizer: TapGestureRecognizer()..onTap = onPressed,
              style: TextStyle(
                fontWeight: fontWeight,
                color: secondTextColor,
                decoration: isUnderline ? TextDecoration.underline : null,
                fontSize: fontSize,
                fontFamily: AssetPaths.dmSans,
                backgroundColor: secondBgColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
