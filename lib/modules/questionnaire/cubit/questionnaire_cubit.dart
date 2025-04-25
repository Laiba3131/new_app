import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../model/questionnaire_model.dart';

part 'questionnaire_state.dart';

class QuestionnaireCubit extends Cubit<QuestionnaireState> {
  QuestionnaireCubit() : super(QuestionnaireState());

  void updateName(String name) {
    emit(state.copyWith(model: state.model.copyWith(name: name)));
  }

  void updateUsername(String username) {
    emit(state.copyWith(model: state.model.copyWith(username: username)));
  }

  void updateEmail(String email) {
    emit(state.copyWith(model: state.model.copyWith(email: email)));
  }

  void updatePhoneNumber(String phoneNumber) {
    emit(state.copyWith(model: state.model.copyWith(phoneNumber: phoneNumber)));
  }

  void updateDob(String dob) {
    emit(state.copyWith(model: state.model.copyWith(dob: dob)));
  }

  void updateGender(String gender) {
    emit(state.copyWith(model: state.model.copyWith(gender: gender)));
  }

  void submitBasicInfo() {
    emit(state.copyWith(isBasicInfoSubmitted: true));
  }

  void submitGenderInfo() {
    emit(state.copyWith(isGenderInfoSubmitted: true));
  }
} 