import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kulture/constants/app_colors.dart';
import 'package:kulture/generated/assets.dart';
import 'package:kulture/ui/bottom_bar_visibility_provider.dart';
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

  @override
  void dispose() {
    _noteController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.4,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
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
          Padding(
            padding: const EdgeInsets.only(top: 16, left: 16),
            child: _buildSendNotesButton(),
          ),
        ],
      ),
    );
  }

  Widget _buildUserItem(UserNote user) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            children: [
              Container(
                width: 64,
                height: 64,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.grey.withOpacity(0.2),
                    width: 1,
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(32),
                  child: Image.asset(
                    user.imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                bottom: -0,
                right: -2,
                left: 24,
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
          const SizedBox(height: 4),
          Text(
            user.name.split(' ')[0],
            // user.name.split(' ')[0],
            textAlign: TextAlign.center,
            style: context.textTheme.bodyMedium?.copyWith(
                color: AppColors.textGrey,
                fontSize: 14,
                fontWeight: FontWeight.w600),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  Widget _buildSendNotesButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Copy link',
            style: context.textTheme.bodyMedium?.copyWith(
              color: AppColors.black,
              fontSize: 17,
              fontWeight: FontWeight.w600,
            ),
          ),
          h1,
          Container(
            width: 64,
            height: 64,
            padding: const EdgeInsets.all(15),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.textGrey,
            ),
            child: SvgPicture.asset(
              Assets.shareIcon,
              // height: 12,
            ),
          ),
          h1,
        ],
      ),
    );
  }
}
