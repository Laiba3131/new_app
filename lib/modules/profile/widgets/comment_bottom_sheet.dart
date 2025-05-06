import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kulture/constants/app_colors.dart';
import 'package:kulture/generated/assets.dart';
import 'package:kulture/modules/profile/pages/dummy_data.dart';
import 'package:kulture/ui/input/input_field.dart';
import 'package:kulture/utils/extensions/extended_context.dart';
import 'package:kulture/utils/heights_and_widths.dart';

import '../model/comment_model.dart';
import 'comment_items_widget.dart';

class CommentBottomSheet extends StatefulWidget {
  const CommentBottomSheet({super.key});

  @override
  State<CommentBottomSheet> createState() => _CommentBottomSheetState();
}

class _CommentBottomSheetState extends State<CommentBottomSheet> {
  File? _selectedMedia;
  final ImagePicker _picker = ImagePicker();
  Comment? replyingTo;

  Future<void> _pickMedia() async {
    final XFile? media = await _picker.pickImage(source: ImageSource.gallery);
    if (media != null) {
      setState(() {
        _selectedMedia = File(media.path);
      });
    }
  }

  void _clearSelectedMedia() {
    setState(() {
      _selectedMedia = null;
    });
  }

  final TextEditingController _commentController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  final List<Comment> comments = DummyData.comments;

  @override
  void dispose() {
    _commentController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _addComment() {
    if (_commentController.text.isEmpty && _selectedMedia == null) return;

    // This is a simplified implementation - in a real app, you would
    // upload the image to a server and get a URL back
    String? imagePath = _selectedMedia?.path;

    setState(() {
      if (replyingTo != null) {
        // Add a reply to an existing comment
        final replyComment = Comment(
          username:
              "Current User", // In a real app, use the current user's name
          text: _commentController.text,
          timeAgo: "Just now",
          userImage: Assets.pngImage1, // Use current user's image
          likes: 0,
          imagePath: imagePath,
        );

        // Find the comment to add the reply to
        for (int i = 0; i < comments.length; i++) {
          if (comments[i] == replyingTo) {
            // Add reply directly to the comment
            List<Comment> updatedReplies = [
              ...comments[i].replies,
              replyComment
            ];
            comments[i] = Comment(
              username: comments[i].username,
              text: comments[i].text,
              timeAgo: comments[i].timeAgo,
              userImage: comments[i].userImage,
              likes: comments[i].likes,
              imagePath: comments[i].imagePath,
              replies: updatedReplies,
            );
            break;
          }

          // Check if the replyingTo comment is in the replies of the current comment
          for (int j = 0; j < comments[i].replies.length; j++) {
            if (comments[i].replies[j] == replyingTo) {
              // Add reply to the reply (as a new reply to the parent comment)
              List<Comment> updatedReplies = [
                ...comments[i].replies,
                replyComment
              ];
              comments[i] = Comment(
                username: comments[i].username,
                text: comments[i].text,
                timeAgo: comments[i].timeAgo,
                userImage: comments[i].userImage,
                likes: comments[i].likes,
                imagePath: comments[i].imagePath,
                replies: updatedReplies,
              );
              break;
            }
          }
        }
      } else {
        // Add a new top-level comment
        comments.add(Comment(
          username:
              "Current User", // In a real app, use the current user's name
          text: _commentController.text,
          timeAgo: "Just now",
          userImage: Assets.pngImage1, // Use current user's image
          likes: 0,
          imagePath: imagePath,
        ));
      }

      _commentController.clear();
      _selectedMedia = null;
      replyingTo = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.8,
        decoration: const BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          children: [
            // Top drag indicator
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Container(
                height: 4,
                width: 40,
                decoration: BoxDecoration(
                  color: Colors.grey[400],
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),

            // Title
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8),
              child: Text(
                'Comment',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: comments.length,
                itemBuilder: (context, index) {
                  final comment = comments[index];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CommentItem(
                        comment: comment,
                        onReply: (comment) {
                          setState(() {
                            replyingTo = comment;
                            _focusNode.requestFocus();
                          });
                        },
                      ),
                      // if (comment.replies.isNotEmpty)
                      //   Padding(
                      //     padding: const EdgeInsets.only(left: 40),
                      //     child: ListView.builder(
                      //       shrinkWrap: true,
                      //       physics: const NeverScrollableScrollPhysics(),
                      //       itemCount: comment.replies.length,
                      //       itemBuilder: (context, replyIndex) {
                      //         return CommentItem(
                      //           comment: comment.replies[replyIndex],
                      //           isReply: true,
                      //           onReply: (comment) {
                      //             setState(() {
                      //               replyingTo = comment;
                      //               _focusNode.requestFocus();
                      //             });
                      //           },
                      //         );
                      //       },
                      //     ),
                      //   ),
                      // const SizedBox(height: 10),
                    ],
                  );
                },
              ),
            ),

            // Selected media preview
            // if (_selectedMedia != null)
            //   Container(
            //     padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            //     child: Stack(
            //       children: [
            //         Container(
            //           height: 100,
            //           width: 100,
            //           decoration: BoxDecoration(
            //             borderRadius: BorderRadius.circular(8),
            //             image: DecorationImage(
            //               image: FileImage(_selectedMedia!),
            //               fit: BoxFit.cover,
            //             ),
            //           ),
            //         ),
            //         Positioned(
            //           right: 0,
            //           top: 0,
            //           child: InkWell(
            //             onTap: _clearSelectedMedia,
            //             child: Container(
            //               padding: const EdgeInsets.all(4),
            //               decoration: const BoxDecoration(
            //                 color: Colors.black54,
            //                 shape: BoxShape.circle,
            //               ),
            //               child: const Icon(
            //                 Icons.close,
            //                 color: Colors.white,
            //                 size: 16,
            //               ),
            //             ),
            //           ),
            //         ),
            //       ],
            //     ),
            //   ),

            // // Replying to indicator
            // if (replyingTo != null)
            //   Container(
            //     padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            //     color: AppColors.searchBarColor.withOpacity(0.3),
            //     child: Row(
            //       children: [
            //         Expanded(
            //           child: Text(
            //             'Replying to ${replyingTo!.username}',
            //             style: context.textTheme.bodySmall?.copyWith(
            //               color: AppColors.primaryColor,
            //               fontWeight: FontWeight.w500,
            //             ),
            //           ),
            //         ),
            //         InkWell(
            //           onTap: () {
            //             setState(() {
            //               replyingTo = null;
            //             });
            //           },
            //           child: const Icon(Icons.close, size: 16),
            //         ),
            //       ],
            //     ),
            //   ),

            // Comment input bar
            Container(
              padding: EdgeInsets.only(
                left: 16,
                right: 16,
                top: 8,
                bottom: MediaQuery.of(context).viewInsets.bottom + 8,
              ),
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(color: Colors.grey, width: 0.3),
                ),
              ),
              child: Row(
                children: [
                  InkWell(
                    onTap: _pickMedia,
                    child: SvgPicture.asset(
                      Assets.camers,
                      height: 20,
                      color: AppColors.searchBarTextColor,
                    ),
                  ),
                  w2,
                  Expanded(
                    child: InputField(
                      controller: _commentController,
                      focusNode: _focusNode,
                      label: replyingTo != null
                          ? 'Write a reply...'
                          : 'Comment something',
                      textColor: AppColors.black,
                      borderColor: AppColors.searchBarColor,
                      boxConstraints: 10,
                      borderRadius: 20,
                      verticalPadding: 5,
                      fillColor: AppColors.white,
                    ),
                  ),
                  w1,
                  IconButton(
                    onPressed: _addComment,
                    icon: const Icon(Icons.send, color: AppColors.primaryColor),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
