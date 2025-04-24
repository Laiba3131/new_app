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
    return Row(
      children: [
        Text(
          followingText,
          style: context.textTheme.bodySmall?.copyWith(
            fontSize: 14,
            fontWeight: FontWeight.w300,
            color: AppColors.textGrey,
          ),
        ),
        w2,
        Text(
          followersText,
          style: context.textTheme.bodySmall?.copyWith(
            fontSize: 14,
            fontWeight: FontWeight.w300,
            color: AppColors.textGrey,
          ),
        ),
        if (website != null) ...[
          w2,
          InkWell(
            onTap: onWebsiteTap ?? () {},
            child: Text(
              website!,
              style: context.textTheme.bodySmall?.copyWith(
                fontSize: 14,
                fontWeight: FontWeight.w300,
                color: AppColors.blue,
              ),
            ),
          ),
        ],
      ],
    );
  }
}
