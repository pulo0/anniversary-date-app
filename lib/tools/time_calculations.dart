import 'dart:async';
import 'package:anniversary_date_app/logic/service_locator.dart';
import 'package:anniversary_date_app/tools/shared_date_preferences.dart';

class TimeCalculations {
  final sharedPrefsDate = locator<SharedDatePreferences>();

  DateTime time = DateTime.now();
  Timer? timer;
  int perClickTimeIndex = 0;

  final List<String> timeNames = [
    'years',
    'days',
    'hours',
    'minutes',
    'seconds'
  ];

  String month(DateTime eventDate) {
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

  List<int> calcTimeCycle(DateTime eventDate) {
    final difference = time.difference(eventDate);
    return [
      difference.inDays ~/ 365,
      difference.inDays,
      difference.inHours,
      difference.inMinutes,
      difference.inSeconds,
    ];
  }

  List<int> calcTimeFull(DateTime eventDate) {
    final difference = time.difference(eventDate);
    return [
      difference.inDays,
      difference.inHours % 24,
      difference.inMinutes % 60,
      difference.inSeconds % 60,
    ];
  }

  String getCalcTimeToStr(DateTime eventDate) {
    return calcTimeFull(eventDate)
        .asMap()
        .entries
        .map((e) => '${e.value} ${timeNames[e.key + 1]}')
        .join(', ');
  }

  String getCalcTimeToStrCycle(DateTime eventDate) {
    return '${calcTimeCycle(eventDate)[perClickTimeIndex]} ${timeNames[perClickTimeIndex]}';
  }

  String getDateFormattedString(DateTime eventDate) {
    return '${eventDate.day} ${month(eventDate)} ${eventDate.year}';
  }
}
