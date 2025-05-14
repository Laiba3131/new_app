import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kulture/config/routes/nav_router.dart';
import 'package:kulture/constants/app_colors.dart';
import 'package:kulture/core/service/bottm_sheet_service.dart';
import 'package:kulture/generated/assets.dart';
import 'package:kulture/modules/home/pages/home_screen.dart';
import 'package:kulture/modules/profile/pages/your_profile_screen.dart';
import 'package:kulture/ui/button/primary_button.dart';
import 'package:kulture/ui/widgets/custom_favt_button.dart';
import 'package:kulture/utils/extensions/extended_context.dart';
import 'package:kulture/utils/heights_and_widths.dart';

import '../../profile/pages/user_profile_screen.dart';

class InfinityScrollingScreen extends StatefulWidget {
  const InfinityScrollingScreen({super.key});

  @override
  State<InfinityScrollingScreen> createState() =>
      _InfinityScrollingScreenState();
}

class _InfinityScrollingScreenState extends State<InfinityScrollingScreen>
    with SingleTickerProviderStateMixin {
  // Animation controllers for swipe hints
  late AnimationController _swipeHintController;
  late Animation<Offset> _swipeRightHintAnimation;
  late Animation<Offset> _swipeLeftHintAnimation;
  final PageController _pageController = PageController();

  // Sample data for multiple videos/images
  final List<Map<String, dynamic>> _items = [
    {
      'image': Assets.img1,
      'username': 'Betty Cooks',
      'profileImage': Assets.pngImage2,
      'caption':
          'Taking life one step at a time, embracing the good and the bad. Grateful for the little moments, the big dreams. ✨😊',
      'comments': '1.4M',
      'likes': '16.9K',
      'shares': '940'
    },
    {
      'image': Assets.pngImage1,
      'username': 'John Smith',
      'profileImage': Assets.pngImage3,
      'caption':
          'Exploring new places and making memories. Life is an adventure! 🌍',
      'comments': '823K',
      'likes': '12.3K',
      'shares': '512'
    },
    {
      'image': Assets
          .pngImage2, // Using img1 again since img3 points to the same as img2
      'username': 'Sarah Lee',
      'profileImage': Assets.pngImage5,
      'caption':
          'The best view comes after the hardest climb. Never give up on your dreams! 🏔️',
      'comments': '512K',
      'likes': '9.8K',
      'shares': '320'
    }
  ];
  bool isDislike = false;
  bool isFollow = true;
  @override
  void initState() {
    super.initState();

    // Setup swipe hint animation
    _swipeHintController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    _swipeRightHintAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(0.2, 0.0),
    ).animate(CurvedAnimation(
      parent: _swipeHintController,
      curve: Curves.easeInOut,
    ));

    _swipeLeftHintAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(-0.2, 0.0),
    ).animate(CurvedAnimation(
      parent: _swipeHintController,
      curve: Curves.easeInOut,
    ));

    // Show swipe hint briefly after screen loads
    Future.delayed(const Duration(milliseconds: 300), () {
      _swipeHintController.forward().then((_) {
        _swipeHintController.reverse();
      });
    });
  }

  @override
  void dispose() {
    _swipeHintController.dispose();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        controller: _pageController,
        itemCount: _items.length,
        itemBuilder: (context, index) {
          final item = _items[index];
          return GestureDetector(
            // Add horizontal drag gesture handler
            onHorizontalDragEnd: (details) {
              // If swiped right (positive velocity)
              if (details.primaryVelocity! > 0) {
                // Navigate to the HomeScreen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );
              }
              // If swiped left (negative velocity)
              else if (details.primaryVelocity! < 0) {
                // Navigate to the YourProfileScreen
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const YourProfileScreen()),
                );
              }
            },
            child: Stack(
              children: [
                // Left swipe indicator
                Positioned(
                  left: 10,
                  top: 0,
                  bottom: 0,
                  child: Center(
                    child: SlideTransition(
                      position: _swipeLeftHintAnimation,
                      child: Icon(
                        Icons.keyboard_arrow_left,
                        color: Colors.white.withOpacity(0.5),
                        size: 40,
                      ),
                    ),
                  ),
                ),
                // Right swipe indicator
                Positioned(
                  right: 10,
                  top: 0,
                  bottom: 0,
                  child: Center(
                    child: SlideTransition(
                      position: _swipeRightHintAnimation,
                      child: Icon(
                        Icons.keyboard_arrow_right,
                        color: Colors.white.withOpacity(0.5),
                        size: 40,
                      ),
                    ),
                  ),
                ),
                SlideTransition(
                  position: _swipeRightHintAnimation,
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: Image.asset(
                          item['image'],
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                        color: Colors.black
                            .withOpacity(0.2), // Add a slight dark overlay
                      ),
                      Scaffold(
                        backgroundColor: Colors.transparent,
                        body: Stack(
                          children: [
                            Align(
                              alignment: Alignment.center,
                              child: IconButton(
                                icon: const Icon(Icons.play_circle_fill,
                                    size: 80, color: Colors.white70),
                                onPressed: () {},
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    right: 16.0, bottom: 190.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    CustomFavoriteIcon(
                                      unFillColor: AppColors.white,
                                      fillColor: AppColors.red,
                                      outlineAssetPath: Assets.svgFvt,
                                      filledAssetPath: Assets.svgFvtFilled,
                                      size: 25,
                                      initiallyFavorited: false,
                                      onToggle: (isFav) {},
                                    ),
                                    Text(
                                      item['likes'],
                                      style: context.textTheme.bodyMedium
                                          ?.copyWith(
                                        color: AppColors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    h2,
                                    CustomFavoriteIcon(
                                      unFillColor: AppColors.white,
                                      outlineAssetPath: Assets.thum,
                                      filledAssetPath: Assets.dislikeIcon,
                                      size: 25,
                                      fillColor: AppColors.black,
                                      initiallyFavorited: false,
                                      onToggle: (isFav) {},
                                    ),
                                    // InkWell(
                                    //   onTap: (){
                                    //     isDislike=!isDislike;
                                    //   },
                                    //   child: SvgPicture.asset(Assets.thum,
                                    //       height: 25, color: AppColors.white),
                                    // ),
                                    Text(
                                      'Dislike',
                                      style: context.textTheme.bodyMedium
                                          ?.copyWith(
                                        color: AppColors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    h2,
                                    InkWell(
                                      onTap: () async {
                                        BottomSheetService.showCommentSheet(
                                            context);
                                      },
                                      child: SvgPicture.asset(Assets.svgComment,
                                          color: AppColors.white, height: 25),
                                    ),
                                    Text(
                                      item['comments'],
                                      style: context.textTheme.bodyMedium
                                          ?.copyWith(
                                        color: AppColors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    h2,
                                    InkWell(
                                      onTap: () async {
                                        BottomSheetService.showSendNoteSheet(
                                            context);
                                      },
                                      child: SvgPicture.asset(
                                        Assets.svgSendIcon,
                                        color: AppColors.white,
                                        height: 25,
                                      ),
                                    ),
                                    Text(
                                      item['shares'],
                                      style: context.textTheme.bodyMedium
                                          ?.copyWith(
                                        color: AppColors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    h2,
                                    InkWell(
                                      onTap: () async {
                                        BottomSheetService.showSaveSheet(
                                            context);
                                      },
                                      child: const Icon(Icons.more_horiz,
                                          color: Colors.white, size: 25),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomLeft,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 16.0, bottom: 80.0, right: 16.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                              CircleAvatar(
                                                radius: 23,
                                                backgroundImage: AssetImage(
                                                    item['profileImage']),
                                              ),
                                              Positioned(
                                                bottom: -0,
                                                right: -2,
                                                left: 24,
                                                child: Container(
                                                  height: 20,
                                                  width: 20,
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    shape: BoxShape.circle,
                                                    border: Border.all(
                                                        color: Colors.white,
                                                        width: 2),
                                                  ),
                                                  child: const Icon(
                                                      Icons.add_circle,
                                                      color: Colors.black,
                                                      size: 16),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(width: 8),
                                        InkWell(
                                          onTap: () {
                                            NavRouter.push(
                                              context,
                                              const UserProfileScreen(),
                                            );
                                          },
                                          child: Text(
                                              item['username']
                                                  .toString()
                                                  .toLowerCase()
                                                  .replaceAll(' ', ''),
                                              style: context
                                                  .textTheme.bodyMedium
                                                  ?.copyWith(
                                                color: AppColors.white,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w700,
                                              )),
                                        ),
                                        const SizedBox(width: 8),
                                        PrimaryButton(
                                          title:
                                              isFollow ? 'Follow' : 'Unfollow',
                                          onPressed: () {
                                            setState(() {
                                              isFollow = !isFollow;
                                            });
                                          },
                                          backgroundColor: isFollow
                                              ? AppColors.primaryColor
                                              : AppColors.white,
                                          titleColor: isFollow
                                              ? AppColors.white
                                              : AppColors.black,
                                          borderRadius: 6,
                                          width: 75,
                                          fontSize: 12,
                                          height: 25,
                                          hMargin: 0,
                                          shadowColor: AppColors.transparent,
                                        ),
                                      ],
                                    ),
                                    h1,
                                    Text(item['caption'],
                                        style: context.textTheme.bodyMedium
                                            ?.copyWith(
                                          color: AppColors.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                        )),
                                    h1,
                                    h0P5
                                  ],
                                ),
                              ),
                            ),
                            // Indicator for scrolling (only show if not the last item)
                            if (index < _items.length - 1)
                              Positioned(
                                bottom: 25,
                                left: 0,
                                right: 0,
                                child: Center(
                                  child: Icon(
                                    Icons.keyboard_arrow_down,
                                    color: Colors.white.withOpacity(0.7),
                                    size: 30,
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
