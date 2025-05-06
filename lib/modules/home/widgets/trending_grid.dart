import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kulture/generated/assets.dart';

class TrendingGrid extends StatefulWidget {
  const TrendingGrid({super.key});

  @override
  State<TrendingGrid> createState() => _TrendingGridState();
}

class _TrendingGridState extends State<TrendingGrid> {
  final List<TrendingItem> _items = [];
  final ScrollController _scrollController = ScrollController();
  bool _isLoading = false;
  static const int _pageSize = 21; // Increased page size

  @override
  void initState() {
    super.initState();
    _loadMoreItems();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
            _scrollController.position.maxScrollExtent * 0.8 &&
        !_isLoading) {
      _loadMoreItems();
    }
  }

  final List<String> assetImages = [
    Assets.pngImage1,
    Assets.pngImage2,
    Assets.pngImage3,
    Assets.img1,
    // Add more as needed
  ];
  Future<void> _loadMoreItems() async {
    if (_isLoading) return;

    setState(() {
      _isLoading = true;
    });

    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 500));

    setState(() {
      _items.addAll(List.generate(_pageSize, (index) {
        final totalIndex = _items.length + index;
        // Create more variety in image sizes
        double aspectRatio;
        switch (totalIndex % 4) {
          case 0:
            aspectRatio = 0.7; // Tall
            break;
          case 1:
            aspectRatio = 1.0; // Square
            break;
          case 2:
            aspectRatio = 0.8; // Medium tall
            break;
          default:
            aspectRatio = 0.9; // Slightly tall
        }

        return TrendingItem(
          imageUrl: assetImages[index % assetImages.length],
          username: 'User ${totalIndex + 1}',
          likes: (100 + totalIndex * 127), // More varied like counts
          aspectRatio: aspectRatio,
          isVideo: totalIndex % 3 == 0, // Every third item will be a video
          isImage: totalIndex % 2 == 0,
        );
      }));
      _isLoading = false;
    });
  }

  int _getImageHeight(double aspectRatio) {
    final baseHeight = 500;
    return (baseHeight / aspectRatio).round();
  }

  Future<void> _onRefresh() async {
    setState(() {
      _items.clear();
    });
    await _loadMoreItems();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _onRefresh,
      child: MasonryGridView.builder(
        controller: _scrollController,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        itemCount: _items.length + 1,
        gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        itemBuilder: (context, index) {
          if (index == _items.length) {
            return _isLoading
                ? const Center(
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: CircularProgressIndicator(),
                    ),
                  )
                : const SizedBox.shrink();
          }
          return TrendingTile(item: _items[index]);
        },
      ),
    );
  }
}

class TrendingItem {
  final String imageUrl;
  final String username;
  final int likes;
  final double aspectRatio;
  final bool isVideo;
  final bool isImage;

  TrendingItem({
    required this.imageUrl,
    required this.username,
    required this.likes,
    required this.aspectRatio,
    required this.isVideo,
    required this.isImage,
  });
}

class TrendingTile extends StatelessWidget {
  final TrendingItem item;

  const TrendingTile({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: item.aspectRatio,
      child: Stack(
        fit: StackFit.expand,
        children: [
          // Image
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              item.imageUrl,
              fit: BoxFit.cover,
              // loadingBuilder: (context, child, loadingProgress) {
              //   if (loadingProgress == null) return child;
              //   return Container(
              //     color: Colors.grey[300],
              //     child: const Center(
              //       child: CircularProgressIndicator(),
              //     ),
              //   );
              // },
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  color: Colors.grey[300],
                  child: const Icon(Icons.error_outline),
                );
              },
            ),
          ),

          // Gradient overlay
          Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black.withOpacity(0.5),
                  ],
                ),
              ),
            ),
          ),

          // Video play icon
          (item.isVideo)
              ? Positioned(
                  top: 12, right: 12, child: SvgPicture.asset(Assets.vedioPlay))
              : (item.isImage)
                  ? Positioned(
                      top: 12,
                      right: 12,
                      child: Image.asset(
                        Assets.emoji,
                        width: 24,
                        height: 24,
                      ),
                    )
                  : const SizedBox(),
        ],
      ),
    );
  }
}
