import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kulture/constants/app_colors.dart';
import 'package:kulture/generated/assets.dart';
import 'package:kulture/modules/profile/model/suggested_user_model.dart';
import 'package:kulture/modules/profile/pages/dummy_data.dart';
import 'package:kulture/modules/profile/widgets/friends_tab.dart';
import 'package:kulture/modules/profile/widgets/profile_header_row.dart';
import 'package:kulture/modules/profile/widgets/profile_status_row.dart';
import 'package:kulture/modules/profile/widgets/suggested_user_card.dart';
import 'package:kulture/ui/button/primary_button.dart';
import 'package:kulture/ui/widgets/custom_appbar.dart';
import 'package:kulture/utils/heights_and_widths.dart';
import '../../home/widgets/vedio_tab.dart';
import '../widgets/switch_tab_item.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({Key? key}) : super(key: key);

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final TextEditingController _searchController = TextEditingController();

  final String profileImageUrl = Assets.pngImage1;

  // Sample friends data
  final friends = DummyData.friends;
  final suggestedFriends = DummyData.suggestedFriends;
  final posts = DummyData.posts;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  List<SuggestedUser> users = DummyData.users;
  @override
  void dispose() {
    _tabController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      bottom: false,
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: const CustomAppbar(
          title: 'Back',
          showBack: true,
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 10.0),
              child: Icon(Icons.more_horiz, color: AppColors.black),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ProfileHeaderRow(
                      name: 'Khole K.',
                      username: 'Misskhole',
                      bio:
                          'Love is in the little things—warm hugs, sweet texts, and feeling safe in someone\'s arms. What\'s love to you?💕',
                      profileImageUrl: profileImageUrl,
                    ),
                    h2,
                    ProfileStatusRow(
                      followingText: "600 following",
                      followersText: "4.6M followers",
                      website: "google.com",
                      onWebsiteTap: () {},
                    ),
                    h1,
                    Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: PrimaryButton(
                            hMargin: 0,
                            height: 43,
                            width: 165,
                            onPressed: () {},
                            title: 'Follow/Unfollow',
                            titleColor: AppColors.white,
                            backgroundColor: AppColors.blue,
                            fontSize: 14,
                            shadowColor: AppColors.transparent,
                          ),
                        ),
                        w1,
                        Expanded(
                          flex: 2,
                          child: PrimaryButton(
                            height: 43,
                            hMargin: 0,
                            width: 165,
                            onPressed: () {},
                            title: 'Notes',
                            backgroundColor: AppColors.white,
                            bborderColor: AppColors.black,
                            titleColor: AppColors.black,
                            shadowColor: AppColors.transparent,
                          ),
                        ),
                        w1,
                        Expanded(
                          flex: 1,
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            height: 43,
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(10),
                              border:
                                  Border.all(color: AppColors.black, width: 1),
                            ),
                            child: SvgPicture.asset(
                              Assets.person,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              h2,
              SizedBox(
                height: 185,
                child: ListView.separated(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  scrollDirection: Axis.horizontal,
                  itemCount: users.length,
                  itemBuilder: (context, index) {
                    return SuggestedUserCard(user: users[index]);
                  },
                  separatorBuilder: (context, index) =>
                      const SizedBox(width: 12),
                ),
              ),
              h2,
              DefaultTabController(
                length: 3,
                child: Column(
                  children: [
                    TabBar(
                      controller: _tabController,
                      labelColor: Colors.black,
                      unselectedLabelColor: Colors.grey,
                      indicatorColor: Colors.black,
                      tabs: const [
                        Tab(text: "PicVids"),
                        Tab(text: "Stitch"),
                        Tab(text: "Friends"),
                      ],
                    ),
                    SizedBox(
                      height: 600,
                      child: TabBarView(
                        controller: _tabController,
                        children: [
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 12.0),
                            child: VideoGridWidget(itemCount: 14),
                          ),
                          ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: posts.length,
                            itemBuilder: (context, index) {
                              return SwitchTabItem(
                                post: posts[index],
                                profileImageUrl: Assets.pngImage5,
                              );
                            },
                          ),
                          // Padding(
                          //   padding: const EdgeInsets.all(8.0),
                          //   child: InputField(controller: TextEditingController(), label: 'Search'),
                          // )
                          FriendsTabWidget(
                            searchController: _searchController,
                            tabController: _tabController,
                            friends: friends,
                            suggestedFriends: suggestedFriends,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
