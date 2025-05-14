import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kulture/constants/app_colors.dart';
import 'package:kulture/generated/assets.dart';
import 'package:kulture/utils/extensions/extended_context.dart';
import 'package:kulture/utils/heights_and_widths.dart';

class UserNote {
  final String name;
  final String imageUrl;

  UserNote({
    required this.name,
    required this.imageUrl,
  });
}

class ShareThisProfileSheet extends StatefulWidget {
  const ShareThisProfileSheet({super.key});

  @override
  State<ShareThisProfileSheet> createState() => _ShareThisProfileSheetState();
}

class _ShareThisProfileSheetState extends State<ShareThisProfileSheet> {
  final TextEditingController _noteController = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  final List<UserNote> users = [
    UserNote(name: 'Ale Rosa Maria', imageUrl: Assets.pngImage1),
    UserNote(name: 'Monica Avila', imageUrl: Assets.pngImage2),
    UserNote(name: 'Mazike Smith', imageUrl: Assets.pngImage3),
    UserNote(name: 'Kerria Brown', imageUrl: Assets.pngImage4),
    UserNote(name: 'Sylvia Oliver', imageUrl: Assets.pngImage5),
    UserNote(name: 'Jaci Alexis', imageUrl: Assets.pngImage6),
  ];
  final List<String> icons = [
    Assets.sheetIcon1,
    Assets.sheetIcon2,
    Assets.sheetIcon3,
    Assets.sheetIcon4,
    Assets.sheetIcon5,
  ];
  @override
  void dispose() {
    _noteController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoActionSheet(
      actions: [
        Container(
          color: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              h1,
              SizedBox(
                height: 90,
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  scrollDirection: Axis.horizontal,
                  itemCount: users.length,
                  itemBuilder: (context, index) {
                    return _buildUserItem(users[index]);
                  },
                ),
              ),
              h1,
              const Divider(
                color: AppColors.searchBarColor,
              ),
              h1,
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                // height: 90,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      icons[0],
                      height: 55,
                    ),
                    Image.asset(
                      icons[1],
                      height: 55,
                    ),
                    Image.asset(
                      icons[2],
                      height: 45,
                    ),
                    Image.asset(
                      icons[3],
                      height: 45,
                    ),
                    Image.asset(
                      icons[4],
                      height: 45,
                    ),
                  ],
                ),
              ),
              h2
            ],
          ),
        ),
      ],
      cancelButton: CupertinoActionSheetAction(
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: Text('Cancel',
            style: context.textTheme.bodyMedium?.copyWith(
                fontSize: 17,
                fontWeight: FontWeight.w600,
                color: AppColors.red)),
      ),
    );
  }

  Widget _buildUserItem(UserNote user) {
    return Padding(
      padding: const EdgeInsets.only(right: 13),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            children: [
              CircleAvatar(
                radius: 28,
                backgroundImage: AssetImage(user.imageUrl),
              ),
              Positioned(
                bottom: -0,
                right: -4,
                left: 24,
                child: Image.asset(
                  Assets.sheetIcon1,
                  height: 22,
                  width: 22,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            user.name.split(' ')[0],
            textAlign: TextAlign.center,
            style: context.textTheme.bodyMedium?.copyWith(
                color: AppColors.black,
                fontSize: 14,
                fontWeight: FontWeight.w600),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
