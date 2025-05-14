import 'package:flutter/material.dart';
import 'package:kulture/constants/app_colors.dart';
import 'package:kulture/modules/home/widgets/trending_grid.dart';
import 'package:kulture/utils/extensions/extended_context.dart';
import '../widgets/photo_tab.dart';
import '../widgets/stitch_tab.dart';
import '../widgets/vedio_tab.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: SafeArea(
        top: true,
        bottom: false,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              // Tab Bar
               TabBar(
                 padding: const EdgeInsets.only(bottom: 2),
                 indicatorColor: AppColors.primaryColor,
                 dividerColor: AppColors.transparent,
                 indicatorWeight: 2,
                 indicatorSize: TabBarIndicatorSize.tab,
                 indicatorPadding: const EdgeInsets.symmetric(horizontal: 5,vertical: 0),
                 labelStyle:  context.textTheme.bodySmall?.copyWith(
                   color: AppColors.black,
                   fontWeight: FontWeight.w400,
                   fontSize: 14,
                 ),
                 unselectedLabelStyle:  context.textTheme.bodySmall?.copyWith(
                   color: AppColors.textGrey,
                   fontWeight: FontWeight.w400,
                   fontSize: 14,
                 ),
                 tabs: const [
                   Tab(text: 'Trending'),
                   Tab(text: 'Videos'),
                   Tab(text: 'Photos'),
                   Tab(text: 'Stitch'),
                 ],
               ),

              // Tab Bar View
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: TabBarView(
                    children: [
                      const TrendingGrid(),
                      const VideoGridWidget(
                        itemCount: 14,
                        isIconTrue: true,
                      ),
                       const PhotoTab(
                        itemCount: 15,
                        
                      ),
                      StitchTab(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
