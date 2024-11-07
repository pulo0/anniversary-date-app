import 'dart:async';

import 'package:anniversary_date_app/tools/shared_date_preferences.dart';

class TimeCalculations {
  final sharedPrefsDate = SharedDatePreferences();

  DateTime time = DateTime.now();
  Timer? timer;
  int perClickTimeIndex = 0;

  late DateTime eventDate;

  final List<String> timeNames = [
    'years',
    'days',
    'hours',
    'minutes',
    'seconds'
  ];

  Future<void> initializeEventDate() async {
    int? storedDate = await sharedPrefsDate.getDateTimestampValue('date');
    if (storedDate != null) {
      eventDate = DateTime.fromMillisecondsSinceEpoch(storedDate);
    } else {
      eventDate = DateTime.now();
    }
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
      difference.inDays, // days
      difference.inHours % 24, // hours
      difference.inMinutes % 60, // minutes
      difference.inSeconds % 60, //seconds
    ];
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
}
