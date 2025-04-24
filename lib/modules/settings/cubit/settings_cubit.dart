import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  final SharedPreferences _prefs;
  static const String _lightModeKey = 'light_mode';

  SettingsCubit(this._prefs) : super(SettingsState.initial()) {
    _loadSettings();
  }

  void _loadSettings() {
    final bool isLightMode = _prefs.getBool(_lightModeKey) ?? true;
    emit(state.copyWith(isLightMode: isLightMode));
  }

  Future<void> toggleLightMode(bool value) async {
    await _prefs.setBool(_lightModeKey, value);
    emit(state.copyWith(isLightMode: value));
  }

  Future<void> logout() async {
    // Clear any necessary data from SharedPreferences
    await _prefs.clear();
    emit(state.copyWith(isLoggedOut: true));
  }
}
