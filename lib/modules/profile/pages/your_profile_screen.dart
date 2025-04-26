import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kulture/config/config.dart';
import 'package:kulture/constants/app_colors.dart';
import 'package:kulture/generated/assets.dart';
import 'package:kulture/modules/dashboard/pages/dashboard_persistent_bottom_bar.dart';
import 'package:kulture/modules/profile/pages/dummy_data.dart';
import 'package:kulture/modules/profile/pages/edit_profile_screen.dart';
import 'package:kulture/modules/profile/widgets/friends_tab.dart';
import 'package:kulture/modules/profile/widgets/profile_header_row.dart';
import 'package:kulture/modules/profile/widgets/profile_status_row.dart';
import 'package:kulture/modules/settings/pages/settings_screen.dart';
import 'package:kulture/ui/button/primary_button.dart';
import 'package:kulture/utils/heights_and_widths.dart';
import '../../home/widgets/vedio_tab.dart';
import '../widgets/switch_tab_item.dart';
import 'package:kulture/modules/notes/pages/notes_screen.dart';

class YourProfileScreen extends StatefulWidget {
  const YourProfileScreen({Key? key}) : super(key: key);

  @override
  State<YourProfileScreen> createState() => _YourProfileScreenState();
}

class _YourProfileScreenState extends State<YourProfileScreen>
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
        appBar: AppBar(
          backgroundColor: AppColors.white,
          elevation: 0,
          centerTitle: false,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: AppColors.black),
            onPressed: () {
              NavRouter.pushFromRoot(
                  context, const DashboardPersistentBottomBar());
            },
          ),
          title: const Text("Back",
              style: TextStyle(
                  color: AppColors.black, fontWeight: FontWeight.w400)),
          titleSpacing: 0,
          actions: [
            InkWell(
              onTap: () {
                NavRouter.pushFromRoot(context, const NotesScreen());
              },
              child: Stack(
                alignment: Alignment.center,
                children: [
                  const Icon(Icons.message,
                      color: Color.fromARGB(255, 28, 24, 24)),
                  Positioned(
                    right: 0,
                    top: 10,
                    child: Container(
                      padding: const EdgeInsets.all(2),
                      decoration: const BoxDecoration(
                        color: AppColors.red,
                        shape: BoxShape.circle,
                      ),
                      constraints: const BoxConstraints(
                        minWidth: 12,
                        minHeight: 12,
                      ),
                      child: const Text(
                        '5',
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 8,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            w2,
            InkWell(
              onTap: () {
                // NavRouter.pushFromRoot(context, const StoriesScreen());
              },
              child: Stack(
                alignment: Alignment.center,
                children: [
                  SvgPicture.asset(Assets.activeIcon),
                  // const Icon(Icons.shopping_bag_outlined, color: AppColors.black),
                  Positioned(
                    right: 0,
                    top: 0,
                    child: Container(
                      padding: const EdgeInsets.all(2),
                      decoration: const BoxDecoration(
                        color: AppColors.red,
                        shape: BoxShape.circle,
                      ),
                      constraints: const BoxConstraints(
                        minWidth: 8,
                        minHeight: 8,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
              icon: SvgPicture.asset(Assets.svgHamburger),
              onPressed: () {
                NavRouter.pushFromRoot(
                  context,
                  const SettingsScreen(),
                );
              },
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
                      name: 'Tiny Boss',
                      username: 'Tinybosshq',
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
                            child: PrimaryButton(
                          height: 43,
                          onPressed: () {
                            NavRouter.pushFromRoot(
                                context, const EditProfileScreen());
                          },
                          title: 'Edit profile',
                          shadowColor: AppColors.transparent,
                          backgroundColor: AppColors.primaryColor,
                          titleColor: AppColors.white,
                          hMargin: 0,
                        )),
                        w1,
                        Expanded(
                            child: PrimaryButton(
                          height: 43,
                          onPressed: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) => const NotesScreen(),
                            //   ),
                            // );
                          },
                          title: 'Share profile',
                          shadowColor: AppColors.transparent,
                          backgroundColor: AppColors.primaryColor,
                          titleColor: AppColors.white,
                          hMargin: 0,
                        )),
                      ],
                    ),
                  ],
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
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      height: 600,
                      child: TabBarView(
                        controller: _tabController,
                        children: [
                          const VideoGridWidget(
                              itemCount: 14, isIconTrue: false),
                          // Stitch Tab Content
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
