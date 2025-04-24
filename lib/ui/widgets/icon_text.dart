import 'package:kulture/utils/extensions/extended_context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class IconText extends StatelessWidget {
  final String text;
  final String iconPath;
  final double iconSize;
  final double iconSpacing;
  final double textSize;
  final Color? iconColor;
  final Color? bgColor;
  final Color? textColor;
  final Color borderColor;

  const IconText(
      {super.key,
      required this.text,
      required this.iconPath,
      this.iconSize = 12,
      this.iconSpacing = 4,
      this.iconColor,
      this.bgColor,
      this.textColor,
      this.borderColor = Colors.transparent,
      this.textSize = 12});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: bgColor != null
          ? const EdgeInsets.symmetric(horizontal: 8, vertical: 4)
          : null,
      decoration: bgColor != null
          ? BoxDecoration(
              color: bgColor,
              border: Border.all(color: borderColor),
              borderRadius: BorderRadius.circular(6))
          : null,
      child: Row(
        children: [
          SvgPicture.asset(
            iconPath,
            height: iconSize,
            color: iconColor,
          ),
          SizedBox(
            width: iconSpacing,
          ),
          Text(
            text,
            style: context.textTheme.titleSmall!
                .copyWith(color: textColor, fontSize: textSize),
          )
        ],
      ),
    );
  }
}
