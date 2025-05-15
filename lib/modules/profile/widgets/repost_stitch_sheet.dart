import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kulture/constants/app_colors.dart';
import 'package:kulture/generated/assets.dart';

class RepostStitchSheet extends StatelessWidget {
  const RepostStitchSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(
            onTap: () {
              // Add your block logic here
              Navigator.pop(context, 'block');
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 14),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Block',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: 17,
                    ),
                  ),
                  SvgPicture.asset(
                    Assets.block,
                    width: 24,
                    height: 24,
                    color: AppColors.black,
                  ),
                ],
              ),
            ),
          ),
          const Divider(
            color: AppColors.searchBarColor,
            thickness: 1,
          ),
          InkWell(
            onTap: () {
              // Add your delete logic here
              Navigator.pop(context, 'delete');
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 14),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Delete',
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.w400,
                      fontSize: 17,
                    ),
                  ),
                  SvgPicture.asset(
                    Assets.trash,
                    width: 28,
                    height: 28,
                    color: AppColors.red,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
