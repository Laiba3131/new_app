import 'package:flutter/material.dart';
import 'package:kulture/constants/app_colors.dart';
import 'package:kulture/ui/button/primary_button.dart';
import 'package:kulture/utils/extensions/extended_context.dart';

class BlockedUserTile extends StatelessWidget {
  final Map<String, dynamic> user;
  final Color? buttonColor;
  final String? buttonText;
  final VoidCallback? onUnblock;

  const BlockedUserTile({
    super.key,
    required this.user,
    this.buttonText,
    this.buttonColor,
    this.onUnblock,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 25,
            backgroundColor: Colors.grey[300],
            backgroundImage: AssetImage(user['imageUrl']),
            onBackgroundImageError: (_, __) {},
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  user['name'],
                  style: context.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w400,
                    fontSize: 17,
                    color: AppColors.black,
                  ),
                ),
                Text(
                  user['username'],
                  style: context.textTheme.bodyMedium?.copyWith(
                    color: AppColors.textGrey,
                    fontWeight: FontWeight.w400,
                    fontSize: 15,
                  ),
                ),
                Text(
                  user['bio'],
                  style: context.textTheme.bodyMedium?.copyWith(
                    color: AppColors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 15,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  user['followers'],
                  style: context.textTheme.bodySmall?.copyWith(
                    color: AppColors.textGrey,
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          PrimaryButton(
            onPressed: onUnblock ?? () {},
            title: buttonText ?? 'Blocked',
            width: 120,
            height: 36,
            borderRadius: 11,
            backgroundColor: buttonColor,
            shadowColor: AppColors.transparent,
          ),
        ],
      ),
    );
  }
}
