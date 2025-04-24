import 'package:flutter/material.dart';
import 'package:kulture/constants/app_colors.dart';
import 'package:kulture/generated/assets.dart';
import 'package:kulture/modules/profile/widgets/friend_list_item.dart';
import 'package:kulture/ui/button/primary_button.dart';
import 'package:kulture/ui/input/input_field.dart';
import 'package:kulture/utils/extensions/extended_context.dart';
import 'package:kulture/utils/heights_and_widths.dart';

class FriendsTabWidget extends StatefulWidget {
  final TextEditingController searchController;
  final TabController tabController;
  final List<Map<String, String>> friends;
  final List<Map<String, String>> suggestedFriends;

  const FriendsTabWidget({
    super.key,
    required this.searchController,
    required this.tabController,
    required this.friends,
    required this.suggestedFriends,
  });

  @override
  State<FriendsTabWidget> createState() => _FriendsTabWidgetState();
}

class _FriendsTabWidgetState extends State<FriendsTabWidget> {
  int _selectedSubTab = 0; // 0 for Following, 1 for Followers

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        h1,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  _selectedSubTab = 0;
                });
              },
              child: Column(
                children: [
                  Text(
                    'Following',
                    style: context.textTheme.bodyMedium?.copyWith(
                      color: _selectedSubTab == 0 ? Colors.black : Colors.grey,
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  // if (_selectedSubTab == 0)
                  //   Container(
                  //     margin: const EdgeInsets.only(top: 4),
                  //     height: 2,
                  //     width: 65,
                  //     color: Colors.black,
                  //   ),
                ],
              ),
            ),
            w5,
            GestureDetector(
              onTap: () {
                setState(() {
                  _selectedSubTab = 1;
                });
              },
              child: Column(
                children: [
                  Text(
                    'Followers',
                    style: context.textTheme.bodyMedium?.copyWith(
                      color: _selectedSubTab == 1 ? Colors.black : Colors.grey,
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  // if (_selectedSubTab == 1)
                  //   Container(
                  //     margin: const EdgeInsets.only(top: 4),
                  //     height: 2,
                  //     width: 65,
                  //     color: Colors.black,
                  //   ),
                ],
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
          child: InputField(
            controller: TextEditingController(),
            label: 'Search...',
            borderRadius: 17,
            fillColor: AppColors.searchBarColor,
            prefixIcon: const Icon(
              Icons.search,
              color: AppColors.textGrey,
            ),
            boxConstraints: 50,
          ),
        ),
        Expanded(
          child: _selectedSubTab == 0
              ? _buildFollowingList()
              : _buildFollowersList(),
        ),
      ],
    );
  }

  Widget _buildFollowingList() {
    return ListView(
      children: [
        ...widget.friends.map((friend) => FriendListItem(
              name: friend['name']!,
              username: friend['username']!,
              avatarUrl: friend['avatarUrl']!,
              onMessageTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Messaging ${friend['name']}')),
                );
              },
              onMoreTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('More options for ${friend['name']}')),
                );
              },
            )),

        // Suggested friends section
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Suggested for you',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'See all',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
        ...widget.suggestedFriends.map((friend) => Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 24,
                    backgroundImage: AssetImage(friend['avatarUrl']!),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(friend['name']!,
                            style: context.textTheme.bodySmall?.copyWith(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: AppColors.black)),
                        Text(friend['username']!,
                            style: context.textTheme.bodySmall?.copyWith(
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                                color: AppColors.textGrey)),
                      ],
                    ),
                  ),
                  PrimaryButton(
                    onPressed: () {},
                    title: 'Follow',
                    backgroundColor: AppColors.primaryColor,
                    borderRadius: 11,
                    height: 36,
                    width: 85,
                    shadowColor: AppColors.transparent,
                  ),
                  GestureDetector(
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Dismissed ${friend['name']}')),
                      );
                    },
                    child: Image.asset(
                      Assets.suggestCancel,
                      width: 20,
                      height: 20,
                    ),
                  ),
                ],
              ),
            )),
        h7,
      ],
    );
  }

  Widget _buildFollowersList() {
    // Currently showing the same list for followers as it's just a demo
    // In a real app, you would use a different list for followers
    return ListView(
      children: [
        ...widget.suggestedFriends.map((friend) => Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 24,
                    backgroundImage: AssetImage(friend['avatarUrl']!),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(friend['name']!,
                            style: context.textTheme.bodySmall?.copyWith(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: AppColors.black)),
                        Text(friend['username']!,
                            style: context.textTheme.bodySmall?.copyWith(
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                                color: AppColors.textGrey)),
                      ],
                    ),
                  ),
                  PrimaryButton(
                    onPressed: () {},
                    title: 'Follow',
                    backgroundColor: AppColors.primaryColor,
                    borderRadius: 11,
                    height: 36,
                    width: 85,
                    shadowColor: AppColors.transparent,
                  ),
                  GestureDetector(
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Dismissed ${friend['name']}')),
                      );
                    },
                    child: Image.asset(
                      Assets.suggestCancel,
                      width: 20,
                      height: 20,
                    ),
                  ),
                ],
              ),
            )),

        // Suggested friends section
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Suggested for you',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'See all',
                style: TextStyle(
                  color: AppColors.primaryColor,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
        ...widget.suggestedFriends.map((friend) => Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 24,
                    backgroundImage: AssetImage(friend['avatarUrl']!),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(friend['name']!,
                            style: context.textTheme.bodySmall?.copyWith(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: AppColors.black)),
                        Text(friend['username']!,
                            style: context.textTheme.bodySmall?.copyWith(
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                                color: AppColors.textGrey)),
                      ],
                    ),
                  ),
                  PrimaryButton(
                    onPressed: () {},
                    title: 'Follow',
                    backgroundColor: AppColors.primaryColor,
                    borderRadius: 11,
                    height: 36,
                    width: 85,
                    shadowColor: AppColors.transparent,
                  ),
                  GestureDetector(
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Dismissed ${friend['name']}')),
                      );
                    },
                    child: Image.asset(
                      Assets.suggestCancel,
                      width: 20,
                      height: 20,
                    ),
                  ),
                ],
              ),
            )),
        h7,
      ],
    );
  }
}
