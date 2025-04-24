import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kulture/constants/app_colors.dart';
import 'package:kulture/generated/assets.dart';
import 'package:kulture/modules/settings/cubit/push_notifications_cubit.dart';
import 'package:kulture/modules/settings/cubit/push_notifications_state.dart';
import 'package:kulture/modules/settings/widgets/custom_container.dart';
import 'package:kulture/modules/settings/widgets/custom_tile_widget.dart';
import 'package:kulture/ui/button/primary_button.dart';
import 'package:kulture/ui/widgets/custom_appbar.dart';

class PushNotificationsScreen extends StatelessWidget {
  const PushNotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PushNotificationsCubit, PushNotificationsState>(
      builder: (context, state) {
        return Scaffold(
          appBar: const CustomAppbar(
            title: 'Push notifications',
            showBack: true,
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  NotificationSection(
                    children: [
                      CustomTileWidget(
                        title: 'Allow notifications',
                        // value: state.likesNotifications,
                        onChanged: (value) {},
                        // icon: Icons.favorite_border,
                        isBorder: false,
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  NotificationSection(
                    children: [
                      CustomTileWidget(
                        title: 'Likes',
                        value: state.likesNotifications,
                        onChanged: (value) {
                          context
                              .read<PushNotificationsCubit>()
                              .toggleLikesNotifications(value);
                        },
                        icon: Assets.svgFvt,
                      ),
                      CustomTileWidget(
                        title: 'Comments',
                        value: state.commentsNotifications,
                        onChanged: (value) {
                          context
                              .read<PushNotificationsCubit>()
                              .toggleCommentsNotifications(value);
                        },
                        icon: Assets.like2,
                      ),
                      CustomTileWidget(
                        title: 'Followers',
                        value: state.followersNotifications,
                        onChanged: (value) {
                          context
                              .read<PushNotificationsCubit>()
                              .toggleFollowersNotifications(value);
                        },
                        icon: Assets.like3,
                      ),
                      CustomTileWidget(
                        title: 'Mentions',
                        value: state.mentionsNotifications,
                        onChanged: (value) {
                          context
                              .read<PushNotificationsCubit>()
                              .toggleMentionsNotifications(value);
                        },
                        icon: Assets.like4,
                      ),
                      CustomTileWidget(
                        title: 'Direct messages',
                        value: state.directMessagesNotifications,
                        onChanged: (value) {
                          context
                              .read<PushNotificationsCubit>()
                              .toggleDirectMessagesNotifications(value);
                        },
                        icon: Assets.like5,
                        isBorder: false,
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  PrimaryButton(
                      height: 45,
                      vMargin: 0,
                      hMargin: 0,
                      onPressed: () {
                        context
                            .read<PushNotificationsCubit>()
                            .saveChanges()
                            .then((_) {
                          Navigator.pop(context);
                        });
                      },
                      title: 'Save changes',
                      backgroundColor: AppColors.black,
                      titleColor: AppColors.white,
                      borderRadius: 17,
                      shadowColor: AppColors.transparent),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
