import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kulture/modules/start_up/cubit/splash_state.dart';

// part 'startup_state.dart';

class StartupCubit extends Cubit<StartupState> {
  StartupCubit() : super(StartupState.initial());

  void init() async {
    emit(state.copyWith(status: Status.none));
    await Future.delayed(const Duration(seconds: 3));
    emit(state.copyWith(status: Status.success));
  }
}
