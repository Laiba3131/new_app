import 'package:flutter/material.dart';

import '../../constants/asset_paths.dart';

class UnderlinedTextWidget extends StatelessWidget {
  final double width;
  final double hMargin;
  final double vMargin;
  final String simpleText;
  final String underlinedText;
  final String underlinedTextB;
  final String simpleTextB;
  final String simpleTextC;
  final Color textColor;

  const UnderlinedTextWidget(
      {super.key,
      this.width = double.infinity,
      this.hMargin = 13,
      required this.simpleText,
      required this.underlinedText,
      required this.simpleTextB,
      required this.underlinedTextB,
      this.textColor = Colors.black,
      required this.simpleTextC,
      this.vMargin = 10});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      margin: EdgeInsets.symmetric(horizontal: hMargin, vertical: vMargin),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          text: simpleText,
          style: TextStyle(
            fontWeight: FontWeight.w400,
            color: textColor,
            fontFamily: AssetPaths.dmSans,
            fontSize: 12,
          ),
          children: [
            TextSpan(
              text: underlinedText,
              style: TextStyle(
                decoration: TextDecoration.underline,
                fontWeight: FontWeight.w400,
                color: textColor,
                fontFamily: AssetPaths.dmSans,
                fontSize: 12,
              ),
            ),
            TextSpan(
              text: simpleTextB,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                color: textColor,
                fontFamily: AssetPaths.dmSans,
                fontSize: 12,
              ),
            ),
            TextSpan(
              text: underlinedTextB,
              style: TextStyle(
                decoration: TextDecoration.underline,
                fontWeight: FontWeight.w400,
                color: textColor,
                fontFamily: AssetPaths.dmSans,
                fontSize: 12,
              ),
            ),
            TextSpan(
              text: simpleTextC,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                color: textColor,
                fontFamily: AssetPaths.dmSans,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
