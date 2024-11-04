import 'dart:async';

class TimeCalculations {
  DateTime time = DateTime.now();
  Timer? timer;
  int perClickTimeIndex = 0;

  // Placeholder hardcoded date for now
  final DateTime eventDate =
      DateTime(2021, DateTime.december, 28, 20, 30); // TODO: User given date
  final List<String> timeNames = [
    'years',
    'days',
    'hours',
    'minutes',
    'seconds'
  ];

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
