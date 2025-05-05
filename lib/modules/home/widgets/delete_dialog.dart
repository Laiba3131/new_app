import 'package:flutter/material.dart';
import 'package:kulture/constants/app_colors.dart';

class DeleteDialog extends StatelessWidget {
  final String title;
  final String message;

  const DeleteDialog({
    super.key,
    this.title = 'Incorrect password or email',
    this.message =
        'The Password or email you entered is incorrect. Please try again.',
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      backgroundColor: AppColors.lightGreyColor,
      child: Container(
        constraints: const BoxConstraints(maxWidth: 300),
        padding: const EdgeInsets.symmetric(vertical: 23.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(
                title,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppColors.black,
                    ),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(
                textAlign: TextAlign.center,
                message,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontSize: 14,
                      color: AppColors.black,
                    ),
              ),
            ),
            const SizedBox(height: 12),
            const Divider(color: AppColors.greyColor),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () => Navigator.of(context).pop(),
                    child: Text(
                      'Delete',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            fontSize: 15,
                            fontWeight: FontWeight.w800,
                            color: AppColors.red,
                          ),
                    ),
                  ),
                  Container(
                    height: 10,
                    width: 2,
                    decoration: BoxDecoration(color: AppColors.greyColor),),
                  InkWell(
                    onTap: () => Navigator.of(context).pop(),
                    child: Text(
                      'Cancel',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            fontSize: 15,
                            fontWeight: FontWeight.w800,
                            color: AppColors.black,
                          ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
