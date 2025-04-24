import 'package:flutter/material.dart';

TextStyle textFieldStyles({
  Color? color,
  double? size,
  FontWeight? weight,
  String? family,
}) {
  return TextStyle(
    color: color ?? Colors.white,
    fontSize: size ?? 14.0,
    fontWeight: weight ?? FontWeight.w500,
    fontFamily: family ?? 'Gabarito',
  );
}
//
// ButtonStyle? customButtonStyle(
//     {Color? buttonColor,
//     double? vertPadding,
//     double? horPadding,
//     double? borderRadius}) {
//   return ElevatedButton.styleFrom(
//     padding: EdgeInsets.symmetric(
//         vertical: vertPadding ?? 18.0, horizontal: horPadding ?? 0.0),
//     backgroundColor: buttonColor ?? black,
//     disabledBackgroundColor: Colors.grey,
//     disabledForegroundColor: Colors.black,
//     shape: RoundedRectangleBorder(
//       borderRadius: BorderRadius.circular(borderRadius ?? 8.0),
//     ),
//   );
// }
