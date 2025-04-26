import 'package:flutter/material.dart';
import 'package:kulture/constants/app_colors.dart';
import 'package:kulture/modules/activity/pages/activity_screen.dart';
import 'package:kulture/modules/home/pages/infinity_scrolling_screen.dart';
import 'package:kulture/modules/home/widgets/psoting_sheet.dart';
import 'package:kulture/modules/profile/pages/your_profile_screen.dart';
import 'package:kulture/modules/search/pages/search_screen.dart';
import 'package:kulture/ui/bottom_bar_visibility_provider.dart';
// import 'package:kulture/ui/layout/persistent_navigator.dart';
import 'package:kulture/ui/persistent_nav_router.dart';

class DashboardPersistentBottomBar extends StatefulWidget {
  const DashboardPersistentBottomBar({Key? key}) : super(key: key);

  @override
  State<DashboardPersistentBottomBar> createState() =>
      _DashboardPersistentBottomBarState();
}

class _DashboardPersistentBottomBarState
    extends State<DashboardPersistentBottomBar> {
  int _selectedIndex = 0;
  final _visibilityProvider = BottomBarVisibilityProvider();
  bool _showBottomBar = true;

  // Create persistent navigators for each tab to maintain their state
  final List<GlobalKey<NavigatorState>> _navigatorKeys = [
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
  ];

  final List<Widget> _screens = [
    const InfinityScrollingScreen(),
    const SearchScreen(),
    const ActivityScreen(),
    const YourProfileScreen(),
  ];

  @override
  void initState() {
    super.initState();
    _visibilityProvider.addListener(_updateVisibility);
    _showBottomBar = _visibilityProvider.isVisible;
  }

  @override
  void dispose() {
    _visibilityProvider.removeListener(_updateVisibility);
    super.dispose();
  }

  void _updateVisibility() {
    setState(() {
      _showBottomBar = _visibilityProvider.isVisible;
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final isFirstRouteInCurrentTab =
            !await _navigatorKeys[_selectedIndex].currentState!.maybePop();

        // If we're on the first route of the current tab, try to go back to the home tab
        if (isFirstRouteInCurrentTab && _selectedIndex != 0) {
          _onItemTapped(0);
          return false;
        }
        return isFirstRouteInCurrentTab;
      },
      child: Scaffold(
        extendBody: true,
        body: Stack(
          children: [
            _buildOffstageNavigator(0),
            _buildOffstageNavigator(1),
            _buildOffstageNavigator(2),
            _buildOffstageNavigator(3),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: _showBottomBar
            ? Container(
                height: 70,
                width: 70,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 12,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: FloatingActionButton(
                  backgroundColor: Colors.white,
                  onPressed: () {
                    PostingSheet.show(context, h2: const SizedBox());
                  },
                  elevation: 0,
                  child: const Icon(
                    Icons.add,
                    color: AppColors.textGrey,
                    size: 30,
                  ),
                ),
              )
            : null,
        bottomNavigationBar: _showBottomBar
            ? PhysicalModel(
                color: Colors.transparent,
                elevation: 8,
                shadowColor: Colors.black,
                clipBehavior: Clip.antiAlias,
                child: BottomAppBar(
                  shape: const CircularNotchedRectangle(),
                  notchMargin: 8,
                  color: Colors.white,
                  elevation: 10,
                  child: SizedBox(
                    height: 60,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _buildTabItem(icon: Icons.home_outlined, index: 0),
                        _buildTabItem(icon: Icons.search, index: 1),
                        const SizedBox(width: 48), // gap for FAB notch
                        _buildTabItem(
                            icon: Icons.favorite_border_outlined, index: 2),
                        _buildTabItem(
                            icon: Icons.account_circle_outlined, index: 3),
                      ],
                    ),
                  ),
                ),
              )
            : null,
      ),
    );
  }

  Widget _buildTabItem({required IconData icon, required int index}) {
    final isSelected = _selectedIndex == index;
    return InkWell(
      onTap: () => _onItemTapped(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon,
              color: isSelected ? Colors.black : AppColors.textGrey, size: 29),
          isSelected
              ? Container(
                  margin: const EdgeInsets.only(top: 2),
                  width: 6,
                  height: 6,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.black,
                  ),
                )
              : Container(
                  margin: const EdgeInsets.only(top: 2),
                  width: 6,
                  height: 6,
                ),
        ],
      ),
    );
  }

  Widget _buildOffstageNavigator(int index) {
    return Offstage(
      offstage: _selectedIndex != index,
      child: PersistentNavigator(
        navigatorKey: _navigatorKeys[index],
        initialRoute: _screens[index],
      ),
    );
  }
}
