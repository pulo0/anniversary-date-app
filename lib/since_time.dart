import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SinceTime extends StatefulWidget {
  const SinceTime({super.key});

  @override
  State<SinceTime> createState() => _SinceTimeState();
}

class _SinceTimeState extends State<SinceTime> {

  DateTime time = DateTime.now();
  Timer? timer;
  final DateTime eventDate = DateTime(2021, DateTime.december, 28, 20, 30);
  static List<String> timeNames = [
    'years',
    'days',
    'hours',
    'minutes',
    'seconds'];
  int perClickTimeIndex = 0;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(
      const Duration(milliseconds: 500),
      (timer) => _updateTime(),
    );
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  void _updateTime() {
    setState(() {
      time = DateTime.now();
    });
  }

  // Calculated time
  // (for displaying time in years, days, hours, minutes and seconds)
  // (in cycle)
  List<int> calcTimeSincEv() {
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

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return SizedBox(
      width: 350,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
        child: Card(
          shape: ShapeBorder.lerp(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            0.5,
          ),
          elevation: 10,
          color: colorScheme.primary,
          shadowColor: colorScheme.onPrimaryContainer,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(
                  'Time being together with kiciuś<3:',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: colorScheme.onPrimary,
                    fontSize: 20,
                    fontFamily:
                        GoogleFonts.rosarioTextTheme().bodyLarge?.fontFamily,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  '28th December 2021',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: colorScheme.onPrimary,
                    fontSize: 20,
                    fontFamily:
                        GoogleFonts.rosarioTextTheme().bodyMedium?.fontFamily,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Icon(
                  Icons.favorite,
                  color: colorScheme.onPrimary,
                  size: 30,
                  semanticLabel: 'Heart',
                ),
                TextButton(
                  onPressed: () {
                    perClickTimeIndex++;
                    if (perClickTimeIndex == timeNames.length + 1) {
                      perClickTimeIndex = 0;
                    }
                  },
                  child: Text(
                    perClickTimeIndex == timeNames.length
                        ? getCalculatedTimeToString()
                        : '${calcTimeSincEv()[perClickTimeIndex].toString()} ${timeNames[perClickTimeIndex]}',
                    style: TextStyle(
                      color: colorScheme.onPrimary,
                      fontSize: 30,
                      fontFamily:
                          GoogleFonts.rosarioTextTheme().bodyMedium?.fontFamily,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
