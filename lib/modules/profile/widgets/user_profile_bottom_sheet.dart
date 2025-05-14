import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kulture/constants/app_colors.dart';
import 'package:kulture/generated/assets.dart';
import 'package:kulture/ui/button/primary_button.dart';
import 'package:kulture/utils/extensions/extended_context.dart';
import 'package:kulture/utils/heights_and_widths.dart';

import '../../../core/service/bottm_sheet_service.dart';

class UserNote {
  final String name;
  final String imageUrl;

  UserNote({
    required this.name,
    required this.imageUrl,
  });
}

class UserProfileBottomSheet extends StatefulWidget {
  const UserProfileBottomSheet({super.key});

  @override
  State<UserProfileBottomSheet> createState() => _UserProfileBottomSheetState();
}

class _UserProfileBottomSheetState extends State<UserProfileBottomSheet> {
  final TextEditingController _noteController = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  void dispose() {
    _noteController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  bool isBlock = false;

  @override
  Widget build(BuildContext context) {
    return CupertinoActionSheet(
      actions: [
        Container(
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              h1,
              PrefixIconButton(
                fontSize: 17,
                mainAxisAlignment: MainAxisAlignment.start,
                borderColor: AppColors.transparent,
                height: 45,
                onPressed: () async {
                  setState(() {
                    isBlock = !isBlock;
                  });
                  Navigator.pop(context);
                  await Future.delayed(const Duration(milliseconds: 200));
                  BottomSheetService.showBlockSheet(context);
                },
                prefixIconPath: Assets.block,
                prefixIconSize: 20,
                title: !isBlock ? 'Block' : '“Unblock',
                backgroundColor: AppColors.white,
                titleColor: AppColors.black,
                borderRadius: 15,
              ),
              h1,
              PrefixIconButton(
                fontSize: 17,
                mainAxisAlignment: MainAxisAlignment.start,
                borderColor: AppColors.transparent,
                height: 45,
                onPressed: () async {
                  Navigator.pop(context);
                  await Future.delayed(const Duration(milliseconds: 200));
                  BottomSheetService.showReportSheet(context);
                },
                prefixIconPath: Assets.reporting,
                prefixIconSize: 20,
                title: 'Report',
                backgroundColor: AppColors.white,
                titleColor: AppColors.red,
                borderRadius: 15,
              ),
              h1,
              PrefixIconButton(
                mainAxisAlignment: MainAxisAlignment.start,
                borderColor: AppColors.transparent,
                height: 45,
                onPressed: () async {
                  Navigator.pop(context);
                  await Future.delayed(const Duration(milliseconds: 200));
                  BottomSheetService.showShareThisProfile(context);
                },
                prefixIconPath: Assets.shareUrl,
                prefixIconSize: 20,
                title: 'Share this profile',
                backgroundColor: AppColors.white,
                titleColor: AppColors.black,
                borderRadius: 15,
                fontSize: 17,
              ),
              h1,
              PrefixIconButton(
                fontSize: 17,
                mainAxisAlignment: MainAxisAlignment.start,
                borderColor: AppColors.transparent,
                height: 45,
                onPressed: () async {
                  Navigator.pop(context);
                  await Future.delayed(const Duration(milliseconds: 200));
                  BottomSheetService.showReportSheet(context);
                },
                prefixIconPath: Assets.shareIcon,
                prefixIconSize: 20,
                title: 'Copy profile url',
                backgroundColor: AppColors.white,
                titleColor: AppColors.black,
                borderRadius: 15,
              ),
            ],
            //  SvgPicture.asset(
            //           Assets.shareIcon,
            //           height: 25,
            //           color: AppColors.black,
            //         ),
          ),
        ),
      ],
      cancelButton: CupertinoActionSheetAction(
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: Text('Cancel',
            style: context.textTheme.bodyMedium?.copyWith(
                fontSize: 17,
                fontWeight: FontWeight.w600,
                color: AppColors.red)),
      ),
    );
  }
}
