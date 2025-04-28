import 'package:flutter/material.dart';
import 'package:kulture/generated/assets.dart';
import 'package:kulture/constants/app_colors.dart';
import 'package:kulture/modules/home/model/post_model.dart';
import 'package:kulture/modules/home/pages/home_screen.dart';
import 'package:kulture/modules/home/widgets/post_cart.dart';
import 'package:kulture/modules/profile/pages/your_profile_screen.dart';

class InfinityScrollingPhotos extends StatefulWidget {
  const InfinityScrollingPhotos({super.key});

  @override
  State<InfinityScrollingPhotos> createState() =>
      _InfinityScrollingPhotosState();
}

class _InfinityScrollingPhotosState extends State<InfinityScrollingPhotos> {
  final ScrollController _scrollController = ScrollController();
  final List<PhotoPost> _posts = [];
  bool _isLoading = false;
  int _page = 1;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _loadMorePosts();
    _scrollController.addListener(_scrollListener);
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _buildTabItem({required IconData icon, required int index}) {
    final isSelected = _selectedIndex == index;
    return InkWell(
      onTap: () {
        setState(() {
          _selectedIndex = index;
          _onItemTapped(index);
        });
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: isSelected ? Colors.black : AppColors.textGrey,
          ),
          if (isSelected)
            Container(
              margin: const EdgeInsets.only(top: 4),
              width: 6,
              height: 6,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black,
              ),
            ),
        ],
      ),
    );
  }

  void _scrollListener() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      _loadMorePosts();
    }
  }

  Future<void> _loadMorePosts() async {
    if (_isLoading) return;

    setState(() {
      _isLoading = true;
    });

    final List<String> assetImages = [
      Assets.pngImage1,
      Assets.pngImage2,
      Assets.pngImage3,
      Assets.pngImage4,
      // Add more as needed
    ];
    // Simulate API call with dummy data
    await Future.delayed(const Duration(seconds: 2));
    final newPosts = List.generate(
      10,
      (index) => PhotoPost(
        username: 'user${_page * index}',
        imageUrl: assetImages[index % assetImages.length],
        likes: (100 + index * 24),
        caption: 'Taking life one step at a time, embracing every moment...',
      ),
    );

    setState(() {
      _posts.addAll(newPosts);
      _page++;
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Image.asset(Assets.backIcon, width: 24, height: 24),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: GestureDetector(
         onHorizontalDragEnd: (details) {
              // If swiped right (positive velocity)
              if (details.primaryVelocity! > 0) {
                // Navigate to the HomeScreen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );
              }
              // If swiped left (negative velocity)
              else if (details.primaryVelocity! < 0) {
                // Navigate to the YourProfileScreen
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const YourProfileScreen()),
                );
              }
            },
        child: ListView.builder(
          controller: _scrollController,
          itemCount: _posts.length + 1,
          itemBuilder: (context, index) {
            // if (index == _posts.length) {
            //   return _isLoading
            //       ? const Center(
            //           child: Padding(
            //             padding: EdgeInsets.all(16.0),
            //             child: CircularProgressIndicator(color: Colors.black),
            //           ),
            //         )
            //       : const SizedBox();
            // }
        
            final post = _posts[index];
            return PostCard(post: post);
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
