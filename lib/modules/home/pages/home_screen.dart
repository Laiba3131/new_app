import 'package:flutter/material.dart';
import 'package:kulture/modules/home/widgets/trending_grid.dart';
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
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: TabBar(
                  indicator: null,
                  // labelColor: Colors.black,
                  // // unselectedLabelColor: Colors.grey,
                  // indicatorColor: Colors.blue,
                  // indicatorWeight: 3,
                  // indicatorSize: TabBarIndicatorSize.label,
                  tabs: [
                    Tab(text: 'Trending'),
                    Tab(text: 'Videos'),
                    Tab(text: 'Photos'),
                    Tab(text: 'Stitch'),
                  ],
                ),
              ),

              // Tab Bar View
              Expanded(
                child: TabBarView(
                  children: [
                    const TrendingGrid(),
                    const VideoGridWidget(
                      itemCount: 14,
                      isIconTrue: true,
                    ),
                    const PhotoTab(
                      itemCount: 14,
                    ),
                    StitchTab(),
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
