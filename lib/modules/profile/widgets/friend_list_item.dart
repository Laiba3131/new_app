import 'package:flutter/material.dart';
import 'package:kulture/config/config.dart';
import 'package:kulture/constants/app_colors.dart';
import 'package:kulture/generated/assets.dart';
import 'package:kulture/modules/notes/pages/chat_screen.dart';
import 'package:kulture/modules/profile/pages/user_profile_screen.dart';
import 'package:kulture/modules/profile/pages/your_profile_screen.dart';
import 'package:kulture/modules/questionnaire/pages/user_info_screen.dart';
import 'package:kulture/ui/button/primary_button.dart';
import 'package:kulture/utils/extensions/extended_context.dart';
import 'package:kulture/utils/heights_and_widths.dart';

class FriendListItem extends StatelessWidget {
  final String name;
  final String username;
  final String avatarUrl;
  final VoidCallback onMessageTap;
  final VoidCallback onMoreTap;

  const FriendListItem({
    super.key,
    required this.name,
    required this.username,
    required this.avatarUrl,
    required this.onMessageTap,
    required this.onMoreTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              NavRouter.push(context, const UserProfileScreen());
            },
            child: CircleAvatar(
              radius: 24,
              backgroundImage: AssetImage(avatarUrl),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: InkWell(
              onTap: () {
                NavRouter.push(context, const UserProfileScreen());
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name,
                      style: context.textTheme.bodySmall?.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: AppColors.black)),
                  Text(username.toString().toLowerCase().replaceAll(' ', ''),
                      style: context.textTheme.bodySmall?.copyWith(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          color: AppColors.textGrey)),
                ],
              ),
            ),
          ),
          PrimaryButton(
            height: 35,
            width: 120,
            onPressed: () {
              NavRouter.pushFromRoot(
                  context,
                  ChatScreen(
                    name: name,
                    username: name.toLowerCase(),
                    profileImage: Assets.pngImage1,
                  ));
            },
            title: 'Message',
            backgroundColor: AppColors.white,
            bborderColor: AppColors.searchBarColor,
            titleColor: AppColors.black,
            shadowColor: AppColors.transparent,
          ),
          // w0P5,
          // InkWell(
          //     onTap: onMoreTap,
          //     child: const Icon(Icons.more_horiz, color: Colors.grey)),
        ],
      ),
    );
  }
}
