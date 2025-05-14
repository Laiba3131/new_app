import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kulture/config/config.dart';
import 'package:kulture/constants/app_colors.dart';
import 'package:kulture/generated/assets.dart';
import 'package:kulture/modules/home/widgets/delete_dialog.dart';
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

class ShareProfileSheet extends StatefulWidget {
  const ShareProfileSheet({super.key});

  @override
  State<ShareProfileSheet> createState() => _ShareProfileSheetState();
}

class _ShareProfileSheetState extends State<ShareProfileSheet> {
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
      actions: [
        Container(
          color: AppColors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              h2,
              InkWell(
                onTap: () async {
                  Navigator.pop(context);
                  await Future.delayed(const Duration(milliseconds: 200));
                  BottomSheetService.showShareThisProfile(context);
                },
                child: SizedBox(
                  width: double.infinity,
                  height: 70,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        Assets.shareUrl,
                        height: 25,
                        color: AppColors.black,
                      ),
                      Text(
                        'Share Profile',
                        style: context.textTheme.bodyMedium?.copyWith(
                          color: AppColors.black,
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              h0P5,
              const Divider(
                color: AppColors.searchBarColor,
              ),
              h0P5,
              InkWell(
                onTap: () async {
                   await Clipboard.setData(
      const ClipboardData(text: "https://yourapp.com/profile/username"),
    );
    NavRouter.pop(context);
                },
                child: SizedBox(
                  width: double.infinity,
                  height: 70,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        Assets.shareIcon,
                        height: 25,
                        color: AppColors.black,
                      ),
                      Text(
                        'Copy Link',
                        style: context.textTheme.bodyMedium?.copyWith(
                          color: AppColors.black,
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              h1,
              const Divider(
                color: AppColors.searchBarColor,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
