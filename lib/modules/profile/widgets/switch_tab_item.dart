import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kulture/config/routes/nav_router.dart';
import 'package:kulture/constants/app_colors.dart';
import 'package:kulture/generated/assets.dart';
import 'package:kulture/modules/profile/model/post_data_model.dart';
import 'package:kulture/modules/profile/pages/user_profile_screen.dart';
import 'package:kulture/utils/extensions/extended_context.dart';
import 'package:kulture/utils/heights_and_widths.dart';
import '../../../core/service/bottm_sheet_service.dart';

class SwitchTabItem extends StatelessWidget {
  final PostData post;
  final String profileImageUrl;
  bool isProfileScreen;
  SwitchTabItem(
      {super.key,
      required this.post,
      required this.profileImageUrl,
      this.isProfileScreen = true});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          post.username,
                          style: context.textTheme.bodySmall?.copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: AppColors.black),
                        ),
                        w0P5,
                        Text(
                          post.timeAgo,
                          style: context.textTheme.bodySmall?.copyWith(
                              fontSize: 13,
                              fontWeight: FontWeight.w300,
                              color: AppColors.textGrey),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 80,
                      child: Text(post.content,
                          style: context.textTheme.bodySmall?.copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: AppColors.black)),
                    ),
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 5,
                      children: post.hashtags
                          .map((hashtag) => Text('#$hashtag',
                              style: context.textTheme.bodySmall?.copyWith(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.primaryColor)))
                          .toList(),
                    ),
                    h1,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(Assets.svgFvt),
                            w0P5,
                            Text(post.likes.toString(),
                                style: context.textTheme.bodySmall?.copyWith(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.textGrey)),
                          ],
                        ),
                        w3,
                        InkWell(
                          onTap: () {
                            BottomSheetService.showCommentSheet(context);
                          },
                          child: Row(
                            children: [
                              SvgPicture.asset(Assets.svgComment),
                              w0P5,
                              Text(post.comments.toString(),
                                  style: context.textTheme.bodySmall?.copyWith(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.textGrey)),
                            ],
                          ),
                        ),
                        w3,
                        InkWell(
                          onTap: () {
                            // BottomSheetService.showSaveSheet(context);
                          },
                          child: Row(
                            children: [
                              SvgPicture.asset(Assets.svgReload),
                              w0P5,
                              Text(post.retweets.toString(),
                                  style: context.textTheme.bodySmall?.copyWith(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.textGrey)),
                            ],
                          ),
                        ),
                        w4,
                        InkWell(
                            onTap: () {
                              BottomSheetService.showSendNoteSheet(context);
                            },
                            child: SvgPicture.asset(Assets.svgSendIcon)),
                      ],
                    ),
                  ],
                ),
              ),
              const Icon(Icons.more_horiz, color: Colors.grey),
            ],
          ),
        ],
      ),
    );
  }
}
