import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kulture/constants/app_colors.dart';
import 'package:kulture/core/service/bottm_sheet_service.dart';
import 'package:kulture/generated/assets.dart';
import 'package:kulture/modules/home/widgets/psoting_sheet.dart';
import 'package:kulture/utils/heights_and_widths.dart';

class RepostStitchSheet extends StatelessWidget {
  const RepostStitchSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
            Center(
            child: Container(
              height: 4,
              width: 40,
              margin: const EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          h2,
          Container(
             decoration: const BoxDecoration(
              color: AppColors.bottomSheetColor,
            borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
          ),
          
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Repost',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 17,
                          ),
                        ),
                        SvgPicture.asset(
                          Assets.svgReload,
                          width: 24,
                          height: 24,
                          color: AppColors.svgIconColor,
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
                  onTap: () async {
                    Navigator.pop(context);
                  await Future.delayed(const Duration(milliseconds: 200));
                  PostingSheet.show(context, h2: const SizedBox());
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Status',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 17,
                          ),
                        ),
                        SvgPicture.asset(
                          Assets.statusIcon,
                          width: 28,
                          height: 28,
                          color: AppColors.svgIconColor,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
