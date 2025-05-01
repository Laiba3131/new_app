import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kulture/config/themes/dark_theme.dart';
import 'package:kulture/modules/dashboard/pages/dashboard_screen.dart';
import 'package:kulture/modules/questionnaire/pages/user_info_screen.dart';
import 'package:kulture/modules/start_up/splash_screen.dart';
import 'package:kulture/modules/dashboard/pages/dashboard_persistent_bottom_bar.dart';
import 'package:sizer/sizer.dart';

import '../config/routes/nav_router.dart';
import '../config/themes/light_theme.dart';
import '../modules/profile/pages/customized_profile_screen.dart';
import '../modules/profile/pages/profile_customization_screen.dart';
import '../modules/questionnaire/pages/gender_selection_screen.dart';
import 'bloc/bloc_di.dart';
import 'cubit/app_cubit.dart';

class kultureApp extends StatelessWidget {
  const kultureApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocDI(
      child: BlocBuilder<AppCubit, AppState>(
        builder: (context, state) {
          return Sizer(builder: (context, orientation, deviceType) {
            return MaterialApp(
              navigatorKey: NavRouter.navigationKey,
              title: 'kulture',
              debugShowCheckedModeBanner: false,
              theme: lightTheme,
              darkTheme: darkTheme,
              themeMode: state.themeMode,
              builder: (BuildContext context, Widget? child) {
                child = BotToastInit()(context, child);
                return child;
              },
              navigatorObservers: [
                BotToastNavigatorObserver(),
              ],
              // home: DashboardPersistentBottomBar(),
              home: CustomizedProfileScreen(),
              // home: ProfileCustomizationScreen(),
              // home: CustomizedProfileScreen(),
            );
          });
        },
      ),
    );
  }
}
