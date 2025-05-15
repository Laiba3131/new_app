import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kulture/modules/home/widgets/repost_sheet.dart';
import 'package:kulture/modules/home/widgets/save_bottom_sheet.dart';
import 'package:kulture/modules/profile/widgets/block_user_sheet.dart';
import 'package:kulture/modules/profile/widgets/comment_bottom_sheet.dart';
import 'package:kulture/modules/profile/widgets/repost_stitch_sheet.dart';
import 'package:kulture/modules/profile/widgets/send_notes_bottom_sheet.dart';
import 'package:kulture/modules/profile/widgets/share_profile_sheet.dart';
import 'package:kulture/modules/profile/widgets/share_this_profile_sheet.dart';
import 'package:kulture/ui/bottom_bar_visibility_provider.dart';

import '../../modules/profile/widgets/user_profile_bottom_sheet.dart';

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

  static Future<void> showShareThisProfile(BuildContext context) async {
    BottomBarVisibilityProvider().hide();

    await showCupertinoModalPopup(
      context: context,
      builder: (_) => const ShareThisProfileSheet(),
    );

    BottomBarVisibilityProvider().show();
  }

  static Future<void> showShareProfileSheet(BuildContext context) async {
    BottomBarVisibilityProvider().hide();

    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => const ShareProfileSheet(),
    );

    BottomBarVisibilityProvider().show();
  }

  static Future<void> showUserBottomSheet(BuildContext context) async {
    BottomBarVisibilityProvider().hide();

    await showCupertinoModalPopup(
      context: context,
      builder: (_) => const UserProfileBottomSheet(),
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

  static Future<void> showBlockSheet(BuildContext context) async {
    BottomBarVisibilityProvider().hide();

    await showCupertinoModalPopup(
      context: context,
      builder: (_) => const BlockUserSheet(),
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

 static Future<void> showStitchSheet(BuildContext context) async {
    BottomBarVisibilityProvider().hide();
 await showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    isScrollControlled: true,
    builder: (_){
      return RepostStitchSheet();
    },
  );
   BottomBarVisibilityProvider().show();
}
}