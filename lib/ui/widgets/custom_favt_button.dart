import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kulture/constants/app_colors.dart';

class CustomFavoriteIcon extends StatefulWidget {
  final double size;
  final String filledAssetPath;
  final String outlineAssetPath;
  final bool initiallyFavorited;
  final void Function(bool isFavorited)? onToggle;

  const CustomFavoriteIcon({
    Key? key,
    required this.filledAssetPath,
    required this.outlineAssetPath,
    this.size = 24.0,
    this.initiallyFavorited = false,
    this.onToggle,
  }) : super(key: key);

  @override
  State<CustomFavoriteIcon> createState() => _CustomFavoriteIconState();
}

class _CustomFavoriteIconState extends State<CustomFavoriteIcon> {
  late bool isFavorited;

  @override
  void initState() {
    super.initState();
    isFavorited = widget.initiallyFavorited;
  }

  void _toggleFavorite() {
    setState(() {
      isFavorited = !isFavorited;
    });
    widget.onToggle?.call(isFavorited);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggleFavorite,
      child: SvgPicture.asset(
        isFavorited ? widget.filledAssetPath : widget.outlineAssetPath,
        height: widget.size,
        width: widget.size,
        color: isFavorited ? AppColors.red : AppColors.white,
      ),
    );
  }
}
