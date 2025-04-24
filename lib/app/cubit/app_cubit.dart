import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/storage_service/storage_service.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  final StorageService storageService;

  AppCubit(this.storageService) : super(AppState(locale: const Locale('en')));

  void init() {
    String locale = storageService.getString('locale');
    String theme = storageService.getString('themeMode');

    emit(state.copyWith(
      locale: locale.isEmpty ? const Locale('en') : Locale(locale),
      themeMode: _parseThemeMode(theme),
    ));
  }

  void updateLanguage(String locale) async {
    await storageService.setString('locale', locale);
    emit(state.copyWith(locale: Locale(locale)));
  }

  void updateThemeMode(ThemeMode mode) async {
    await storageService.setString(
        'themeMode', mode.name); // Save as 'light' or 'dark'
    emit(state.copyWith(themeMode: mode));
  }

  ThemeMode _parseThemeMode(String mode) {
    switch (mode) {
      case 'dark':
        return ThemeMode.dark;
      case 'system':
        return ThemeMode.system;
      case 'light':
      default:
        return ThemeMode.light;
    }
  }
}
