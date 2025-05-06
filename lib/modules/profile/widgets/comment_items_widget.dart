import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kulture/constants/app_colors.dart';
import 'package:kulture/generated/assets.dart';
import 'package:kulture/modules/profile/model/comment_model.dart';
import 'package:kulture/ui/input/input_field.dart';
import 'package:kulture/ui/widgets/custom_favt_button.dart';
import 'package:kulture/utils/extensions/extended_context.dart';
import 'package:kulture/utils/heights_and_widths.dart';

class CommentItem extends StatefulWidget {
  final Comment comment;
  final bool isReply;
  final Function(Comment)? onReply;

  const CommentItem({
    required this.comment,
    this.isReply = false,
    this.onReply,
    super.key,
  });

  @override
  State<CommentItem> createState() => _CommentItemState();
}

class _CommentItemState extends State<CommentItem> {
  bool showReplyField = false;
  bool showAllReplies = false;
  final TextEditingController _replyController = TextEditingController();
  File? _selectedReplyMedia;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickReplyMedia() async {
    final XFile? media = await _picker.pickImage(source: ImageSource.gallery);
    if (media != null) {
      setState(() {
        _selectedReplyMedia = File(media.path);
      });
    }
  }

  void _clearSelectedReplyMedia() {
    setState(() {
      _selectedReplyMedia = null;
    });
  }

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
                radius: widget.isReply ? 13 : 18,
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
                              text: '${widget.comment.username.toString().toLowerCase().replaceAll(' ', '')} ',
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

                    // Display image if available
                    if (widget.comment.imagePath != null) ...[
                      h1,
                      Container(
                        width: 200,
                        height: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: _getImageProvider(widget.comment.imagePath!),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      h1,
                    ],

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
                        CustomFavoriteIcon(
                           unFillColor:AppColors.svgIconColor,
                                       fillColor:AppColors.red,
                                      outlineAssetPath: Assets.svgFvt,
                                      filledAssetPath: Assets.svgFvtFilled,
                                      size: 12,
                                      initiallyFavorited: false,
                                      onToggle: (isFav) {},
                                    ),
                        w2,
                        CustomFavoriteIcon(
                           unFillColor:AppColors.svgIconColor,
                                      outlineAssetPath: Assets.thum,
                                      filledAssetPath: Assets.dislikeIcon,
                                      size: 12,
                                      fillColor:AppColors.black,
                                      initiallyFavorited: false,
                                      onToggle: (isFav) {},
                                    ),
                        w2,
                        InkWell(
                          onTap: () {
                            setState(() {
                              showReplyField = true;
                            });

                            if (widget.onReply != null) {
                              widget.onReply!(widget.comment);
                            }
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
                  ],
                ),
              ),
            ],
          ),
          // Show replies section
          if (widget.comment.replies != null && widget.comment.replies!.isNotEmpty) ...[
            const SizedBox(height: 8),
            // Show first reply by default
            if (widget.comment.replies!.isNotEmpty)
              CommentItem(
                comment: widget.comment.replies!.first,
                isReply: true,
                onReply: widget.onReply,
              ),
            // Show "View X replies" button if there are more replies
            if (widget.comment.replies!.length > 1 && !showAllReplies)
              Padding(
                padding: const EdgeInsets.only(left: 50),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      showAllReplies = true;
                    });
                  },
                  child: Text(
                    "View ${widget.comment.replies!.length - 1} more replies",
                    style: context.textTheme.bodySmall?.copyWith(
                      color: AppColors.primaryColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            // Show remaining replies when expanded
            if (showAllReplies)
              ...widget.comment.replies!.skip(1).map(
                    (reply) => CommentItem(
                      comment: reply,
                      isReply: true,
                      onReply: widget.onReply,
                    ),
                  ),
          ],
          if (showReplyField) ...[
            const SizedBox(height: 8),
            // Selected reply media preview
            if (_selectedReplyMedia != null) ...[
              Padding(
                padding: const EdgeInsets.only(left: 50, bottom: 8),
                child: Stack(
                  children: [
                    Container(
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(
                          image: FileImage(_selectedReplyMedia!),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      right: 0,
                      top: 0,
                      child: InkWell(
                        onTap: _clearSelectedReplyMedia,
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: const BoxDecoration(
                            color: Colors.black54,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.close,
                            color: Colors.white,
                            size: 16,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],

            Padding(
              padding: const EdgeInsets.only(left: 50),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 13,
                    backgroundImage: AssetImage(widget.comment.userImage),
                  ),
                  w1,
                  Expanded(
                    child: InputField(
                      controller: _replyController,
                      label: 'Write a response...',
                      textColor: AppColors.black,
                      borderColor: AppColors.searchBarColor,
                      boxConstraints: 10,
                      borderRadius: 20,
                      verticalPadding: 5,
                      fillColor: AppColors.white,
                    ),
                  ),
                  // IconButton(
                  //   onPressed: _pickReplyMedia,
                  //   icon: SvgPicture.asset(
                  //     Assets.camers,
                  //     height: 20,
                  //     color: AppColors.searchBarTextColor,
                  //   ),
                  // ),
                  // IconButton(
                  //   onPressed: () {
                  //     // Add reply logic here - in a real app, this would add the reply to the database
                  //     // and update the UI accordingly

                  //     // For demo, just clear the input and hide the reply field
                  //     setState(() {
                  //       showReplyField = false;
                  //       _replyController.clear();
                  //       _selectedReplyMedia = null;
                  //     });
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

  ImageProvider _getImageProvider(String path) {
    // Check if the path is a local file path (starts with /)
    if (path.startsWith('/')) {
      return FileImage(File(path));
    }
    // Check if it's an asset path (starts with 'assets/')
    else if (path.startsWith('assets/')) {
      return AssetImage(path);
    }
    // Otherwise, try to treat it as a network image (in production this would be a URL)
    else {
      try {
        return FileImage(File(path));
      } catch (e) {
        // Fallback to a placeholder if the file can't be loaded
        return const AssetImage('assets/images/placeholder.png');
      }
    }
  }
}
