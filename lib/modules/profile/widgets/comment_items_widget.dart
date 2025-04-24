import 'package:flutter/material.dart';
import 'package:kulture/constants/app_colors.dart';
import 'package:kulture/modules/profile/model/comment_model.dart';
import 'package:kulture/utils/extensions/extended_context.dart';
import 'package:kulture/utils/heights_and_widths.dart';

class CommentItem extends StatelessWidget {
  final Comment comment;
  final bool isReply;

  const CommentItem({
    required this.comment,
    this.isReply = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage(comment.userImage),
              ),
              Positioned(
                bottom: -2,
                right: -2,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2),
                  ),
                  child: const Icon(Icons.add_circle,
                      color: Colors.black, size: 16),
                ),
              ),
            ],
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                  decoration: BoxDecoration(
                      color: AppColors.textGrey,
                      borderRadius: BorderRadius.circular(13)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        comment.username,
                        style: context.textTheme.bodyMedium?.copyWith(
                          color: AppColors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      h0P3,
                      Text(
                        comment.text,
                        style: context.textTheme.bodyMedium?.copyWith(
                          color: AppColors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Text(
                      comment.timeAgo,
                      style: context.textTheme.bodyMedium?.copyWith(
                        color: AppColors.textGrey,
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    w2,
                    Text(
                      "Like",
                      style: context.textTheme.bodyMedium?.copyWith(
                        color: AppColors.textGrey,
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    if (!isReply) ...[
                      const SizedBox(width: 16),
                      InkWell(
                        onTap: () {},
                        child: Text(
                          'Reply',
                          style: context.textTheme.bodyMedium?.copyWith(
                            color: AppColors.textGrey,
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      const Spacer(),
                      Text(
                        "${comment.likes.toString()} Likes",
                        style: context.textTheme.bodyMedium?.copyWith(
                          color: AppColors.textGrey,
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
