// lib/modules/profile/widgets/user_profile_tile.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kulture/config/routes/nav_router.dart';
import 'package:kulture/constants/app_colors.dart';
import 'package:kulture/modules/profile/pages/user_profile_screen.dart';
import 'package:kulture/modules/search/widgets/unfollow_confirmation_sheet.dart';
import 'package:kulture/ui/button/primary_button.dart';
import 'package:kulture/utils/extensions/extended_context.dart';
import 'package:kulture/modules/search/cubit/search_cubit.dart';
import 'package:kulture/ui/bottom_bar_visibility_provider.dart';

class UserProfileTile extends StatelessWidget {
  final Map<String, dynamic> user;

  const UserProfileTile({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              NavRouter.push(
                context,
                const UserProfileScreen(),
              );
            },
            child: CircleAvatar(
              radius: 20,
              backgroundColor: Colors.grey[300],
              backgroundImage: AssetImage(user['imageUrl']),
              onBackgroundImageError: (_, __) {},
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Top row with name, username and follow button
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            user['name'],
                            style: context.textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.w400,
                              fontSize: 17,
                              color: AppColors.black,
                            ),
                          ),
                          Text(
                            user['username'],
                            style: context.textTheme.bodyMedium?.copyWith(
                              color: AppColors.textGrey,
                              fontWeight: FontWeight.w400,
                              fontSize: 15,
                            ),
                          ),
                        ]),
                    ),
                    const SizedBox(width: 8),
                    PrimaryButton(
                      onPressed: () async {
                        if (user['isFollowing']) {
                          BottomBarVisibilityProvider().hide();
                          await showModalBottomSheet(
                            context: context,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(20)),
                            ),
                            isScrollControlled: true,
                            builder: (_) => UnfollowConfirmationSheet(
                              username: user['name'],
                              userImage: user['imageUrl'],
                              onConfirm: () {
                                context
                                    .read<SearchCubit>()
                                    .toggleFollowStatus(user['id']);
                                Navigator.of(context).pop();
                              },
                            ),
                          );
                          BottomBarVisibilityProvider().show();
                        } else {
                          context
                              .read<SearchCubit>()
                              .toggleFollowStatus(user['id']);
                        }
                      },
                      title: user['isFollowing'] ? 'Following' : 'Follow',
                      width: 120,
                      height: 36,
                      backgroundColor: user['isFollowing']
                          ? Colors.white
                          : AppColors.primaryColor,
                      shadowColor: AppColors.transparent,
                      titleColor:
                          user['isFollowing'] ? Colors.black : AppColors.white,
                      borderRadius: 11,
                      bborderColor: user['isFollowing']
                          ? AppColors.black
                          : AppColors.transparent,
                    ),
                  ],
                ),
                // Bio text immediately below, with minimal spacing
                Padding(
                  padding: const EdgeInsets.only(top: 2.0),
                  child: Text(
                    user['bio'],
                    style: context.textTheme.bodyMedium?.copyWith(
                      color: AppColors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: 15,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                // Followers count with minimal spacing
                Padding(
                  padding: const EdgeInsets.only(top: 2.0),
                  child: Text(
                    user['followers'],
                    style: context.textTheme.bodySmall?.copyWith(
                      color: AppColors.textGrey,
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
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