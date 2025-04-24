import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'circular_cached_image.dart';

class PictureWidget extends StatelessWidget {
  final String imageUrl;
  final VoidCallback onTap;
  final double width;
  final double height;
  final double radius;
  final String errorPath;
  final bool isEditable;
  final Color borderColor;
  final BoxFit fit;

  const PictureWidget(
      {super.key,
      required this.imageUrl,
      required this.onTap,
      this.width = 140,
      this.height = 140,
      this.radius = 70,
      this.isEditable = false,
      this.borderColor = Colors.transparent,
      required this.errorPath,
      this.fit = BoxFit.cover});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isEditable ? onTap : null,
      child: Center(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            imageUrl.contains('http')
                ? Hero(
                    tag: imageUrl + generateRandomString(5),
                    child: CircularCachedImage(
                      imageUrl: imageUrl,
                      width: width,
                      height: height,
                      borderRadius: radius,
                      errorPath: errorPath,
                    ),
                  )
                : Container(
                    width: width,
                    height: height,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(radius),
                      border: Border.all(color: borderColor),
                      image: DecorationImage(
                        fit: fit,
                        image: imageUrl.contains('assets/')
                            ? AssetImage(imageUrl) as ImageProvider
                            : FileImage(
                                File(imageUrl),
                              ),
                      ),
                    ),
                  ),
            if (isEditable)
              Positioned(
                bottom: -12,
                right: 0,
                child: GestureDetector(
                  onTap: onTap,
                  child: SvgPicture.asset(
                    'assets/images/svg/ic_edit_profile.svg',
                    height: 44,
                    width: 44,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  String generateRandomString(int len) {
    var r = Random();
    return String.fromCharCodes(
        List.generate(len, (index) => r.nextInt(33) + 89));
  }
}
