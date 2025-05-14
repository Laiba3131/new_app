import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kulture/config/routes/nav_router.dart';
import 'package:kulture/constants/app_colors.dart';
import 'package:kulture/generated/assets.dart';
import 'package:kulture/modules/profile/pages/user_profile_screen.dart';
import 'package:kulture/utils/extensions/extended_context.dart';

import '../pages/infinity_scrolling_photos.dart';

class PhotoTab extends StatefulWidget {
  final int itemCount;

  const PhotoTab({super.key, this.itemCount = 10});

  @override
  State<PhotoTab> createState() => _PhotoTabState();
}

class _PhotoTabState extends State<PhotoTab> {
  String _getImageForIndex(int index) {
    final List<String> images = [
      Assets.pngImage1,
      Assets.pngImage2,
      Assets.pngImage3,
      Assets.pngImage4,
      Assets.pngImage5,
    ];

    return images[index % images.length];
  }

  late List<bool> likedItems;
  @override
  void initState() {
    likedItems = List<bool>.filled(widget.itemCount, false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MasonryGridView.count(
      crossAxisCount: 2,
      mainAxisSpacing: 7,
      crossAxisSpacing: 5,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      itemCount: widget.itemCount,
      itemBuilder: (context, index) {
        bool isImages = index % 3 == 0;
        final isEven = index % 2 == 0;
        final imageAsset = _getImageForIndex(index);
        return ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  NavRouter.push(
                    context,
                    const InfinityScrollingPhotos(),
                  );
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => const InfinityScrollingPhotos(),
                  //   ),
                  // );
                },
                child: Stack(
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
                    (isImages)
                        ? Positioned(
                            top: 12,
                            right: 12,
                            child: SvgPicture.asset(Assets.images))
                        : SizedBox()
                  ],
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
                              const CircleAvatar(
                                radius: 10,
                                backgroundImage: AssetImage(
                                  Assets.pngImage1,
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
                                      color: Colors.black, size: 8),
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
                            isEven ? 'TinyBossHQ' : 'Denny 💕',
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
