import 'package:flutter/material.dart';

import '../core/di/service_locator.dart';
import '../core/storage_service/storage_service.dart';

var storageService = StorageService(sharedPreferences: sl());

Widget customDivider(
    {double? vPadding, double? hPadding, double? thickness, Color? color}) {
  return Padding(
    padding: EdgeInsets.symmetric(
      vertical: vPadding ?? 12.0,
      horizontal: hPadding ?? 2.0,
    ),
    child: Divider(
      thickness: thickness ?? 0.6,
      color: color ?? Colors.grey.shade400,
    ),
  );
}

Widget customVerticalDivider({
  double? height = 20,
  double? thickness = 1,
  Color? color = Colors.grey,
}) {
  return Container(
    height: height,
    width: thickness,
    color: color,
  );
}
