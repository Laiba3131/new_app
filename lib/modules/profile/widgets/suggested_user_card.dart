import 'package:flutter/material.dart';
import 'package:kulture/constants/app_colors.dart';
import 'package:kulture/modules/profile/model/suggested_user_model.dart';
import 'package:kulture/ui/button/primary_button.dart';
import 'package:kulture/utils/extensions/extended_context.dart';
import 'package:kulture/utils/heights_and_widths.dart';

class SuggestedUserCard extends StatelessWidget {
  final SuggestedUser user;

  const SuggestedUserCard({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      decoration: BoxDecoration(
        // color: Colors.grey.shade200,
        border: Border.all(color: AppColors.searchBarColor, width: 1),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: GestureDetector(
              onTap: () {},
              child: const Icon(
                Icons.close,
                size: 13,
                color: AppColors.textGrey,
              ),
            ),
          ),
          CircleAvatar(
            radius: 32,
            backgroundImage: AssetImage(user.imageUrl),
          ),
          h1,
          Text(
            user.name,
            style: context.textTheme.bodySmall?.copyWith(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: AppColors.black,
            ),
            textAlign: TextAlign.center,
          ),
          Text(
            user.username,
            style: context.textTheme.bodySmall?.copyWith(
              fontSize: 12,
              fontWeight: FontWeight.w300,
              color: AppColors.textGrey,
            ),
            textAlign: TextAlign.center,
          ),
          PrimaryButton(
            onPressed: () {},
            title: 'Follow',
            shadowColor: AppColors.transparent,
            width: 100,
            backgroundColor: AppColors.primaryColor,
            height: 25,
          )
        ],
      ),
    );
  }
}
