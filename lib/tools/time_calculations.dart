import 'dart:async';

class TimeCalculations {
  DateTime time = DateTime.now();
  Timer? timer;
  int perClickTimeIndex = 0;
  // Placeholder hardcoded date for now
  final DateTime eventDate = DateTime(2021, DateTime.december, 28, 20, 30); // TODO: User given date
  final List<String> timeNames = [
    'years',
    'days',
    'hours',
    'minutes',
    'seconds'];

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
    String total = '';
    int indexExcludeYear = 1;
    for (final time in calcTimeFull()) {
      total += '${time.toString()} ${timeNames[indexExcludeYear]}, ';
      indexExcludeYear++;
    }
    return total.substring(0, total.length - 2);
  }

  String getCalcTimeToStrCycle() {
    return
      '${calcTimeCycle()[perClickTimeIndex]} ${timeNames[perClickTimeIndex]}';
  }
}

