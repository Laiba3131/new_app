import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kulture/config/routes/nav_router.dart';
import 'package:kulture/constants/app_colors.dart';
import 'package:kulture/generated/assets.dart';
import 'package:kulture/modules/profile/model/post_data_model.dart';
import 'package:kulture/modules/profile/pages/user_profile_screen.dart';
import 'package:kulture/ui/widgets/custom_favt_button.dart';
import 'package:kulture/utils/extensions/extended_context.dart';
import 'package:kulture/utils/heights_and_widths.dart';
import '../../../core/service/bottm_sheet_service.dart';

class SwitchTabItemCopy extends StatelessWidget {
  final PostData post;
  final String profileImageUrl;
  final bool isProfileScreen;

  const SwitchTabItemCopy({
    super.key,
    required this.post,
    required this.profileImageUrl,
    this.isProfileScreen = true,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Left side with Avatar + Line
          Column(
            children: [
              // Avatar
              isProfileScreen
                  ? InkWell(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const UserProfileScreen(),
                          ),
                        );
                      },
                      child: CircleAvatar(
                        radius: 18,
                        backgroundImage: AssetImage(profileImageUrl),
                      ),
                    )
                  : InkWell(
                      onTap: () {
                        NavRouter.push(
                          context,
                          const UserProfileScreen(),
                        );
                      },
                      child: Stack(
                        children: [
                          CircleAvatar(
                            radius: 20,
                            backgroundImage: AssetImage(profileImageUrl),
                          ),
                          Positioned(
                            bottom: -2,
                            right: -2,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                                border:
                                    Border.all(color: Colors.white, width: 2),
                              ),
                              child: const Icon(Icons.add_circle,
                                  color: Colors.black, size: 16),
                            ),
                          ),
                        ],
                      ),
                    ),
              // Vertical line
              Container(
                margin: const EdgeInsets.only(top: 10),
                width: 1,
                height: 120,
                color: AppColors.lightGreyColor,
              ),
            ],
          ),
          w2,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Username + Time
                Row(
                  children: [
                    Text(
                      post.username,
                      style: context.textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        color: AppColors.black,
                      ),
                    ),
                    w2,
                    Text(
                      post.timeAgo,
                      style: context.textTheme.bodySmall?.copyWith(
                        fontSize: 13,
                        fontWeight: FontWeight.w300,
                        color: AppColors.textGrey,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                Text(
                  post.content,
                  style: context.textTheme.bodySmall?.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: AppColors.black,
                  ),
                ),
                const SizedBox(height: 8),
                // Hashtags
                Wrap(
                  spacing: 5,
                  children: post.hashtags
                      .map((tag) => Text(
                            '#$tag',
                            style: context.textTheme.bodySmall?.copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: AppColors.primaryColor,
                            ),
                          ))
                      .toList(),
                ),
                h1,
                // Actions Row
                Row(
                  children: [
                    CustomFavoriteIcon(
                      unFillColor: AppColors.svgIconColor,
                      fillColor: AppColors.red,
                      outlineAssetPath: Assets.svgFvt,
                      filledAssetPath: Assets.svgFvtFilled,
                      size: 20,
                      initiallyFavorited: false,
                      onToggle: (isFav) {},
                    ),
                    w1,
                    Text("587", style: _statStyle(context)),
                    w2,
                    CustomFavoriteIcon(
                      unFillColor: AppColors.svgIconColor,
                      outlineAssetPath: Assets.thum,
                      filledAssetPath: Assets.dislikeIcon,
                      size: 20,
                      fillColor: AppColors.black,
                      initiallyFavorited: false,
                      onToggle: (isFav) {},
                    ),
                    w2,
                    InkWell(
                      onTap: () async {
                        BottomSheetService.showCommentSheet(context);
                      },
                      child: SvgPicture.asset(Assets.svgComment,
                          color: AppColors.svgIconColor, height: 20),
                    ),
                    w1,
                    Text("20", style: _statStyle(context)),
                    w2,
                    SvgPicture.asset(Assets.svgReload,
                        color: AppColors.svgIconColor, height: 17),
                    w1,
                    Text("5", style: _statStyle(context)),
                    w2,
                    InkWell(
                      onTap: () async {
                        BottomSheetService.showSendNoteSheet(context);
                      },
                      child: SvgPicture.asset(Assets.svgSendIcon,
                          color: AppColors.svgIconColor, height: 20),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          InkWell(
              onTap: () async {
                BottomSheetService.showSaveSheet(context);
              },
              child: SvgPicture.asset(Assets.moreOptions,
                  color: AppColors.textGrey)),
        ],
      ),
    );
  }

  TextStyle? _statStyle(BuildContext context) {
    return context.textTheme.bodyMedium?.copyWith(
      fontSize: 14,
      fontWeight: FontWeight.w300,
      color: AppColors.black,
    );
  }
}
