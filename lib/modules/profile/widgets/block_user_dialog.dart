import 'package:flutter/material.dart';
import 'package:kulture/constants/app_colors.dart';
import 'package:kulture/ui/button/primary_button.dart';
import 'package:kulture/utils/heights_and_widths.dart';

class BlockUserDialog extends StatelessWidget {
  final String title;
  final String message;

  const BlockUserDialog({
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
        padding: const EdgeInsets.only(top: 23.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
             PrimaryButton(
            height: 45,
            onPressed: () async {
              Navigator.pop(context);
              // await Future.delayed(const Duration(milliseconds: 200));
              // BottomSheetService.showReportSheet(context);
            },
            title: 'Block',
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
            title: 'Block and report',
            backgroundColor: AppColors.primaryColor,
            shadowColor: AppColors.transparent,
            titleColor: AppColors.white,
            borderRadius: 15,
          ),
           h1, ],
        ),
      ),
    );
  }
}
