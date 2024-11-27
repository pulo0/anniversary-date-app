import 'dart:async';
import 'package:flutter/material.dart';
import 'package:anniversary_date_app/style/app_theme.dart';
import 'package:anniversary_date_app/logic/service_locator.dart';
import 'package:anniversary_date_app/tools/time_calculations.dart';

class DatePanel extends StatefulWidget {
  const DatePanel(
      {super.key, required this.dateState, required this.nameState});

  final String nameState;
  final DateTime dateState;

  @override
  State<DatePanel> createState() => _DatePanelState();
}

class _DatePanelState extends State<DatePanel> {
  final _tCalc = locator<TimeCalculations>();

  @override
  void initState() {
    super.initState();
    _tCalc.timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) => _updateTime(),
    );
  }

  @override
  void dispose() {
    _tCalc.timer?.cancel();
    super.dispose();
  }

  void _updateTime() {
    setState(() {
      _tCalc.time = DateTime.now();
    });
  }

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = mainTheme().colorScheme;
    final TextTheme textTheme = mainTheme().textTheme;

    const double boxWidth = 350.0;
    const double boxHeightSpacing = 10.0;

    return SizedBox(
      width: boxWidth,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(
                  widget.nameState,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: colorScheme.onPrimary,
                    fontSize: 20,
                    fontFamily: textTheme.bodyMedium!.fontFamily,
                  ),
                ),
                const SizedBox(height: boxHeightSpacing),
                Text(
                  _tCalc.getDateFormattedString(widget.dateState),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: colorScheme.onPrimary,
                    fontSize: 20,
                    fontFamily: textTheme.bodyMedium!.fontFamily,
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
                      _tCalc.perClickTimeIndex++;
                      if (_tCalc.perClickTimeIndex ==
                          _tCalc.timeNames.length + 1) {
                        _tCalc.perClickTimeIndex = 0;
                      }
                    });
                  },
                  child: Text(
                    _tCalc.perClickTimeIndex != _tCalc.timeNames.length
                        ? _tCalc.getCalcTimeToStrCycle(widget.dateState)
                        : _tCalc.getCalcTimeToStr(widget.dateState),
                    style: TextStyle(
                      color: colorScheme.onPrimary,
                      fontSize: 30,
                      fontFamily: textTheme.bodyLarge?.fontFamily,
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
