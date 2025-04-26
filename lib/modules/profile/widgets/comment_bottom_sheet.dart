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

  Future<void> _pickMedia() async {
    final XFile? media = await _picker.pickImage(source: ImageSource.gallery);
    if (media != null) {
      setState(() {
        _selectedMedia = File(media.path);
      });
    }
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
                      CommentItem(comment: comment),
                      if (comment.replies.isNotEmpty)
                        Padding(
                          padding: const EdgeInsets.only(left: 40),
                          child: ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: comment.replies.length,
                            itemBuilder: (context, replyIndex) {
                              return CommentItem(
                                comment: comment.replies[replyIndex],
                                isReply: true,
                                picLocation:_selectedMedia
                              );
                            },
                          ),
                        ),
                      const SizedBox(height: 10),
                    ],
                  );
                },
              ),
            ),

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
                      label: 'Comment something',
                      textColor: AppColors.black,
                      borderColor: AppColors.searchBarColor,
                      boxConstraints: 10,
                      borderRadius: 20,
                      verticalPadding: 5,
                      fillColor: AppColors.white,
                    ),
                  ),
                  w1,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
