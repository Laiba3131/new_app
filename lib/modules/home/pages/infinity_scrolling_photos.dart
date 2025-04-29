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
  final List<PhotoPost> _posts = [];
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _loadAllPosts();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _loadAllPosts() {
    final List<String> assetImages = [
      Assets.pngImage1,
      Assets.pngImage2,
      Assets.pngImage3,
      Assets.pngImage4,
      // Add more as needed
    ];

    _posts.addAll(List.generate(
      40, // Load as many as you want
      (index) => PhotoPost(
        username: 'user$index',
        imageUrl: assetImages[index % assetImages.length],
        likes: 100 + index * 24,
        caption: 'Taking life one step at a time, embracing every moment...',
      ),
    ));
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
          if (details.primaryVelocity! > 0) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
            );
          } else if (details.primaryVelocity! < 0) {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const YourProfileScreen()),
            );
          }
        },
        child: ListView.builder(
          itemCount: _posts.length,
          itemBuilder: (context, index) {
            final post = _posts[index];
            return PostCard(post: post);
          },
        ),
      ),
    );
  }
}
