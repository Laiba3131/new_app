import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kulture/constants/app_colors.dart';
import 'package:kulture/modules/search/cubit/search_cubit.dart';
import 'package:kulture/modules/search/cubit/search_state.dart';
import 'package:kulture/modules/search/widgets/follow_tile_widget.dart';
import 'package:kulture/utils/extensions/extended_context.dart';
import 'package:kulture/utils/heights_and_widths.dart';

class AllTab extends StatelessWidget {
  final bool showOnlyFollows;
  const AllTab({super.key, this.showOnlyFollows = false});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        final users = showOnlyFollows
            ? state.suggestedUsers
                .where((user) => user['isFollowing'] != true)
                .toList()
            : state.suggestedUsers;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Follow suggestions',
              style: context.textTheme.bodyMedium?.copyWith(
                  color: AppColors.textGrey,
                  fontSize: 14,
                  fontWeight: FontWeight.w700),
            ),
            h2,
            Expanded(
              child: ListView.separated(
                shrinkWrap: true,
                itemCount: users.length,
                separatorBuilder: (context, index) => const Padding(
                  padding: EdgeInsets.only(left: 75.0),
                  child: Divider(
                    height: 1,
                    thickness: 0.5,
                    color: AppColors.lightGreyColor,
                  ),
                ),
                itemBuilder: (context, index) {
                  final user = users[index];
                  return UserProfileTile(user: user);
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
