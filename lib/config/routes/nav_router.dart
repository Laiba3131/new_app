import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kulture/modules/settings/pages/settings_screen.dart';

class NavRouter {
  static final GlobalKey<NavigatorState> navigationKey =
      GlobalKey<NavigatorState>();

  // List of routes that should be displayed fullscreen (without bottom navigation)
  static bool isFullScreenRoute(Widget route) {
    return route is SettingsScreen ||
        route.toString().contains('Settings') ||
        route.toString().contains('Auth') ||
        route.toString().contains('Login');
  }

  // Navigate from the root navigator (used for fullscreen routes like settings)
  static Future pushFromRoot(
    BuildContext context,
    Widget route, {
    bool bottomToTop = false,
  }) {
    return navigationKey.currentState!.push(
      MaterialPageRoute(fullscreenDialog: bottomToTop, builder: (_) => route),
    );
  }

  static Future push(
    BuildContext context,
    Widget route, {
    bool bottomToTop = false,
  }) {
    return Navigator.push(
      context,
      MaterialPageRoute(fullscreenDialog: bottomToTop, builder: (_) => route),
    );
  }

  static Future<dynamic> to(Widget page, {arguments}) async =>
      navigationKey.currentState?.push(MaterialPageRoute(
        builder: (_) => page,
      ));

  static Future<dynamic> toReplacement(Widget page, {arguments}) async =>
      navigationKey.currentState?.pushReplacement(MaterialPageRoute(
        builder: (_) => page,
      ));

  /// Push Replacement
  static Future pushReplacement(
    BuildContext context,
    Widget route, {
    bool bottomToTop = false,
  }) {
    return Navigator.pushReplacement(
        context,
        CupertinoPageRoute(
            fullscreenDialog: bottomToTop, builder: (context) => route));
  }

  /// Pop
  static void pop(BuildContext context, [result]) {
    return Navigator.of(context).pop(result);
  }

  /// Push and remove until
  static Future pushAndRemoveUntil(BuildContext context, Widget route) {
    return Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (_) => route,
        ),
        (Route<dynamic> route) => false);
  }

  /// Push and remove until
  static Future pushAndRemoveUntilFirst(BuildContext context, Widget route) {
    return Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (_) => route,
        ),
        (Route<dynamic> route) => route.isFirst);
  }
}
