import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kulture/modules/home/widgets/repost_sheet.dart';
import 'package:kulture/modules/home/widgets/save_bottom_sheet.dart';
import 'package:kulture/modules/profile/widgets/comment_bottom_sheet.dart';
import 'package:kulture/modules/profile/widgets/send_notes_bottom_sheet.dart';
import 'package:kulture/ui/bottom_bar_visibility_provider.dart';

class BottomSheetService {
  static Future<void> showSaveSheet(BuildContext context) async {
    BottomBarVisibilityProvider().hide();

    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => const SaveBottomSheet(),
    );

    BottomBarVisibilityProvider().show();
  }

  static Future<void> showReportSheet(BuildContext context) async {
    BottomBarVisibilityProvider().hide();

    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) => const ReportBottomSheet(),
    );

    BottomBarVisibilityProvider().show();
  }

  static showCommentSheet(BuildContext context) async {
    BottomBarVisibilityProvider().hide();
    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) {
        return const CommentBottomSheet();
      },
    );
    BottomBarVisibilityProvider().show();
  }

  static showSendNoteSheet(BuildContext context) async {
    BottomBarVisibilityProvider().hide();

    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) {
        return const SendNotesBottomSheet();
      },
    );

    // Show the bottom bar again after the sheet is closed
    BottomBarVisibilityProvider().show();
  }
}
