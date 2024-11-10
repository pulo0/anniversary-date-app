import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:anniversary_date_app/tools/name_helper.dart';
import 'package:anniversary_date_app/tools/time_calculations.dart';

class DatePanel extends StatefulWidget {
  const DatePanel({super.key});

  @override
  State<DatePanel> createState() => _DatePanelState();
}

class _DatePanelState extends State<DatePanel> {
  TimeCalculations tCalc = TimeCalculations();
  NameHelper nameHelper = NameHelper();

  @override
  void initState() {
    super.initState();
    tCalc.initializeEventDate();
    nameHelper.initializeEventName();
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
      tCalc.initializeEventDate();
      nameHelper.initializeEventName();
    });
  }

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final textFont = GoogleFonts.rosarioTextTheme();
    const double boxWidth = 350.0;
    const double boxHeightSpacing = 10.0;
    const double elv = 10.0;
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
                  nameHelper.getNamePreference(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: colorScheme.onPrimary,
                    fontSize: 20,
                    fontFamily: textFont.bodyLarge?.fontFamily,
                  ),
                ),
                const SizedBox(height: boxHeightSpacing),
                Text(
                  tCalc.getDateFormattedString(),
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
                    setState(() {
                      tCalc.perClickTimeIndex++;
                      if (tCalc.perClickTimeIndex ==
                          tCalc.timeNames.length + 1) {
                        tCalc.perClickTimeIndex = 0;
                      }
                    });
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
