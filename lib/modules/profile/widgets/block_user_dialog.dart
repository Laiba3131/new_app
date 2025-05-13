import 'package:flutter/material.dart';
import 'package:kulture/constants/app_colors.dart';
import 'package:kulture/ui/button/primary_button.dart';
import 'package:kulture/utils/extensions/extended_context.dart';
import 'package:kulture/utils/heights_and_widths.dart';

class BlockUserDialog extends StatelessWidget {
  const BlockUserDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      backgroundColor: AppColors.lightGreyColor,
      child: Container(
        constraints: const BoxConstraints(maxWidth: 300),
        padding: const EdgeInsets.only(top: 23.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            h2,
            Text(
              'You can unlock them at any time',
              style: context.textTheme.bodyMedium
                  ?.copyWith(fontSize: 17, fontWeight: FontWeight.w700),
            ),
            h1,
            PrimaryButton(
              height: 45,
              onPressed: () async {
                Navigator.pop(context);
                // await Future.delayed(const Duration(milliseconds: 200));
                // BottomSheetService.showReportSheet(context);
              },
              title: 'Unblock',
              backgroundColor: AppColors.primaryColor,
              shadowColor: AppColors.transparent,
              titleColor: AppColors.white,
              borderRadius: 15,
            ),
            h1,
            PrimaryButton(
              height: 45,
              onPressed: () async {
                Navigator.pop(context);
                // await Future.delayed(const Duration(milliseconds: 200));
                // BottomSheetService.showReportSheet(context);
              },
              title: 'Cancel',
              backgroundColor: AppColors.primaryColor,
              shadowColor: AppColors.transparent,
              titleColor: AppColors.white,
              borderRadius: 15,
            ),
            h1,
          ],
        ),
      ),
    );
  }
}
