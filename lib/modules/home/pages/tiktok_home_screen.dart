// import 'package:flutter/material.dart';
// import 'package:kulture/constants/app_colors.dart';
// import 'package:kulture/generated/assets.dart';
// import 'package:kulture/modules/home/pages/infinity_scrolling_photos.dart';

// class TikTokHomeScreen extends StatefulWidget {
//   static const String routeName = '/tiktok-home';
//   const TikTokHomeScreen({super.key});

//   @override
//   State<TikTokHomeScreen> createState() => _TikTokHomeScreenState();
// }

// class _TikTokHomeScreenState extends State<TikTokHomeScreen> with SingleTickerProviderStateMixin {
//   int _currentPage = 0;

//   // Animation controller for swipe hint
//   late AnimationController _swipeHintController;
//   late Animation<Offset> _swipeHintAnimation;

//   @override
//   void initState() {
//     super.initState();

//     // Setup swipe hint animation
//     _swipeHintController = AnimationController(
//       vsync: this,
//       duration: const Duration(seconds: 1),
//     );

//     _swipeHintAnimation = Tween<Offset>(
//       begin: Offset.zero,
//       end: const Offset(0.2, 0.0),
//     ).animate(CurvedAnimation(
//       parent: _swipeHintController,
//       curve: Curves.easeInOut,
//     ));

//     // Show swipe hint briefly after screen loads
//     Future.delayed(const Duration(milliseconds: 300), () {
//       _swipeHintController.forward().then((_) {
//         _swipeHintController.reverse();
//       });
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       // Add horizontal drag gesture handler
//       onHorizontalDragEnd: (details) {
//         // If swiped right (positive velocity)
//         if (details.primaryVelocity! > 0) {
//           // Navigate to the InfinityScrollingPhotos screen
//           Navigator.push(
//             context,
//             MaterialPageRoute(builder: (context) => const InfinityScrollingPhotos()),
//           );
//         }
//       },
//       child: SlideTransition(
//         position: _swipeHintAnimation,
//         child: Scaffold(
//           backgroundColor: Colors.black,
//           appBar: AppBar(
//             backgroundColor: Colors.black,
//             titleSpacing: 0,
//             title: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 _buildTabButton(0, 'Following'),
//                 const SizedBox(width: 20),
//                 _buildTabButton(1, 'For You'),
//               ],
//             ),
//             actions: [
//               IconButton(
//                 icon: const Icon(Icons.search, color: Colors.white),
//                 onPressed: () {},
//               ),
//             ],
//           ),
//           body: Center(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 const Text(
//                   'TikTok-style Video Feed',
//                   style: TextStyle(color: Colors.white, fontSize: 20),
//                 ),
//                 const SizedBox(height: 20),
//                 const Text(
//                   'Swipe right to view Photos',
//                   style: TextStyle(color: Colors.white70, fontSize: 16),
//                 ),
//                 const SizedBox(height: 40),
//                 Icon(
//                   Icons.swipe,
//                   color: Colors.white,
//                   size: 100,
//                 ),
//               ],
//             ),
//           ),
//           bottomNavigationBar: BottomNavigationBar(
//             backgroundColor: Colors.black,
//             selectedItemColor: Colors.white,
//             unselectedItemColor: Colors.grey,
//             type: BottomNavigationBarType.fixed,
//             items: const [
//               BottomNavigationBarItem(
//                 icon: Icon(Icons.home),
//                 label: 'Home',
//               ),
//               BottomNavigationBarItem(
//                 icon: Icon(Icons.search),
//                 label: 'Discover',
//               ),
//               BottomNavigationBarItem(
//                 icon: Icon(Icons.add_box_outlined),
//                 label: 'Create',
//               ),
//               BottomNavigationBarItem(
//                 icon: Icon(Icons.inbox_outlined),
//                 label: 'Inbox',
//               ),
//               BottomNavigationBarItem(
//                 icon: Icon(Icons.person_outline),
//                 label: 'Me',
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildTabButton(int index, String title) {
//     return GestureDetector(
//       onTap: () {
//         setState(() {
//           _currentPage = index;
//         });
//       },
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Text(
//             title,
//             style: TextStyle(
//               color: _currentPage == index
//                   ? Colors.white
//                   : AppColors.textGrey,
//               fontWeight:
//                   _currentPage == index ? FontWeight.bold : FontWeight.normal,
//             ),
//           ),
//           const SizedBox(height: 4),
//           if (_currentPage == index)
//             Container(
//               width: 6,
//               height: 6,
//               decoration: const BoxDecoration(
//                 color: Colors.white,
//                 shape: BoxShape.circle,
//               ),
//             ),
//         ],
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     _swipeHintController.dispose();
//     super.dispose();
//   }
// }
