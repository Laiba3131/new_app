import 'package:flutter/material.dart';
import 'package:kulture/utils/extensions/extended_context.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool centerTitle;
  final List<Widget>? actions;
  final PreferredSizeWidget? bottom;
  final Color? titleColor;
  final bool showBack;
  final VoidCallback? onBack;

  const CustomAppbar({
    super.key,
    required this.title,
    this.centerTitle = false,
    this.bottom,
    this.actions,
    this.titleColor,
    this.showBack = false,
    this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 4,
      shadowColor: Colors.black.withOpacity(0.2),
      leading: showBack
          ? IconButton(
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              ),
              onPressed: onBack ?? () => Navigator.of(context).pop(),
            )
          : null,
      title: Text(
        title,
        style: context.textTheme.headlineLarge?.copyWith(
          color: titleColor ?? Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
      centerTitle: centerTitle,
      actions: actions,
      bottom: bottom,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
