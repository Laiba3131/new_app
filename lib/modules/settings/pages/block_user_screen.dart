import 'package:flutter/material.dart';
import 'package:kulture/constants/app_colors.dart';
import 'package:kulture/modules/profile/pages/dummy_data.dart';
import 'package:kulture/modules/settings/widgets/custom_block_user_tile.dart';
import 'package:kulture/ui/widgets/custom_appbar.dart';
import 'package:kulture/utils/extensions/extended_context.dart';

class BlockedUserScreen extends StatelessWidget {
  const BlockedUserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> blockedUsers = DummyData.blockedUsers;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppbar(
        title: 'Blocked users',
        showBack: true,
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 12),
            child: Text(
              'Follow Requests',
              style: context.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: AppColors.black,
                  fontSize: 24),
            ),
          ),
          Expanded(
            child: ListView.separated(
              itemCount: blockedUsers.length,
              separatorBuilder: (context, index) => const Padding(
                padding: EdgeInsets.only(left: 74.0),
                child: Divider(
                  height: 1,
                  thickness: 0.5,
                  color: AppColors.lightGreyColor,
                ),
              ),
              itemBuilder: (context, index) {
                final user = blockedUsers[index];
                return BlockedUserTile(
                  user: user,
                  buttonColor: AppColors.red,
                  onUnblock: () {},
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
