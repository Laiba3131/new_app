// import 'package:kulture/modules/personal_info/cubit/steps_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kulture/modules/search/cubit/search_cubit.dart';
import 'package:kulture/modules/settings/cubit/push_notifications_cubit.dart';

import '../../core/di/service_locator.dart';
import '../../modules/questionnaire/cubit/questionnaire_cubit.dart';
import '../../modules/settings/cubit/settings_cubit.dart';
import '../cubit/app_cubit.dart';

class BlocDI extends StatelessWidget {
  const BlocDI({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AppCubit>(
          create: (context) => AppCubit(sl())..init(),
        ),
        BlocProvider<SettingsCubit>(
          create: (context) => SettingsCubit(sl()),
        ),
        BlocProvider<PushNotificationsCubit>(
          create: (context) => PushNotificationsCubit(sl()),
        ),
        BlocProvider<SearchCubit>(
          create: (context) => SearchCubit(),
        ),
         BlocProvider<QuestionnaireCubit>(
          create: (context) => QuestionnaireCubit(),
        ),
      ],
      child: child,
    );
  }
}
