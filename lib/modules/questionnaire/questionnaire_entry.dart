import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/questionnaire_cubit.dart';
import 'pages/user_info_screen.dart';

class QuestionnaireEntry extends StatelessWidget {
  const QuestionnaireEntry({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => QuestionnaireCubit(),
      child: const UserInfoScreen(),
    );
  }
} 