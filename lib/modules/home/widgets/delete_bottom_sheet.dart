import 'package:flutter/material.dart';
import 'package:kulture/constants/app_colors.dart';
import 'package:kulture/modules/home/widgets/delete_dialog.dart';
import 'package:kulture/ui/button/primary_button.dart';
import 'package:kulture/utils/heights_and_widths.dart';

class DeleteBottomSheet extends StatefulWidget {
  const DeleteBottomSheet({super.key});

  @override
  State<DeleteBottomSheet> createState() => _DeleteBottomSheetState();
}

class _DeleteBottomSheetState extends State<DeleteBottomSheet> {
  final TextEditingController _noteController = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  void dispose() {
    _noteController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
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
          const SizedBox(height: 20),
          PrimaryButton(
              height: 45,
              vMargin: 0,
              hMargin: 0,
              onPressed: () {
                Navigator.pop(context);
                // showErrorDialog(context);
              },
              title: 'Delete story',
              backgroundColor: AppColors.red,
              titleColor: AppColors.white,
              borderRadius: 15,
              shadowColor: AppColors.transparent),
        ],
      ),
    );
  }
}
