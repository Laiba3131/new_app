part of 'settings_cubit.dart';

class SettingsState extends Equatable {
  final bool isLightMode;
  final bool isLoggedOut;

  const SettingsState({
    required this.isLightMode,
    this.isLoggedOut = false,
  });

  factory SettingsState.initial() {
    return const SettingsState(
      isLightMode: true,
      isLoggedOut: false,
    );
  }

  SettingsState copyWith({
    bool? isLightMode,
    bool? isLoggedOut,
  }) {
    return SettingsState(
      isLightMode: isLightMode ?? this.isLightMode,
      isLoggedOut: isLoggedOut ?? this.isLoggedOut,
    );
  }

  @override
  List<Object?> get props => [isLightMode, isLoggedOut];
}
