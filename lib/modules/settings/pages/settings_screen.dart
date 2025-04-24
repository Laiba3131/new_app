import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kulture/config/routes/nav_router.dart';
import 'package:kulture/constants/app_colors.dart';
import 'package:kulture/generated/assets.dart';
import 'package:kulture/modules/settings/cubit/settings_cubit.dart';
import 'package:kulture/modules/settings/pages/about_app_screen.dart';
import 'package:kulture/modules/settings/pages/accounts_screen.dart';
import 'package:kulture/modules/settings/pages/block_user_screen.dart';
import 'package:kulture/modules/settings/pages/change_password_screen.dart';
import 'package:kulture/modules/settings/pages/enable_auth_screen.dart';
import 'package:kulture/modules/settings/pages/push_notifications_screen.dart';
import 'package:kulture/modules/settings/pages/safety_center_screen.dart';
import 'package:kulture/modules/settings/pages/who_can_message_me_screen.dart';
import 'package:kulture/modules/settings/widgets/custom_container.dart';
import 'package:kulture/modules/settings/widgets/custom_tile_widget.dart';
import 'package:kulture/ui/widgets/custom_appbar.dart';
import 'package:kulture/utils/extensions/extended_context.dart';
import 'package:kulture/utils/heights_and_widths.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12, top: 12),
      child: Text(title,
          style: context.textTheme.bodySmall?.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: AppColors.black)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SettingsCubit, SettingsState>(
      listenWhen: (previous, current) =>
          previous.isLoggedOut != current.isLoggedOut,
      listener: (context, state) {
        if (state.isLoggedOut) {
          Navigator.pop(context);
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: const CustomAppbar(
          title: 'Settings',
          showBack: true,
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                h1,
                NotificationSection(
                  children: [
                    CustomTileWidget(
                      title: 'Light mode',
                      // value: state.likesNotifications,
                      onChanged: (value) {},
                      isBorder: false,
                      // icon: Icons.favorite_border,
                    ),
                  ],
                ),
                _buildSectionTitle('Profile Management'),
                NotificationSection(
                  children: [
                    CustomTileWidget(
                      title: 'Account',
                      onChanged: (value) {},
                      icon: Assets.account,
                      isSwitch: false,
                      fun: () {
                        NavRouter.push(
                          context,
                          const AccountsScreen(),
                        );
                      },
                    ),
                    CustomTileWidget(
                      title: 'Change password',
                      onChanged: (value) {},
                      isSwitch: false,
                      icon: Assets.changePassword,
                      fun: () {
                        NavRouter.push(
                          context,
                          const ChangePasswordScreen(),
                        );
                      },
                      isBorder: false,
                    ),
                  ],
                ),
                _buildSectionTitle('Privacy & Security'),
                NotificationSection(
                  children: [
                    CustomTileWidget(
                      title: 'Who can message me',
                      onChanged: (value) {},
                      icon: Assets.whoCanMessageMe,
                      isSwitch: false,
                      fun: () {
                        NavRouter.push(
                          context,
                          const WhoCanMessageMeScreen(),
                        );
                      },
                    ),
                    CustomTileWidget(
                      title: 'Safety center',
                      onChanged: (value) {},
                      isSwitch: false,
                      icon: Assets.saftyCenter,
                      fun: () {
                        NavRouter.push(
                          context,
                          const SafetyCenterScreen(),
                        );
                      },
                    ),
                    CustomTileWidget(
                      title: 'Block',
                      isSwitch: false,
                      onChanged: (value) {},
                      icon: Assets.block,
                      fun: () {
                        NavRouter.push(
                          context,
                          const BlockedUserScreen(),
                        );
                      },
                    ),
                    CustomTileWidget(
                      title: 'Two-Factor Authentication',
                      isSwitch: false,
                      onChanged: (value) {},
                      icon: Assets.twoFactorAuth,
                      fun: () {
                        NavRouter.push(
                          context,
                          const EnableAuthScreen(),
                        );
                      },
                      isBorder: false,
                    ),
                  ],
                ),
                _buildSectionTitle('Profile Management'),
                NotificationSection(
                  children: [
                    CustomTileWidget(
                      title: 'Notifications settings',
                      onChanged: (value) {},
                      icon: Assets.notificationSetting,
                      isSwitch: false,
                      fun: () {
                        NavRouter.push(
                          context,
                          const PushNotificationsScreen(),
                        );
                      },
                    ),
                    CustomTileWidget(
                      title: 'About Kultureapp',
                      onChanged: (value) {},
                      isSwitch: false,
                      icon: Assets.about,
                      fun: () {
                        NavRouter.push(
                          context,
                          const AboutAppScreen(),
                        );
                      },
                      isBorder: false,
                    ),
                  ],
                ),
                h2,
                NotificationSection(
                  children: [
                    CustomTileWidget(
                        title: 'Log out',
                        onChanged: null,
                        icon: Assets.LogOut,
                        isBorder: false,
                        isLogout: false),
                  ],
                ),
                h4,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
