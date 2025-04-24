import 'dart:async';
import 'package:flutter/material.dart';
import 'package:kulture/app/cubit/app_cubit.dart';
import 'package:kulture/constants/app_colors.dart';
import 'package:kulture/modules/home/widgets/delete_bottom_sheet.dart';
import 'package:kulture/modules/stories/models/story_model.dart';
import 'package:kulture/ui/button/primary_button.dart';
import 'package:kulture/utils/extensions/extended_context.dart';
import 'package:kulture/utils/heights_and_widths.dart';
import 'package:kulture/ui/widgets/bottom_sheet_utils.dart';
import 'package:kulture/ui/bottom_bar_visibility_provider.dart';

class StoryViewScreen extends StatefulWidget {
  final List<Story> stories;
  final int initialStoryIndex;

  const StoryViewScreen({
    super.key,
    required this.stories,
    this.initialStoryIndex = 0,
  });

  @override
  State<StoryViewScreen> createState() => _StoryViewScreenState();
}

class _StoryViewScreenState extends State<StoryViewScreen> {
  late PageController _pageController;
  late Timer _timer;
  int _currentStoryIndex = 0;
  final Duration _storyDuration = const Duration(seconds: 5);
  double _progress = 0.0;

  @override
  void initState() {
    super.initState();
    _currentStoryIndex = widget.initialStoryIndex;
    _pageController = PageController(initialPage: _currentStoryIndex);
    _startStoryTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    _pageController.dispose();
    super.dispose();
  }

  void _startStoryTimer() {
    const updateInterval = Duration(milliseconds: 50);
    _timer = Timer.periodic(updateInterval, (timer) {
      setState(() {
        _progress +=
            updateInterval.inMilliseconds / _storyDuration.inMilliseconds;
        if (_progress >= 1.0) {
          _progress = 0.0;
          _nextStory();
        }
      });
    });
  }

  void _nextStory() {
    if (_currentStoryIndex < widget.stories.length - 1) {
      _currentStoryIndex++;
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.pop(context);
    }
  }

  void _previousStory() {
    if (_currentStoryIndex > 0) {
      _currentStoryIndex--;
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _onTapDown(TapDownDetails details) {
    final screenWidth = MediaQuery.of(context).size.width;
    final tapPosition = details.globalPosition.dx;

    if (tapPosition < screenWidth / 2) {
      _previousStory();
    } else {
      _nextStory();
    }
  }

  void _showDeleteSheet(BuildContext context) async {
    // Hide the bottom bar before showing the sheet
    BottomBarVisibilityProvider().hide();

    // Show the bottom sheet and await its closure
    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => const DeleteBottomSheet(),
    );

    // Show the bottom bar again after the sheet is closed
    BottomBarVisibilityProvider().show();
  }

  @override
  Widget build(BuildContext context) {
    final story = widget.stories[_currentStoryIndex];

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children: [
            Expanded(
              child: GestureDetector(
                onTapDown: _onTapDown,
                onLongPressStart: (_) => _timer.cancel(),
                onLongPressEnd: (_) => _startStoryTimer(),
                child: Stack(
                  children: [
                    PageView.builder(
                      controller: _pageController,
                      itemCount: widget.stories.length,
                      onPageChanged: (index) {
                        setState(() {
                          _currentStoryIndex = index;
                          _progress = 0.0;
                        });
                      },
                      itemBuilder: (context, index) {
                        return Image.asset(
                          widget.stories[index].imageUrl,
                          fit: BoxFit.cover,
                        );
                      },
                    ),
                    Positioned(
                      top: 20,
                      left: 0,
                      right: 0,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Row(
                          children: List.generate(
                            widget.stories.length,
                            (index) => Expanded(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 2),
                                child: LinearProgressIndicator(
                                  value: index == _currentStoryIndex
                                      ? _progress
                                      : index < _currentStoryIndex
                                          ? 1.0
                                          : 0.0,
                                  backgroundColor: Colors.grey.withOpacity(0.3),
                                  valueColor:
                                      const AlwaysStoppedAnimation<Color>(
                                          Colors.white),
                                  minHeight: 2,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),

                    Positioned(
                      top: 30,
                      left: 16,
                      right: 16,
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 16,
                            backgroundImage: AssetImage(story.imageUrl),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            story.username,
                            style: context.textTheme.bodyMedium?.copyWith(
                              color: AppColors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            story.timeAgo,
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.8),
                            ),
                          ),
                          const Spacer(),
                          PrimaryButton(
                              onPressed: () {
                                _showDeleteSheet(context);
                              },
                              title: 'Follow',
                              width: 90,
                              height: 36,
                              backgroundColor: AppColors.blue,
                              borderRadius: 11),
                          InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child:
                                  const Icon(Icons.close, color: Colors.white)),
                        ],
                      ),
                    ),
                    if (story.isOwn)
                      Positioned(
                        bottom: MediaQuery.of(context).padding.bottom + 16,
                        left: 0,
                        right: 0,
                        child: Center(
                          child: TextButton(
                            onPressed: () {
                              // Handle delete story
                              Navigator.pop(context);
                            },
                            style: TextButton.styleFrom(
                              backgroundColor: Colors.red,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 24,
                                vertical: 12,
                              ),
                            ),
                            child: const Text(
                              'Delete story',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    // Positioned(
                    //   bottom: MediaQuery.of(context).padding.bottom + 16,
                    //   left: 16,
                    //   right: 16,
                    //   child: Row(
                    //     children: [
                    //       Expanded(
                    //         child: Container(
                    //           padding: const EdgeInsets.symmetric(horizontal: 16),
                    //           decoration: BoxDecoration(
                    //             color: Colors.white.withOpacity(0.2),
                    //             borderRadius: BorderRadius.circular(24),
                    //           ),
                    //           child: TextField(
                    //             style: const TextStyle(color: Colors.white),
                    //             decoration: InputDecoration(
                    //               hintText: 'Send a note...',
                    //               hintStyle:
                    //                   TextStyle(color: Colors.white.withOpacity(0.8)),
                    //               border: InputBorder.none,
                    //             ),
                    //           ),
                    //         ),
                    //       ),
                    //       const SizedBox(width: 8),
                    //       IconButton(
                    //         icon:
                    //             const Icon(Icons.favorite_border, color: Colors.white),
                    //         onPressed: () {},
                    //       ),
                    //     ],
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
            h0P4,
            Container(
              padding: EdgeInsets.symmetric(vertical: 8),
              color: AppColors.white,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: const TextField(
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          hintText: 'Send a note...',
                          hintStyle: TextStyle(color: AppColors.textGrey),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  // w0P5,
                  const Icon(Icons.favorite_border, color: AppColors.textGrey),
                  w2,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
