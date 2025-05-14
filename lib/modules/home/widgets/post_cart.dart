import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kulture/config/routes/nav_router.dart';
import 'package:kulture/constants/app_colors.dart';
import 'package:kulture/generated/assets.dart';
import 'package:kulture/modules/home/model/post_model.dart';
import 'package:kulture/modules/profile/pages/user_profile_screen.dart';
import 'package:kulture/ui/button/primary_button.dart';
import 'package:kulture/utils/extensions/extended_context.dart';
import 'package:kulture/utils/heights_and_widths.dart';
import 'package:photo_view/photo_view.dart';
import '../../../core/service/bottm_sheet_service.dart';
import '../../../ui/widgets/custom_favt_button.dart';
import 'package:kulture/modules/home/widgets/multi_image_carousel.dart';

class PostCard extends StatefulWidget {
  final PhotoPost post;

  const PostCard({super.key, required this.post});

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  bool isLiked = false;
  bool isSaved = false;
  bool isFollow = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        NavRouter.push(
                          context,
                          const UserProfileScreen(),
                        );
                      },
                      child: Stack(
                        children: [
                          const CircleAvatar(
                            radius: 20,
                            backgroundImage: AssetImage(
                              Assets.pngImage6,
                            ),
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
                    const SizedBox(width: 12),
                    InkWell(
                      onTap: () {
                        NavRouter.push(
                          context,
                          const UserProfileScreen(),
                        );
                      },
                      child: const Text(
                        'Balaiytoreal',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
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
                      bborderColor:
                          isFollow ? AppColors.searchBarColor : AppColors.black,
                      borderRadius: 6,
                      width: 75,
                      fontSize: 12,
                      height: 25,
                      hMargin: 0,
                      shadowColor: AppColors.transparent,
                    ),
                    const SizedBox(width: 8),
                    InkWell(
                        onTap: () async {
                          BottomSheetService.showSaveSheet(context);
                        },
                        child: SvgPicture.asset(Assets.moreOptions)),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: GestureDetector(
              onTap: () => _openFullScreen(context, widget.post.imageUrl),
              child: MultiImageCarousel(
                imageUrls: [
                  widget.post.imageUrl,
                  Assets.img1,
                  Assets.pngImage3
                ], // List<String>
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
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
                    Text(
                      '19.7k',
                      style: context.textTheme.bodyMedium?.copyWith(
                        color: AppColors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
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
                    w1,
                    Text(
                      'Dislike',
                      style: context.textTheme.bodyMedium?.copyWith(
                        color: AppColors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
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
                    Text(
                      ' 16.9k',
                      style: context.textTheme.bodyMedium?.copyWith(
                        color: AppColors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    w2,
                    InkWell(
                      onTap: () async {
                        BottomSheetService.showSendNoteSheet(context);
                      },
                      child: SvgPicture.asset(
                        Assets.svgSendIcon,
                        color: AppColors.svgIconColor,
                        height: 20,
                      ),
                    ),
                    w1,
                    Text(
                      '940',
                      style: context.textTheme.bodyMedium?.copyWith(
                        color: AppColors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                // GestureDetector(
                //   onTap: () {
                //     setState(() {
                //       isSaved = !isSaved;
                //     });
                //     // showSaveSheet(context);
                //   },
                //   child: isSaved
                //       ? const Icon(Icons.bookmark,
                //           color: Colors.black, size: 24)
                //       : Image.asset(Assets.save, width: 24, height: 24),
                // ),
              ],
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: '${widget.post.username} ',
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  TextSpan(
                    text: widget.post.caption,
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _openFullScreen(BuildContext context, String imageUrl) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () => Navigator.pop(context),
            ),
          ),
          body: Container(
            color: Colors.white,
            constraints: const BoxConstraints.expand(),
            child: PhotoView(
              imageProvider: AssetImage(imageUrl),
              initialScale: PhotoViewComputedScale.contained,
              minScale: PhotoViewComputedScale.contained,
              maxScale: PhotoViewComputedScale.covered * 3,
              heroAttributes: PhotoViewHeroAttributes(tag: imageUrl),
              enableRotation: true,
              backgroundDecoration: const BoxDecoration(color: Colors.white),
              loadingBuilder: (context, event) => Center(
                child: SizedBox(
                  width: 20.0,
                  height: 20.0,
                  child: CircularProgressIndicator(
                    value: event == null
                        ? 0
                        : event.cumulativeBytesLoaded /
                            event.expectedTotalBytes!,
                  ),
                ),
              ),
              errorBuilder: (context, error, stackTrace) => const Center(
                child: Icon(Icons.error, color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
