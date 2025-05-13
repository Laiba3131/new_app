import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kulture/constants/app_colors.dart';
import 'package:kulture/ui/button/primary_button.dart';
import 'package:kulture/utils/extensions/extended_context.dart';
import 'package:kulture/utils/heights_and_widths.dart';

class UserNote {
  final String name;
  final String imageUrl;

  UserNote({
    required this.name,
    required this.imageUrl,
  });
}

class BlockUserSheet extends StatefulWidget {
  const BlockUserSheet({super.key});

  @override
  State<BlockUserSheet> createState() => _BlockUserSheetState();
}

class _BlockUserSheetState extends State<BlockUserSheet> {
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
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              h2,
              Text(
                'You can unlock them at any time',
                style: context.textTheme.bodyMedium
                    ?.copyWith(fontSize: 17, fontWeight: FontWeight.w700),
              ),
              h1,
              PrimaryButton(
                 vMargin: 0,
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
                vMargin: 0,
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
              h1,
            ],
          ),
        ),
      ],
      cancelButton: CupertinoActionSheetAction(
        onPressed: () {
          Navigator.of(context).pop();
        },
        child:  Text('Cancel',
            style: context.textTheme.bodyMedium?.copyWith(
              fontSize: 17,
              fontWeight: FontWeight.w600,
              color: AppColors.red
            )),
      ),
    );
  }
}
