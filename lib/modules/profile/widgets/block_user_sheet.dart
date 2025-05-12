import 'package:flutter/material.dart';
import 'package:kulture/constants/app_colors.dart';
import 'package:kulture/ui/button/primary_button.dart';
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
    return Container(
      padding: const EdgeInsets.all(12),
      height: MediaQuery.of(context).size.height * 0.6,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
        
          h1,
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
           h1,
          
          PrimaryButton(
            height: 45,
            onPressed: () async {
              Navigator.pop(context);
              // await Future.delayed(const Duration(milliseconds: 200));
              // BottomSheetService.showReportSheet(context);
            },
            title: 'Cancel',
            backgroundColor: AppColors.white,
            shadowColor: AppColors.lightGreyColor,
            titleColor: AppColors.red,
            borderRadius: 15,
          ),
        ],
      ),
    );
  }
}
