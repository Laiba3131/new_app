import 'package:flutter/material.dart';

/// A provider class to control the visibility of the bottom navigation bar
class BottomBarVisibilityProvider extends ChangeNotifier {
  static final BottomBarVisibilityProvider _instance =
      BottomBarVisibilityProvider._internal();

  factory BottomBarVisibilityProvider() {
    return _instance;
  }

  BottomBarVisibilityProvider._internal();

  bool _isVisible = true;

  /// Whether the bottom navigation bar is currently visible
  bool get isVisible => _isVisible;

  /// Set the visibility of the bottom navigation bar
  void setVisibility(bool visible) {
    if (_isVisible != visible) {
      _isVisible = visible;
      notifyListeners();
    }
  }

  /// Hide the bottom navigation bar
  void hide() {
    setVisibility(false);
  }

  /// Show the bottom navigation bar
  void show() {
    setVisibility(true);
  }
}
