import 'package:flutter/material.dart';
import 'package:kulture/ui/bottom_bar_visibility_provider.dart';

/// Shows a modal bottom sheet and hides the bottom navigation bar
Future<T?> showBottomSheetWithoutNavBar<T>({
  required BuildContext context,
  required WidgetBuilder builder,
  bool isScrollControlled = true,
  Color? backgroundColor,
  ShapeBorder? shape,
}) async {
  final visibilityProvider = BottomBarVisibilityProvider();

  // Hide the bottom bar before showing the bottom sheet
  visibilityProvider.hide();

  // Show the bottom sheet
  T? result = await showModalBottomSheet<T>(
    context: context,
    isScrollControlled: isScrollControlled,
    backgroundColor: backgroundColor ?? Colors.transparent,
    shape: shape ??
        const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
    builder: builder,
  );

  // Show the bottom bar again when the bottom sheet is closed
  visibilityProvider.show();

  return result;
}
