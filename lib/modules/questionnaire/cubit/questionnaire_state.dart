part of 'questionnaire_cubit.dart';

class QuestionnaireState extends Equatable {
  final QuestionnaireModel model;
  final bool isBasicInfoSubmitted;
  final bool isGenderInfoSubmitted;

  const QuestionnaireState({
    this.model = const QuestionnaireModel(),
    this.isBasicInfoSubmitted = false,
    this.isGenderInfoSubmitted = false,
  });

  QuestionnaireState copyWith({
    QuestionnaireModel? model,
    bool? isBasicInfoSubmitted,
    bool? isGenderInfoSubmitted,
  }) {
    return QuestionnaireState(
      model: model ?? this.model,
      isBasicInfoSubmitted: isBasicInfoSubmitted ?? this.isBasicInfoSubmitted,
      isGenderInfoSubmitted: isGenderInfoSubmitted ?? this.isGenderInfoSubmitted,
    );
  }

  @override
  List<Object?> get props => [model, isBasicInfoSubmitted, isGenderInfoSubmitted];
} 