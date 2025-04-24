import 'package:flutter/material.dart';
import 'package:kulture/constants/app_colors.dart';
import 'package:kulture/utils/extensions/extended_context.dart';
import 'package:kulture/utils/heights_and_widths.dart';

class ProfileHeaderRow extends StatelessWidget {
  final String name;
  final String username;
  final String bio;
  final String profileImageUrl;

  const ProfileHeaderRow({
    super.key,
    required this.name,
    required this.username,
    required this.bio,
    required this.profileImageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Left side: Name, Username, Bio
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              h2,
              Text(
                name,
                style: context.textTheme.bodySmall?.copyWith(
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                  color: AppColors.black,
                ),
              ),
              Text(
                username,
                style: context.textTheme.bodySmall?.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                  color: AppColors.black,
                ),
              ),
              h1,
              h0P3,
              Text(
                bio,
                style: context.textTheme.bodySmall?.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                  color: AppColors.black,
                ),
              ),
            ],
          ),
        ),

        w2,
        Container(
          margin: const EdgeInsets.only(top: 25),
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.grey.shade300, width: 1),
            image: DecorationImage(
              image: AssetImage(profileImageUrl),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
}
