import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kulture/constants/app_colors.dart';
import 'package:kulture/generated/assets.dart';
import 'package:kulture/modules/profile/model/comment_model.dart';
import 'package:kulture/ui/input/input_field.dart';
import 'package:kulture/utils/extensions/extended_context.dart';
import 'package:kulture/utils/heights_and_widths.dart';

class CommentItem extends StatefulWidget {
  final Comment comment;
  final bool isReply;
  final File? picLocation;

  const CommentItem({
    required this.comment,
    this.isReply = false,
    this.picLocation,
    super.key,
  });

  @override
  State<CommentItem> createState() => _CommentItemState();
}

class _CommentItemState extends State<CommentItem> {
  bool showReplyField = false;
  final TextEditingController _replyController = TextEditingController();

  @override
  void dispose() {
    _replyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: 16,
        left: widget.isReply ? 20 : 0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 18,
                backgroundImage: AssetImage(widget.comment.userImage),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8,
                        horizontal: 8,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.searchBarColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: widget.comment.username + " ",
                              style: context.textTheme.bodyMedium?.copyWith(
                                color: AppColors.primaryColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                            TextSpan(
                              text: widget.comment.text,
                              style: context.textTheme.bodyMedium?.copyWith(
                                color: AppColors.black,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 6),
                     
                     
                    Row(
                      children: [
                        Text(
                          widget.comment.timeAgo,
                          style: context.textTheme.bodySmall?.copyWith(
                            color: AppColors.textGrey,
                            fontSize: 12,
                          ),
                        ),
                        w2,
                        SvgPicture.asset(
                          Assets.svgFvt,
                          height: 12,
                        ),
                         w2,
                        SvgPicture.asset(
                          Assets.thum,
                          height: 12,
                        ),
                        w2,
                        InkWell(
                          onTap: () {
                            setState(() {
                              showReplyField = !showReplyField;
                            });
                          },
                          child: Text(
                            "Reply",
                            style: context.textTheme.bodySmall?.copyWith(
                              color: AppColors.textGrey,
                              fontSize: 12,
                            ),
                          ),
                        ),
                        const Spacer(),
                        Text(
                          "${widget.comment.likes} Likes",
                          style: context.textTheme.bodySmall?.copyWith(
                            color: AppColors.textGrey,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    h1,
                     if (widget.picLocation != null )
                        Container(
                          width: 150,
                          height: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: FileImage(widget.picLocation!),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        h1,
                  ],
                ),
              ),
            ],
          ),
          if (showReplyField) ...[
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.only(left: 50),
              child: Row(
                children: [
                   CircleAvatar(
                radius: 18,
                backgroundImage: AssetImage(widget.comment.userImage),
              ),w1,
                  Expanded(
                    child: InputField(
                      controller: TextEditingController(),
                      label: 'Write a response...',
                      textColor: AppColors.black,
                      borderColor: AppColors.searchBarColor,
                      boxConstraints: 10,
                      borderRadius: 20,
                      verticalPadding: 5,
                      fillColor: AppColors.white,
                    ),
                  ),
                  w1,
                  // IconButton(
                  //   onPressed: () {
                  //     // handle your reply logic here
                  //   },
                  //   icon: const Icon(Icons.send, size: 20, color: AppColors.primaryColor),
                  // ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}
