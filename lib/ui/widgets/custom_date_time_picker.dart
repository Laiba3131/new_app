import 'package:kulture/config/config.dart';
import 'package:kulture/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../utils/time_utils.dart';

class CustomDateTimePicker {
  static Future<String> displayTimePicker(
    BuildContext context, {
    bool disablePastTimes = false,
    bool currentDate = false,
  }) async {
    TimeOfDay now = TimeOfDay.now();
    var time = await showTimePicker(
      context: context,
      initialTime: now,
      builder: (BuildContext context, Widget? child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
          child: Theme(
            data: ThemeData.light().copyWith(
              canvasColor: Colors.transparent,
              primaryColor: AppColors.primaryColor,
            ),
            child: child!,
          ),
        );
      },
    );

    // Check for null
    if (time == null) {
      return ''; // Return empty string if no time is selected
    }

    // Validation when disablePastTimes is true
    if (disablePastTimes && isPastTime(now, time)) {
      ScaffoldMessenger.of(NavRouter.navigationKey.currentContext!)
          .showSnackBar(
        const SnackBar(
          content: Text('You cannot select a past time!'),
        ),
      );
      return '';
    }

    // Validation for "after next half hour" when currentDate is true
    if (currentDate && !isAfterNextHalfHour(now, time)) {
      ScaffoldMessenger.of(NavRouter.navigationKey.currentContext!)
          .showSnackBar(
        const SnackBar(
          content: Text('You can only select a time after the next half hour!'),
        ),
      );
      return '';
    }

    return changeTimeFormat(time);
  }

  static bool isPastTime(TimeOfDay currentTime, TimeOfDay selectedTime) {
    final now = DateTime.now();
    final currentDateTime = DateTime(
        now.year, now.month, now.day, currentTime.hour, currentTime.minute);
    final selectedDateTime = DateTime(
        now.year, now.month, now.day, selectedTime.hour, selectedTime.minute);

    return selectedDateTime.isBefore(currentDateTime);
  }

  static bool isAfterNextHalfHour(
      TimeOfDay currentTime, TimeOfDay selectedTime) {
    final now = DateTime.now();

    // Calculate the next half-hour mark
    int nextHalfHourMinute = now.minute < 30 ? 30 : 0;
    int nextHalfHourHour = now.minute < 30 ? now.hour : now.hour + 1;

    final nextHalfHourTime = DateTime(
      now.year,
      now.month,
      now.day,
      nextHalfHourHour,
      nextHalfHourMinute,
    );

    final selectedDateTime = DateTime(
      now.year,
      now.month,
      now.day,
      selectedTime.hour,
      selectedTime.minute,
    );

    return selectedDateTime.isAfter(nextHalfHourTime);
  }

  static Future<String> getCurrentTime(BuildContext context) async {
    TimeOfDay currentTime = TimeOfDay.now();

    return changeTimeFormat(currentTime);
  }

  static Future<String> getTodayDate(BuildContext context) async {
    DateTime today = DateTime.now();

    return changeDateFormat(today);
  }

  static Future<String> selectDate(BuildContext context) async {
    DateTime now = DateTime.now();
    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime(now.year, now.month, now.day),
      firstDate: DateTime(now.year, now.month, now.day),
      lastDate: DateTime(2201),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            canvasColor: Colors.transparent,
          ),
          child: child!,
        );
      },
    );

    if (selectedDate != null) {
      return selectedDate.toString();
    } else {
      return '';
    }
  }

  static String changeDateFormat(DateTime date) {
    final DateFormat formatter = DateFormat('EEE, MMM yyyy');
    final String formatted = formatter.format(date);
    debugPrint(formatted); // something like 2013-04-20
    return formatted;
  }

  static String changeDateFormat1(DateTime date) {
    final DateFormat formatter = DateFormat('EEE, MMM yyyy');
    final String formatted = formatter.format(date);
    debugPrint(formatted); // something like 2013-04-20
    return formatted;
  }

  static String changeTimeFormat(TimeOfDay time) {
    DateTime now = DateTime.now();
    DateTime dt =
        DateTime(now.year, now.month, now.day, time.hour, time.minute);
    final DateFormat formatter = DateFormat.Hms();
    final String formatted = formatter.format(dt);
    debugPrint(formatted); // something like 2013-04-20
    return changeDateTimeFormat(dt, 'hh:mm a');
  }
}
