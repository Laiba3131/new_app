import 'package:flutter/material.dart';
import 'package:kulture/constants/app_colors.dart';
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
          CircleAvatar(
            radius: 24,
            backgroundImage: AssetImage(avatarUrl),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name,
                    style: context.textTheme.bodySmall?.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: AppColors.black)),
                Text(username,
                    style: context.textTheme.bodySmall?.copyWith(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        color: AppColors.textGrey)),
              ],
            ),
          ),
          PrimaryIconOutlineButton(
            height: 35,
            width: 120,
            onPressed: () {},
            title: 'Message',
            iconSvgPath: '',
            borderColor: AppColors.black,
            titleColor: AppColors.black,
          ),
          w0P5,
          InkWell(
              onTap: onMoreTap,
              child: const Icon(Icons.more_horiz, color: Colors.grey)),
        ],
      ),
    );
  }
}
