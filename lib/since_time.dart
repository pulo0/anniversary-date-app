import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// TODO: Implement a HeartCard widget
// TODO: Implement a text in the HeartCard widget which
// TODO: will display time (first in days, then in hours, minutes and seconds) after clicking on this text

class SinceTime extends StatefulWidget {
  const SinceTime({super.key});

  @override
  State<SinceTime> createState() => _SinceTimeState();
}

class _SinceTimeState extends State<SinceTime> {
  DateTime time = DateTime.now();
  Timer? timer;
  final DateTime eventDate = DateTime(2021, DateTime.december, 28);
  final List<String> timeNames = ['days', 'hours', 'minutes', 'seconds'];

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

  List<int> calculateTimeSinceEvent() {
    final difference = time.difference(eventDate);
    return [
      difference.inDays,
      difference.inHours % 24,
      difference.inMinutes % 60,
      difference.inSeconds % 60,
    ];
  }

  String getCalculatedTimeToString() {
    String total = '';
    int i = 0;
    for (final time in calculateTimeSinceEvent()) {
      total += '${time.toString()} ${timeNames[i]}, ';
      i++;
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
                  'Time being together with<3:',
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
                Text(
                  getCalculatedTimeToString(),
                  style: TextStyle(
                    color: colorScheme.onPrimary,
                    fontSize: 30,
                    fontFamily:
                        GoogleFonts.rosarioTextTheme().bodyMedium?.fontFamily,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
