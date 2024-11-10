import 'dart:async';

import 'package:anniversary_date_app/tools/shared_date_preferences.dart';

class TimeCalculations {
  final sharedPrefsDate = SharedDatePreferences();

  DateTime time = DateTime.now();
  Timer? timer;
  int perClickTimeIndex = 0;

  DateTime eventDate = DateTime.now();

  final List<String> timeNames = [
    'years',
    'days',
    'hours',
    'minutes',
    'seconds'
  ];

  Future<void> initializeEventDate() async {
    int storedDate = await sharedPrefsDate.getDateTimestampValue('date');
    eventDate = DateTime.fromMillisecondsSinceEpoch(storedDate);
  }

  List<int> calcTimeCycle() {
    final difference = time.difference(eventDate);
    return [
      difference.inDays ~/ 365,
      difference.inDays,
      difference.inHours,
      difference.inMinutes,
      difference.inSeconds,
    ];
  }

  List<int> calcTimeFull() {
    final difference = time.difference(eventDate);
    return [
      difference.inDays,
      difference.inHours % 24,
      difference.inMinutes % 60,
      difference.inSeconds % 60,
    ];
  }

  String month() {
    final monthArray = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December'
    ];
    return monthArray[eventDate.month - 1];
  }

  String getCalcTimeToStr() {
    return calcTimeFull()
        .asMap()
        .entries
        .map((e) => '${e.value} ${timeNames[e.key + 1]}')
        .join(', ');
  }

  String getCalcTimeToStrCycle() {
    return '${calcTimeCycle()[perClickTimeIndex]} ${timeNames[perClickTimeIndex]}';
  }

  String getDateFormattedString() {
    return '${eventDate.day} ${month()} ${eventDate.year}';
  }
}
