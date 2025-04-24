import 'package:kulture/constants/app_text_styles.dart';
import 'package:flutter/material.dart';

class TitleWidget extends StatelessWidget {
  final String title;
  final double? customFontSize;
  final String? buttonText;
  final VoidCallback? onTap;
  final EdgeInsets? padding;
  final bool? subButton;
  final AlignmentGeometry? alignment;

  final TextStyle? textStyle;

  const TitleWidget({
    super.key,
    required this.title,
    this.onTap,
    this.padding,
    this.buttonText,
    this.subButton,
    this.textStyle,
    this.customFontSize,
    this.alignment,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Align(
            alignment: alignment ?? Alignment.topLeft,
            child: Text(
              title,
              style: textStyle ??
                  AppTextStyles.robotoBold(
                    fontSize: customFontSize ?? 16.0,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
