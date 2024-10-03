import 'dart:async';

class TimeCalculations {
  DateTime time = DateTime.now();
  Timer? timer;
  int perClickTimeIndex = 0;
  final DateTime eventDate = DateTime(2021, DateTime.december, 28, 20, 30);
  final List<String> timeNames = [
    'years',
    'days',
    'hours',
    'minutes',
    'seconds'];

  // Calculated time
  // (for displaying time in years, days, hours, minutes and seconds)
  // (in cycle)
  List<int> calcTimeSinceEv() {
    final difference = time.difference(eventDate);
    return [
      difference.inDays ~/ 365, // years
      difference.inDays, // days
      difference.inHours, // hours
      difference.inMinutes, // minutes
      difference.inSeconds, // seconds
    ];
  }

  // Calculated time since some event (for full display of time)
  List<int> calculateTimeSinceEventFixedTime() {
    final difference = time.difference(eventDate);
    return [
      difference.inDays, // days
      difference.inHours % 24, // hours
      difference.inMinutes % 60, // minutes
      difference.inSeconds % 60, //seconds
    ];
  }

  // Method for not concatenating a string
  // that would be too long (cleaner code)
  String getCalculatedTimeToString() {
    String total = '';
    int indexExcludeYear = 1;
    for (final time in calculateTimeSinceEventFixedTime()) {
      total += '${time.toString()} ${timeNames[indexExcludeYear]}, ';
      indexExcludeYear++;
    }
    return total.substring(0, total.length - 2);
  }

  // Method for displaying time in years, days, hours, minutes and seconds
  String getCalculatedTimeToStringEach() {
    return
      '${calcTimeSinceEv()[perClickTimeIndex]} ${timeNames[perClickTimeIndex]}';
  }
}

