import 'package:flutter/material.dart';
import 'package:kulture/constants/app_colors.dart';

class NotificationSection extends StatelessWidget {
  final List<Widget> children;

  const NotificationSection({
    Key? key,
    required this.children,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border.all(color: AppColors.searchBarColor, width: 1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: children
            .map((child) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: child,
                ))
            .toList(),
      ),
    );
  }
}
