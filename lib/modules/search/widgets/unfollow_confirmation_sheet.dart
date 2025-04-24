import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kulture/constants/app_colors.dart';
import 'package:kulture/ui/button/primary_button.dart';
import 'package:kulture/utils/extensions/extended_context.dart';
import 'package:kulture/utils/heights_and_widths.dart';

class UnfollowConfirmationSheet extends StatelessWidget {
  final String username;
  final String userImage;
  final VoidCallback onConfirm;

  const UnfollowConfirmationSheet({
    super.key,
    required this.username,
    required this.onConfirm,
    required this.userImage,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.transparent,
      child: Container(
        padding: const EdgeInsets.only(top: 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              radius: 32,
              backgroundImage: AssetImage(userImage),
            ),
            h2,
            Text(
              'Unfollow @$username?',
              style: context.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: AppColors.textGrey,
              ),
            ),
            h2,
            Divider(
              height: 1,
              color: AppColors.textGrey.withOpacity(0.2),
            ),
            PrimaryButton(
              onPressed: onConfirm,
              title: 'Unfollow',
              backgroundColor: AppColors.transparent,
              titleColor: AppColors.red,
              borderRadius: 8,
              width: double.infinity,
              height: 44,
              shadowColor: AppColors.transparent,
            ),
            Divider(
              height: 1,
              color: AppColors.textGrey.withOpacity(0.2),
            ),
            PrimaryButton(
              onPressed: () => Navigator.of(context).pop(),
              title: 'Cancel',
              backgroundColor: AppColors.transparent,
              titleColor: AppColors.black,
              borderRadius: 8,
              width: double.infinity,
              height: 44,
              shadowColor: AppColors.transparent,
            ),
          ],
        ),
      ),
    );
  }
}
