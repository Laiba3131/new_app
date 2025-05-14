import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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

class SaveBottomSheet extends StatefulWidget {
  const SaveBottomSheet({super.key});

  @override
  State<SaveBottomSheet> createState() => _SaveBottomSheetState();
}

class _SaveBottomSheetState extends State<SaveBottomSheet> {
  final TextEditingController _noteController = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  void dispose() {
    _noteController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  bool isBlock = false;

  void showErrorDialog(BuildContext context, {String? title, String? message}) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return DeleteDialog(
          title: title ?? 'Delete post?',
          message: message ??
              'If you delete this post, you won\'t be able to restore it',
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      height: MediaQuery.of(context).size.height * 0.3,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Center(
            child: Container(
              height: 4,
              width: 40,
              margin: const EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                color: Colors.grey[400],
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          // Container(
          //   width: double.infinity,
          //   height: 70,
          //   decoration: BoxDecoration(
          //       // color: AppColors.textGrey,
          //       border:
          //           Border.all(color: AppColors.searchBarTextColor, width: 0.5),
          //       borderRadius: const BorderRadius.all(Radius.circular(15))),
          //   child: Column(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: [
          //       SvgPicture.asset(
          //         Assets.saveIcon,
          //         height: 25,
          //         color: AppColors.searchBarTextColor,
          //       ),
          //       Text(
          //         'Save',
          //         style: context.textTheme.bodyMedium?.copyWith(
          //           color: AppColors.black,
          //           fontSize: 17,
          //           fontWeight: FontWeight.w600,
          //         ),
          //       )
          //     ],
          //   ),
          // ),
          h1,
          PrefixIconButton(
            fontSize: 17,
            mainAxisAlignment: MainAxisAlignment.start,
            borderColor: AppColors.searchBarTextColor,
            height: 45,
            onPressed: () async {
              setState(() {
                isBlock = !isBlock;
              });
              // Navigator.pop(context);
              // await Future.delayed(const Duration(milliseconds: 200));
              // BottomSheetService.showReportSheet(context);
            },
            prefixIconPath: Assets.block,
            prefixIconSize: 20,
            title: !isBlock ? 'Block' : 'Unblock',
            backgroundColor: AppColors.white,
            titleColor: AppColors.black,
            borderRadius: 15,
          ),
          h1,
          PrimaryButton(
              height: 45,
              vMargin: 0,
              hMargin: 0,
              onPressed: () {
                Navigator.pop(context);
                showErrorDialog(context);
              },
              title: 'Delete',
              backgroundColor: AppColors.red,
              titleColor: AppColors.white,
              borderRadius: 15,
              fontSize: 17,
              shadowColor: AppColors.transparent),
          h1,
          PrefixIconButton(
            fontSize: 17,
            mainAxisAlignment: MainAxisAlignment.start,
            borderColor: AppColors.searchBarTextColor,
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
          )
        ],
      ),
    );
  }
}
