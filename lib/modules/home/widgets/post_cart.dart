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

class PostCard extends StatefulWidget {
  final PhotoPost post;

  const PostCard({super.key, required this.post});

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  bool isLiked = false;
  bool isSaved = false;

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
                      title: 'Follow',
                      onPressed: () {},
                      backgroundColor: AppColors.primaryColor,
                      titleColor: AppColors.white,
                      borderRadius: 6,
                      width: 75,
                      height: 25,
                      shadowColor: AppColors.transparent,
                      hMargin: 0,
                    ),
                    const SizedBox(width: 8),
                    InkWell(
                        onTap: () async {
                          BottomSheetService.showSaveSheet(context);
                        },
                        child:
                            const Icon(Icons.more_horiz, color: Colors.black)),
                  ],
                ),
              ],
            ),
          ),
         Padding(
  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
  child: GestureDetector(
    onTap: () => _openFullScreen(context, widget.post.imageUrl),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(12.0),
      child: AspectRatio(
        aspectRatio: 1.0,
        child: Image.asset(
          widget.post.imageUrl,
          fit: BoxFit.fitHeight,
        ),
      ),
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
                    InkWell(
                      onTap: () async {
                        BottomSheetService.showCommentSheet(context);
                      },
                      child: Row(
                        children: [
                          Image.asset(Assets.comment, width: 24, height: 24),
                          // SvgPicture.asset(Assets.svgFvt,color: AppColors.black,),
                          //  CustomFavoriteIcon(
                          //             outlineAssetPath: Assets.svgFvt,
                          //             filledAssetPath: Assets.svgFvtFilled,
                          //             size: 25,
                          //             initiallyFavorited: false,
                          //             onToggle: (isFav) {},
                          //           ),
                          w0P5,
                          Text('1.4M',
                              style: context.textTheme.bodySmall?.copyWith(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.black)),
                        ],
                      ),
                    ),
                    w3,
                    SvgPicture.asset(
                      Assets.thum,
                      height: 25,
                      color: AppColors.black,
                      width: 25,
                    ),
                    w3,
                    InkWell(
                      onTap: () {
                        setState(() {
                          isLiked = !isLiked;
                        });
                      },
                      child: Row(
                        children: [
                          isLiked
                              ? const Icon(Icons.favorite,
                                  color: Colors.red, size: 24)
                              : Image.asset(Assets.like, width: 24, height: 24),
                          // SvgPicture.asset(Assets.svgComment,color: AppColors.black,),
                          w0P5,
                          Text('16.9K',
                              style: context.textTheme.bodySmall?.copyWith(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.black)),
                        ],
                      ),
                    ),
                    w3,
                    InkWell(
                      onTap: () {
                        BottomSheetService.showSendNoteSheet(context);
                      },
                      child: Row(
                        children: [
                          Image.asset(Assets.send, width: 24, height: 24),
                          // SvgPicture.asset(Assets.svgSendIcon,color: AppColors.black,),
                          w0P5,
                          Text('940',
                              style: context.textTheme.bodySmall?.copyWith(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.black)),
                        ],
                      ),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isSaved = !isSaved;
                    });
                    // showSaveSheet(context);
                  },
                  child: isSaved
                      ? const Icon(Icons.bookmark,
                          color: Colors.black, size: 24)
                      : Image.asset(Assets.save, width: 24, height: 24),
                ),
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
                      : event.cumulativeBytesLoaded / event.expectedTotalBytes!,
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
