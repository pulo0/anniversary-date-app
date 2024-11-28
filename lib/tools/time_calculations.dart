import 'dart:async';
import 'package:intl/intl.dart';
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

  String getDateFormattedString(DateTime eventDate) {
    return DateFormat('d MMMM y').format(eventDate);
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

  String getCalcTimeToStrCycle(DateTime eventDate) {
    return '${calcTimeCycle(eventDate)[perClickTimeIndex]} ${timeNames[perClickTimeIndex]}';
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
}
