import 'package:flutter/material.dart';
import 'package:kulture/constants/app_colors.dart';
import 'package:kulture/utils/extensions/extended_context.dart';
import 'package:kulture/utils/heights_and_widths.dart';

class ProfileStatusRow extends StatelessWidget {
  final String followingText;
  final String followersText;
  final String? website;
  final VoidCallback? onWebsiteTap;

  const ProfileStatusRow({
    super.key,
    required this.followingText,
    required this.followersText,
    this.website,
    this.onWebsiteTap,
  });

  @override
  Widget build(BuildContext context) {
    final textStyle = context.textTheme.bodySmall?.copyWith(
      fontSize: 14,
      fontWeight: FontWeight.w300,
      color: AppColors.svgIconColor,
    );

    final linkStyle = textStyle?.copyWith(color: AppColors.primaryColor);

    return Row(
      children: [
        Text(followingText, style: textStyle),
        w2,
        const Text("•", style: TextStyle(color: AppColors.svgIconColor)),
        w2,
        Text(followersText, style: textStyle),
        if (website != null) ...[
          w2,
          const Text("•", style: TextStyle(color: AppColors.svgIconColor)),
          w2,
          InkWell(
            onTap: onWebsiteTap ?? () {},
            child: Text(website!, style: linkStyle),
          ),
        ],
      ],
    );
  }
}
