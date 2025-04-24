import 'package:flutter/material.dart';
import 'package:kulture/config/config.dart';
import 'package:kulture/constants/app_colors.dart';
import 'package:kulture/generated/assets.dart';
import 'package:kulture/modules/stories/models/story_model.dart';
import 'package:kulture/modules/stories/pages/story_view_screen.dart';
import 'package:kulture/ui/widgets/custom_appbar.dart';
import 'package:kulture/utils/extensions/extended_context.dart';

class StoriesScreen extends StatelessWidget {
  const StoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Dummy data...
    final List<StoryUser> storyUsers = [
      StoryUser(
        username: 'Your story',
        imageUrl: Assets.pngImage1,
        stories: [],
        hasUnviewedStories: false,
      ),
      StoryUser(
        username: 'dj.foof',
        imageUrl: Assets.pngImage1,
        stories: [
          Story(
            id: '1',
            username: 'dj.foof',
            imageUrl: Assets.pngImage1,
            timeAgo: '1h ago',
          ),
          Story(
            id: '2',
            username: 'dj.foof',
            imageUrl: Assets.pngImage1,
            timeAgo: '1h ago',
          ),
        ],
      ),
      StoryUser(
        username: 'raileyboogie',
        imageUrl: Assets.pngImage1,
        stories: [
          Story(
            id: '2',
            username: 'raileyboogie',
            imageUrl: Assets.pngImage1,
            timeAgo: '2h ago',
          ),
        ],
      ),
      // Add more users here
    ];

    return Scaffold(
      appBar: const CustomAppbar(
        title: 'Stories',
        showBack: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search...',
                  prefixIcon: const Icon(Icons.search),
                  filled: true,
                  fillColor: Colors.grey[100],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 0.75,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                itemCount: storyUsers.length,
                itemBuilder: (context, index) {
                  final user = storyUsers[index];
                  return GestureDetector(
                    onTap: () {
                      if (index == 0) {
                        // Add new story
                      } else {
                        NavRouter.pushFromRoot(
                          context,
                          StoryViewScreen(
                            stories: user.stories,
                            initialStoryIndex: 0,
                          ),
                        );
                      }
                    },
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            Container(
                              width: 80,
                              height: 80,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: user.hasUnviewedStories
                                      ? Colors.red
                                      : Colors.transparent,
                                  width: 2,
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(2),
                                child: CircleAvatar(
                                  backgroundImage: AssetImage(user.imageUrl),
                                ),
                              ),
                            ),
                            if (index == 0)
                              Positioned(
                                bottom: 0,
                                right: 0,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: AppColors.black,
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: Colors.white,
                                      width: 2,
                                    ),
                                  ),
                                  child: const Icon(
                                    Icons.add,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                ),
                              ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Text(
                          user.username,
                          style: context.textTheme.bodyMedium?.copyWith(
                            color: AppColors.black,
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
