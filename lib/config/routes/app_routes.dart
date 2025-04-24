import 'package:flutter/material.dart';
import 'package:kulture/modules/settings/pages/settings_screen.dart';

class AppRoutes {
  static const String settings = '/settings';
  static const String login = '/login';

  static Map<String, WidgetBuilder> routes = {
    settings: (context) => const SettingsScreen(),
    // Add other routes here
  };
}
