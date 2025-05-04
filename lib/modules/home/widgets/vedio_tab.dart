import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kulture/config/routes/nav_router.dart';
import 'package:kulture/constants/app_colors.dart';
import 'package:kulture/generated/assets.dart';
import 'package:kulture/modules/home/pages/infinity_scrolling_screen.dart';
import 'package:kulture/modules/home/pages/tiktok_home_screen.dart';
import 'package:kulture/utils/extensions/extended_context.dart';

import '../../profile/pages/user_profile_screen.dart';

class VideoGridWidget extends StatefulWidget {
  final int itemCount;
  final bool isIconTrue;

  const VideoGridWidget(
      {super.key, this.itemCount = 10, this.isIconTrue = false});

  @override
  State<VideoGridWidget> createState() => _VideoGridWidgetState();
}

class _VideoGridWidgetState extends State<VideoGridWidget> {
  String _getImageForIndex(int index) {
    final List<String> images = [
      Assets.pngImage3,
      Assets.pngImage4,
      Assets.pngImage5,
      Assets.pngImage1,
      Assets.pngImage2,
    ];

    return images[index % images.length];
  }

  late List<bool> likedItems;
// bool isLiked = false;
  @override
  void initState() {
    likedItems = List<bool>.filled(widget.itemCount, false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MasonryGridView.count(
      crossAxisCount: 2,
      mainAxisSpacing: 8,
      crossAxisSpacing: 7,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      itemCount: widget.itemCount,
      itemBuilder: (context, index) {
        final isEven = index % 2 == 0;
        final imageAsset = _getImageForIndex(index);

        return ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  NavRouter.push(context, const InfinityScrollingScreen());
                },
                child: widget.isIconTrue == true
                    ? Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.asset(
                              imageAsset,
                              height: isEven ? 295 : 200,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Positioned(
                              top: 8,
                              right: 8,
                              child: SvgPicture.asset(Assets.vedioPlay)),
                        ],
                      )
                    : ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          imageAsset,
                          height: isEven ? 295 : 200,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
              ),
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      isEven
                          ? 'My life is really like movie 🌟🍿🚀'
                          : 'How I style my dr martens with mini skirts! 💋✨',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: context.textTheme.bodyMedium?.copyWith(
                          color: AppColors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 6),
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
                              CircleAvatar(
                                radius: 15,
                                backgroundImage: AssetImage(
                                  _getImageForIndex(index + 2),
                                ),
                              ),
                              Positioned(
                                bottom: -2,
                                right: -2,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        color: Colors.white, width: 2),
                                  ),
                                  child: const Icon(Icons.add_circle,
                                      color: Colors.black, size: 16),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 6),
                        InkWell(
                          onTap: () {
                            NavRouter.push(
                              context,
                              const UserProfileScreen(),
                            );
                          },
                          child: Text(
                            (isEven ? 'TinyBossHQ' : 'Denny')
                                .toString()
                                .toLowerCase()
                                .replaceAll(' ', ''),
                            style: context.textTheme.bodyMedium?.copyWith(
                                color: AppColors.textGrey,
                                fontSize: 14,
                                fontWeight: FontWeight.w300),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              likedItems[index] = !likedItems[index];
                            });
                          },
                          child: Icon(
                            likedItems[index]
                                ? Icons.favorite
                                : Icons.favorite_border,
                            size: 18,
                            color: likedItems[index]
                                ? Colors.red
                                : AppColors.black,
                          ),
                        ),
                        const SizedBox(width: 2),
                        Text(
                          '${(index + 1) * 100}',
                          style: context.textTheme.bodyMedium?.copyWith(
                              color: AppColors.textGrey,
                              fontSize: 14,
                              fontWeight: FontWeight.w300),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
