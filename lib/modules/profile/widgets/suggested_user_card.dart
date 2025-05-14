import 'package:flutter/material.dart';
import 'package:kulture/constants/app_colors.dart';
import 'package:kulture/modules/profile/model/suggested_user_model.dart';
import 'package:kulture/ui/button/primary_button.dart';
import 'package:kulture/utils/extensions/extended_context.dart';
import 'package:kulture/utils/heights_and_widths.dart';

import '../../../config/routes/nav_router.dart';
import '../pages/user_profile_screen.dart';

class SuggestedUserCard extends StatefulWidget {
  final SuggestedUser user;
  final VoidCallback onDismiss;
  const SuggestedUserCard({
    super.key,
    required this.user,
    required this.onDismiss,
  });

  @override
  State<SuggestedUserCard> createState() => _SuggestedUserCardState();
}

class _SuggestedUserCardState extends State<SuggestedUserCard> {
  bool isFollow = true;
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
              onTap: widget.onDismiss,
              child: const Icon(
                Icons.close,
                size: 13,
                color: AppColors.textGrey,
              ),
            ),
          ),
          InkWell(
             onTap: () {
                        NavRouter.push(
                          context,
                          const UserProfileScreen(),
                        );
                      },
            child: CircleAvatar(
              radius: 32,
              backgroundImage: AssetImage(widget.user.imageUrl),
            ),
          ),
          h1,
          InkWell(
             onTap: () {
                        NavRouter.push(
                          context,
                          const UserProfileScreen(),
                        );
                      },
            child: Text(
              widget.user.name,
              style: context.textTheme.bodySmall?.copyWith(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: AppColors.black,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Text(
            widget.user.username,
            style: context.textTheme.bodySmall?.copyWith(
              fontSize: 12,
              fontWeight: FontWeight.w300,
              color: AppColors.textGrey,
            ),
            textAlign: TextAlign.center,
          ),
          PrimaryButton(
            title: isFollow ? 'Follow' : 'Unfollow',
            onPressed: () {
              setState(() {
                isFollow = !isFollow;
              });
            },
            backgroundColor:
                isFollow ? AppColors.primaryColor : AppColors.white,
            titleColor: isFollow ? AppColors.white : AppColors.black,
            borderRadius: 6,
            width: 100,
            bborderColor: isFollow ? AppColors.transparent : AppColors.searchBarColor,
            fontSize: 12,
            height: 25,
            hMargin: 0,
            shadowColor: AppColors.transparent,
          ),
        ],
      ),
    );
  }
}
