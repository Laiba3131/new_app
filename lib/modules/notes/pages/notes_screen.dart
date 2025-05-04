import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kulture/config/config.dart';
import 'package:kulture/constants/app_colors.dart';
import 'package:kulture/modules/stories/pages/stories_screen.dart';
import 'package:kulture/ui/button/primary_button.dart';
import 'package:kulture/ui/input/input_field.dart';
import 'package:kulture/utils/extensions/extended_context.dart';
import 'package:kulture/utils/heights_and_widths.dart';
import '../../../generated/assets.dart';
import 'chat_screen.dart';

class NotesScreen extends StatefulWidget {
  const NotesScreen({Key? key}) : super(key: key);

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(),
            _buildSearchBar(),
            h3,
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // _buildStorySection(),
                    // h2,
                    _buildNotesFromFriends(),
                    h2,
                    _buildSuggestedAccounts(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              NavRouter.pop(context);
            },
            child: Image.asset(
              Assets.backIcon,
              width: 24,
              height: 24,
              color: AppColors.black,
            ),
          ),
          w2,
          Text(
            'Notes',
            style: context.textTheme.bodyMedium?.copyWith(
              color: AppColors.black,
              fontSize: 32,
              fontWeight: FontWeight.w700,
            ),
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {},
            child: Image.asset(
              Assets.chatSetting,
              width: 24,
              height: 24,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: InputField(
        controller: TextEditingController(),
        label: 'Search...',
        labelColor: AppColors.textGrey,
        borderRadius: 17,
        fillColor: AppColors.searchBarColor,
        prefixIcon: const Icon(
          Icons.search,
          color: AppColors.textGrey,
          size: 18,
        ),
        boxConstraints: 50,
      ),
    );
  }

  Widget _buildStorySection() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {
              // NavRouter.pushFromRoot(context, const StoriesScreen());
            },
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                // Profile image
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.grey[300]!, width: 2),
                  ),
                  child: ClipOval(
                    child: Image.asset(
                      Assets.pngImage2,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                // Top right label (Thoughts?)
                Positioned(
                  top: -22,
                  right: -10,
                  child: Stack(
                    clipBehavior: Clip.none,
                    alignment: Alignment.topRight,
                    children: [
                      Container(
                        width: 80,
                        height: 30,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 6),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: AppColors.textGrey,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              blurRadius: 4,
                              spreadRadius: 1,
                              offset: const Offset(1, 2),
                            ),
                          ],
                        ),
                        child: Text(
                          'Thoughts?',
                          style: context.textTheme.bodyMedium?.copyWith(
                            color: AppColors.textGrey,
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // Add icon at bottom right
                Positioned(
                  bottom: -1,
                  right: -1,
                  child: Container(
                    height: 20,
                    width: 20,
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
          ),
          const SizedBox(height: 8),
          Text(
            'Your story',
            style: context.textTheme.bodyMedium?.copyWith(
              color: AppColors.black,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNotesFromFriends() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            'Notes from friends',
            style: context.textTheme.bodyMedium?.copyWith(
              color: AppColors.black,
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(height: 12),
        _buildMessageItem(
          'dj.foof',
          'New messages',
          '15m',
          hasUnread: true,
        ),
        _buildMessageItem(
          'doggie.bad',
          'Hey! can you send me your...',
          '32m',
          hasUnread: false,
        ),
        _buildMessageItem(
          'rallyboogie',
          'I love that new video you just...',
          '55m',
          hasUnread: true,
        ),
      ],
    );
  }

  Widget _buildSuggestedAccounts() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            'Suggested accounts',
            style: context.textTheme.bodyMedium?.copyWith(
              color: AppColors.black,
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(height: 12),
        _buildSuggestedItem(
          'bougiedoll',
          'Fashion is my love...',
        ),
        _buildSuggestedItem(
          'cagetyourtongue',
          'What\'s love got to do...',
        ),
      ],
    );
  }

  Widget _buildMessageItem(
    String name,
    String message,
    String time, {
    bool hasUnread = false,
  }) {
    return GestureDetector(
      onLongPress: () {
        _showDeleteBlockDialog(context);
      },
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ChatScreen(
              name: name,
              username: name.toLowerCase(),
              profileImage: Assets.pngImage1,
            ),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.grey.shade300, width: 1),
                  image: const DecorationImage(
                    image: AssetImage(Assets.pngImage3),
                    fit: BoxFit.cover,
                  ),
                )),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: context.textTheme.bodyMedium?.copyWith(
                      color: AppColors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Text(
                        message,
                        style: context.textTheme.bodyMedium?.copyWith(
                          color: AppColors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      w0P5,
                      Text(
                        time,
                        style: context.textTheme.bodyMedium?.copyWith(
                          color: AppColors.textGrey,
                          fontSize: 13,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                if (hasUnread)
                  Container(
                    width: 8,
                    height: 8,
                    margin: const EdgeInsets.only(top: 4),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.red,
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSuggestedItem(String name, String bio) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          InkWell(
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.grey.shade300, width: 1),
                image: const DecorationImage(
                  image: AssetImage(Assets.pngImage2),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: context.textTheme.bodyMedium?.copyWith(
                    color: AppColors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  bio,
                  style: context.textTheme.bodyMedium?.copyWith(
                    color: AppColors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          PrimaryButton(
            onPressed: () {},
            title: 'Follow',
            backgroundColor: AppColors.primaryColor,
            borderRadius: 11,
            height: 36,
            width: 85,
            shadowColor: AppColors.transparent,
          ),
          GestureDetector(
            onTap: () {},
            child: Image.asset(
              Assets.suggestCancel,
              width: 20,
              height: 20,
            ),
          ),
        ],
      ),
    );
  }

  void _showDeleteBlockDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: () => Navigator.pop(context),
                child: Padding(
                  padding: const EdgeInsets.only(top: 14, left: 8, right: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Block',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 17),
                      ),
                      SvgPicture.asset(
                        Assets.block,
                        width: 24,
                        color: AppColors.black,
                        height: 24,
                      ),
                    ],
                  ),
                ),
              ),
              h1,
              const Divider(
                color: AppColors.searchBarColor,
                thickness: 1,
              ),
              h1,
              InkWell(
                onTap: () => Navigator.pop(context),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 14, left: 8, right: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Delete',
                        style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.w400,
                            fontSize: 17),
                      ),
                      SvgPicture.asset(
                        Assets.trash,
                        width: 28,
                        height: 28,
                        color: AppColors.red,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
