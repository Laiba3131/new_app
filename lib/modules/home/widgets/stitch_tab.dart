import 'package:flutter/material.dart';
import 'package:kulture/constants/app_colors.dart';
import 'package:kulture/generated/assets.dart';
import 'package:kulture/modules/profile/model/suggested_user_model.dart';
import 'package:kulture/modules/profile/pages/dummy_data.dart';
import 'package:kulture/modules/profile/widgets/switch_tab_item.dart';
import 'package:kulture/utils/extensions/extended_context.dart';
import 'package:kulture/utils/heights_and_widths.dart';

import '../../profile/widgets/suggested_user_card.dart';
import '../../profile/widgets/switch_tab_copy.dart';

class StitchTab extends StatefulWidget {
  StitchTab({super.key});

  @override
  State<StitchTab> createState() => _StitchTabState();
}

class _StitchTabState extends State<StitchTab> {
  final posts = DummyData.posts;

  List<SuggestedUser> users = DummyData.users;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 365,
            child: ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: posts.length,
              itemBuilder: (context, index) {
                return SwitchTabItemCopy(
                  post: posts[index],
                  profileImageUrl: Assets.pngImage5,
                  isProfileScreen: false,
                );
              },
            ),
          ),
          h1,
          const Divider(
            height: 1,
            thickness: 0.5,
            color: AppColors.lightGreyColor,
          ),
          h2,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Text(
              'Suggested for you',
              style: context.textTheme.bodyMedium?.copyWith(
                color: AppColors.textGrey,
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          h2,
          SizedBox(
            height: 190,
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              scrollDirection: Axis.horizontal,
              itemCount: users.length,
              itemBuilder: (context, index) {
                return SuggestedUserCard(
                  user: users[index],
                  onDismiss: () {
                    setState(() {
                      users.removeAt(index);
                    });
                  },
                );
              },
              separatorBuilder: (context, index) => const SizedBox(width: 12),
            ),
          ),
          h2,
          const Divider(
            height: 1,
            thickness: 0.5,
            color: AppColors.lightGreyColor,
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: posts.length,
            itemBuilder: (context, index) {
              return SwitchTabItemCopy(
                post: posts[index],
                profileImageUrl: Assets.pngImage5,
                isProfileScreen: false,
              );
            },
          ),
        ],
      ),
    );
  }
}
