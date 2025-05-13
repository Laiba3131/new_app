import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kulture/config/routes/nav_router.dart';
import 'package:kulture/constants/app_colors.dart';
import 'package:kulture/core/service/bottm_sheet_service.dart';
import 'package:kulture/generated/assets.dart';
import 'package:kulture/modules/notes/pages/chat_screen.dart';
import 'package:kulture/modules/profile/model/suggested_user_model.dart';
import 'package:kulture/modules/profile/pages/dummy_data.dart';
import 'package:kulture/modules/profile/widgets/friends_tab.dart';
import 'package:kulture/modules/profile/widgets/profile_header_row.dart';
import 'package:kulture/modules/profile/widgets/profile_status_row.dart';
import 'package:kulture/modules/profile/widgets/suggested_user_card.dart';
import 'package:kulture/ui/button/primary_button.dart';
import 'package:kulture/utils/heights_and_widths.dart';
import '../../home/widgets/vedio_tab.dart';
import '../widgets/switch_tab_item.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final TextEditingController _searchController = TextEditingController();

  final String profileImageUrl = Assets.pngImage1;
  bool isFollow = true;
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


bool isShow=true;
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
          leading: InkWell(
              onTap: () {
                NavRouter.pop(context);
              },
              child: const Icon(
                Icons.arrow_back_ios,
                color: AppColors.black,
                size: 17,
              )),
          title: const Text("Back",
              style: TextStyle(
                  fontSize: 19,
                  color: AppColors.black,
                  fontWeight: FontWeight.w400)),
          titleSpacing: 0,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: InkWell(
                  onTap: () async {
                    BottomSheetService.showUserBottomSheet(context);
                  },
                  child: SvgPicture.asset(Assets.moreOptions,
                      color: AppColors.black)),
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
                            onPressed: () {
                              setState(() {
                                isFollow = !isFollow;
                              });
                            },
                            title: isFollow ? 'Follow' : 'Unfollow',
                            titleColor: AppColors.white,
                            backgroundColor: AppColors.primaryColor,
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
                            onPressed: () {
                              NavRouter.push(
                                context,
                                const ChatScreen(
                                  name: 'Khole K.',
                                  username: 'Khole K.',
                                  profileImage: Assets.pngImage1,
                                ),
                              );
                            },
                            title: 'Notes',
                            backgroundColor: AppColors.white,
                            bborderColor: AppColors.searchBarColor,
                            titleColor: AppColors.black,
                            shadowColor: AppColors.transparent,
                          ),
                        ),
                        w1,
                        Expanded(
                          flex: 1,
                          child: InkWell(
                            onTap: (){
                              setState(() {
                                isShow=!isShow;
                              });
                            },
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              height: 43,
                              decoration: BoxDecoration(
                                color: AppColors.white,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    color: AppColors.searchBarColor, width: 1),
                              ),
                              child: SvgPicture.asset(
                                Assets.person,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              h2,
              users.isNotEmpty && isShow
                  ? SizedBox(
                      height: 190,
                      child: ListView.separated(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        scrollDirection: Axis.horizontal,
                        itemCount: users.length,
                        itemBuilder: (context, index) {
                          return SuggestedUserCard(
                              user: users[index],
                              onDismiss: () {
                                setState(() {
                                  users.removeAt(index);
                                });
                              });
                        },
                        separatorBuilder: (context, index) =>
                            const SizedBox(width: 12),
                      ),
                    )
                  : const SizedBox.shrink(),
              DefaultTabController(
                length: 3,
                child: Column(
                  children: [
                    TabBar(
                      controller: _tabController,
                      labelColor: Colors.black,
                      unselectedLabelColor: Colors.grey,
                      indicatorColor: AppColors.primaryColor,
                      indicatorSize: TabBarIndicatorSize.tab,
                      indicatorPadding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 0),
                      dividerColor: AppColors.lightGreyColor,
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
