import 'package:flutter/material.dart';

Widget sectionSpacerHorizontally() => const SizedBox(
      width: 16.0,
    );

Widget sectionSpacerVertically() => const SizedBox(
      height: 16.0,
    );

Widget verticalSpace() => const SizedBox(
      height: 24.0,
    ); // 24 height

Widget horizontalSpace() => const SizedBox(
      width: 24.0,
    ); // 24 height

Widget widgetSpacerVertically() => const SizedBox(
      height: 12.0,
    ); // 16 height

Widget fourteenSpacerVertically() => const SizedBox(
      height: 14.0,
    ); // 14 height

Widget widgetSpacerHorizontally() => const SizedBox(
      width: 12.0,
    ); // 16 width

Widget otherSpacerHorizontally() => const SizedBox(
      width: 8.0,
    );

Widget otherSpacerVertically() => const SizedBox(
      height: 8.0,
    ); // 8 height

Widget spacer4Horizontally() => const SizedBox(
      width: 4.0,
    );

Widget spacer4Vertically() => const SizedBox(
      height: 4.0,
    );

Widget customSpacerVertically({required double height}) => SizedBox(
      height: height,
    );

Widget customSpacerHorizontally({required double width}) => SizedBox(
      width: width,
    );
