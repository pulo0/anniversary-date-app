import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:anniversary_date_app/tools/time_calculations.dart';

class DateItem extends StatefulWidget {
  const DateItem({super.key});

  @override
  State<DateItem> createState() => _DateItemState();
}

class _DateItemState extends State<DateItem> {
  TimeCalculations tCalc = TimeCalculations();

  @override
  void initState() {
    super.initState();
    tCalc.timer = Timer.periodic(
      const Duration(milliseconds: 500),
      (timer) => _updateTime(),
    );
  }

  @override
  void dispose() {
    tCalc.timer?.cancel();
    super.dispose();
  }

  void _updateTime() {
    setState(() {
      tCalc.time = DateTime.now();
    });
  }

  @override
  Widget build(BuildContext context) {
    const double boxWidth = 350.0;
    const double boxHeightSpacing = 10.0;
    const double elv = 10.0;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final textFont = GoogleFonts.rosarioTextTheme();
    final shape = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15),
    );

    return SizedBox(
      width: boxWidth,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
        child: Card(
          shape: ShapeBorder.lerp(
            shape,
            shape,
            0.5,
          ),
          elevation: elv,
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
                    fontFamily: textFont.bodyLarge?.fontFamily,
                  ),
                ),
                const SizedBox(height: boxHeightSpacing),
                Text(
                  '28th December 2021',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: colorScheme.onPrimary,
                    fontSize: 20,
                    fontFamily: textFont.bodyMedium?.fontFamily,
                  ),
                ),
                const SizedBox(height: boxHeightSpacing),
                Icon(
                  Icons.favorite,
                  color: colorScheme.onPrimary,
                  size: 30,
                  semanticLabel: 'Heart',
                ),
                TextButton(
                  onPressed: () {
                    tCalc.perClickTimeIndex++;
                    if (tCalc.perClickTimeIndex == tCalc.timeNames.length + 1) {
                      tCalc.perClickTimeIndex = 0;
                    }
                  },
                  child: Text(
                    tCalc.perClickTimeIndex != tCalc.timeNames.length
                        ? tCalc.getCalcTimeToStrCycle()
                        : tCalc.getCalcTimeToStr(),
                    style: TextStyle(
                      color: colorScheme.onPrimary,
                      fontSize: 30,
                      fontFamily: textFont.bodyMedium?.fontFamily,
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
