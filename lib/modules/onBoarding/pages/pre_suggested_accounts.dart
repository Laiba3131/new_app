import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kulture/modules/dashboard/pages/dashboard_screen.dart';
import 'package:kulture/modules/search/cubit/search_state.dart';
import 'package:kulture/modules/search/widgets/follow_tile_widget.dart';
import 'package:kulture/ui/button/primary_button.dart';
import 'package:kulture/modules/dashboard/pages/dashboard_persistent_bottom_bar.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter/services.dart';
import 'package:kulture/utils/heights_and_widths.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/app_text_styles.dart';
import '../../../generated/assets.dart';
import '../../search/cubit/search_cubit.dart';

class SuggestedCreatorScreen extends StatefulWidget {
  const SuggestedCreatorScreen({super.key});

  @override
  State<SuggestedCreatorScreen> createState() => _SuggestedCreatorScreenState();
}

class _SuggestedCreatorScreenState extends State<SuggestedCreatorScreen> {
  Map<String, bool> followingStatus = {};
  bool isFollowingAll = false;
  List<String> creatorNames = [
    "Queenbee",
    "Ashleybacker",
    "BeeQueen",
    "CindyPat",
    "CindyPat",
    "CindyPat"
  ];

  void toggleFollowAll() {
    setState(() {
      isFollowingAll = !isFollowingAll;
      for (var name in creatorNames) {
        followingStatus[name] = isFollowingAll;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark,
        ),
        title: Row(
          children: [
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Row(
                children: [
                  Image.asset(Assets.backIcon, height: 24),
                  w0P5,
                  const Text(
                    'Back',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DashboardPersistentBottomBar(),
                  ),
                );
              },
              child: Row(
                children: [
                  const Text(
                    'Skip',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  w0P5,
                  Image.asset(Assets.skipIcon, height: 16),
                ],
              ),
            ),
          ],
        ),
        centerTitle: false,
      ),
      body: BlocBuilder<SearchCubit, SearchState>(
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              h2,
              Center(
                child: Text(
                  "Suggested Creator\non Kultureapp",
                  textAlign: TextAlign.center,
                  style: AppTextStyles.robotoBold(fontSize: 20.sp),
                ),
              ),
              SizedBox(height: 1.h),
              Center(
                child: Text(
                  "Here is some suggestions in mind",
                  textAlign: TextAlign.center,
                  style: AppTextStyles.interRegular(
                      color: AppColors.textGrey, fontSize: 15.sp),
                ),
              ),
              h2,
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 12),
                padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: const Color(0xFFD4D4D4),
                    width: 1,
                  ),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Search...",
                    hintStyle: AppTextStyles.interRegular(
                        color: AppColors.hintTextGrey, fontSize: 15.sp),
                    border: InputBorder.none,
                    icon: const Icon(Icons.search,
                        color: Color(0xFFD4D4D4), size: 17.5),
                    isDense: true,
                    contentPadding: EdgeInsets.symmetric(vertical: 0.4.h),
                    filled: true,
                    fillColor: AppColors.white,
                  ),
                  style: AppTextStyles.interRegular(fontSize: 15.sp),
                ),
              ),
              h2,
              Expanded(
                child: ListView.separated(
                  itemCount: state.suggestedUsers.length,
                  separatorBuilder: (context, index) => const Padding(
                    padding: EdgeInsets.only(left: 75.0),
                    child: Divider(
                      height: 1,
                      thickness: 0.5,
                      color: AppColors.lightGreyColor,
                    ),
                  ),
                  itemBuilder: (context, index) {
                    final user = state.suggestedUsers[index];
                    return UserProfileTile(user: user);
                  },
                ),
              ),
              h1,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: PrimaryButton(
                    height: 45,
                    vMargin: 0,
                    hMargin: 0,
                    onPressed: () {},
                    title: 'Follow all',
                    backgroundColor: AppColors.primaryColor,
                    titleColor: AppColors.white,
                    borderRadius: 18,
                    shadowColor: AppColors.transparent),
              ),
              h1,
            ],
          );
        },
      ),
    );
  }
}
