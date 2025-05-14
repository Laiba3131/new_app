import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:kulture/constants/app_colors.dart';
import 'package:kulture/utils/heights_and_widths.dart';

class MultiImageCarousel extends StatefulWidget {
  final List<String> imageUrls;
  final double imageHeight; // New parameter for custom height

  const MultiImageCarousel({
    super.key,
    required this.imageUrls,
    this.imageHeight = 380, // Default height
  });

  @override
  State<MultiImageCarousel> createState() => _MultiImageCarouselState();
}

class _MultiImageCarouselState extends State<MultiImageCarousel> {
  int _currentIndex = 0;

  void _openFullScreen(String imageUrl) {
    // Your fullscreen logic here
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: widget.imageHeight, // Use the custom height
          child: CarouselSlider.builder(
            itemCount: widget.imageUrls.length,
            itemBuilder: (context, index, realIndex) {
              return GestureDetector(
                onTap: () => _openFullScreen(widget.imageUrls[index]),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12.0),
                    child: Image.asset(
                      widget.imageUrls[index],
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: widget.imageHeight,
                    ),
                  ),
                ),
              );
            },
            options: CarouselOptions(
              height: widget.imageHeight,
              viewportFraction: 1.0,
              enableInfiniteScroll: false,
              onPageChanged: (index, reason) {
                setState(() => _currentIndex = index);
              },
            ),
          ),
        ),
        h0P4,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: widget.imageUrls.asMap().entries.map((entry) {
            return Container(
              width: 8.0,
              height: 8.0,
              margin: const EdgeInsets.symmetric(horizontal: 4.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _currentIndex == entry.key
                    ? AppColors.primaryColor
                    : AppColors.black,
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
