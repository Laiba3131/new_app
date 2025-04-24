import 'package:flutter/material.dart';
import 'package:kulture/constants/app_colors.dart';
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
        padding: const EdgeInsets.only(top: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 4,
                width: 40,
                margin: const EdgeInsets.only(bottom: 20),
                decoration: BoxDecoration(
                  color: Colors.grey[400],
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              Text(
                'Comments',
                style: context.textTheme.bodyMedium?.copyWith(
                  color: AppColors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                padding: const EdgeInsets.all(16),
                itemCount: comments.length,
                itemBuilder: (context, index) {
                  final comment = comments[index];
                  return Column(
                    children: [
                      CommentItem(comment: comment),
                      if (comment.replies.isNotEmpty)
                        Padding(
                          padding: const EdgeInsets.only(left: 48),
                          child: ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: comment.replies.length,
                            itemBuilder: (context, replyIndex) {
                              return CommentItem(
                                comment: comment.replies[replyIndex],
                                isReply: true,
                              );
                            },
                          ),
                        ),
                    ],
                  );
                },
              ),
              // Comment input
              Container(
                padding: EdgeInsets.only(
                  left: 16,
                  right: 16,
                  top: 8,
                  bottom: MediaQuery.of(context).viewInsets.bottom + 8,
                ),
                // decoration: BoxDecoration(
                //   color: Colors.white,
                //   boxShadow: [
                //     BoxShadow(
                //       color: Colors.black.withOpacity(0.05),
                //       blurRadius: 4,
                //       offset: const Offset(0, -2),
                //     ),
                //   ],
                // ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.camera_alt_outlined,
                      color: AppColors.textGrey,
                    ),
                    w1,
                    Expanded(
                        child: InputField(
                      controller: _commentController,
                      label: 'Comment something...',
                      borderColor: AppColors.textGrey,
                      boxConstraints: 10,
                      borderRadius: 15,
                      verticalPadding: 5,
                    )),
                    w1,
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
