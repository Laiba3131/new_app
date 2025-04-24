// import 'package:flutter/material.dart';
// import 'package:kulture/constants/app_colors.dart';
// import 'package:kulture/core/service/bottm_sheet_service.dart';
// import 'package:kulture/modules/activity/pages/activity_screen.dart';
// import 'package:kulture/modules/home/pages/infinity_scrolling_screen.dart';
// import 'package:kulture/modules/profile/pages/your_profile_screen.dart';
// import 'package:kulture/modules/search/pages/search_screen.dart';
// import 'package:kulture/ui/bottom_bar_visibility_provider.dart';

// class DashboardScreen extends StatefulWidget {
//   const DashboardScreen({Key? key}) : super(key: key);

//   @override
//   State<DashboardScreen> createState() => _DashboardScreenState();
// }

// class _DashboardScreenState extends State<DashboardScreen> {
//   final PageController pageController = PageController(initialPage: 0);
//   int _selectedIndex = 0;
//   final _visibilityProvider = BottomBarVisibilityProvider();
//   bool _showBottomBar = true;

//   final List<Widget> _screens = [
//     const InfinityScrollingScreen(),
//     const SearchScreen(),
//     const ActivityScreen(),
//     const YourProfileScreen(),
//   ];

//   @override
//   void initState() {
//     super.initState();
//     _visibilityProvider.addListener(_updateVisibility);
//     _showBottomBar = _visibilityProvider.isVisible;
//   }

//   @override
//   void dispose() {
//     _visibilityProvider.removeListener(_updateVisibility);
//     super.dispose();
//   }

//   void _updateVisibility() {
//     setState(() {
//       _showBottomBar = _visibilityProvider.isVisible;
//     });
//   }

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//     pageController.jumpToPage(index);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       extendBody: true,
//       body: _screens[_selectedIndex],
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//       floatingActionButton: _showBottomBar
//           ? Container(
//               height: 70,
//               width: 70,
//               decoration: BoxDecoration(
//                 shape: BoxShape.circle,
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.black.withOpacity(0.1),
//                     blurRadius: 12,
//                     spreadRadius: 2,
//                   ),
//                 ],
//               ),
//               child: FloatingActionButton(
//                 backgroundColor: Colors.white,
//                 onPressed: () {
//                   BottomSheetService.showCommentSheet(context);
//                 },
//                 elevation: 0,
//                 child: const Icon(
//                   Icons.add,
//                   color: AppColors.textGrey,
//                   size: 30,
//                 ),
//               ),
//             )
//           : null,
//       bottomNavigationBar: _showBottomBar
//           ? PhysicalModel(
//               color: Colors.transparent,
//               elevation: 8,
//               shadowColor: Colors.black,
//               clipBehavior: Clip.antiAlias,
//               child: BottomAppBar(
//                 shape: const CircularNotchedRectangle(),
//                 notchMargin: 8,
//                 color: Colors.white,
//                 elevation: 10,
//                 child: SizedBox(
//                   height: 60,
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceAround,
//                     children: [
//                       _buildTabItem(icon: Icons.home_outlined, index: 0),
//                       _buildTabItem(icon: Icons.search, index: 1),
//                       const SizedBox(width: 48), // gap for FAB notch
//                       _buildTabItem(
//                           icon: Icons.favorite_border_outlined, index: 2),
//                       _buildTabItem(
//                           icon: Icons.account_circle_outlined, index: 3),
//                     ],
//                   ),
//                 ),
//               ),
//             )
//           : null,
//     );
//   }

//   Widget _buildTabItem({required IconData icon, required int index}) {
//     final isSelected = _selectedIndex == index;
//     return InkWell(
//       onTap: () {
//         setState(() {
//           _selectedIndex = index;
//           _onItemTapped(index);
//           pageController.jumpToPage(index);
//         });
//       },
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Icon(
//             icon,
//             color: isSelected ? Colors.black : AppColors.textGrey,
//           ),
//           if (isSelected)
//             Container(
//               margin: const EdgeInsets.only(top: 4),
//               width: 6,
//               height: 6,
//               decoration: const BoxDecoration(
//                 shape: BoxShape.circle,
//                 color: Colors.black,
//               ),
//             ),
//         ],
//       ),
//     );
//   }
// }
