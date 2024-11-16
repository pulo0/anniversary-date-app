import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:anniversary_date_app/style/app_theme.dart';
import 'package:anniversary_date_app/tools/time_calculations.dart';
import 'package:anniversary_date_app/tools/name_helper.dart';
import 'package:anniversary_date_app/logic/date_state.dart';
import 'package:anniversary_date_app/logic/service_locator.dart';
import 'package:anniversary_date_app/logic/date_cubit.dart';

class DatePanel extends StatefulWidget {
  const DatePanel({super.key});

  @override
  State<DatePanel> createState() => _DatePanelState();
}

class _DatePanelState extends State<DatePanel> {
  final _tCalc = locator<TimeCalculations>();
  final _nameHelper = locator<NameHelper>();

  @override
  void initState() {
    super.initState();
    _tCalc.timer = Timer.periodic(
      const Duration(milliseconds: 500),
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

    return BlocProvider(
      create: (context) => DateCubit(_tCalc, _nameHelper)..initializeData(),
      child: BlocBuilder<DateCubit, DateState>(
        builder: (context, state) {
          if (state is InitialDateState) {
            return const Center(
              child: Text('Please enter new date!'),
            );
          } else if (state is AddedPrefDateState) {
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
                          _nameHelper.getNamePreference(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: colorScheme.onPrimary,
                            fontSize: 20,
                            fontFamily: textTheme.bodyMedium!.fontFamily,
                          ),
                        ),
                        const SizedBox(height: boxHeightSpacing),
                        Text(
                          _tCalc.getDateFormattedString(),
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
                                ? _tCalc.getCalcTimeToStrCycle()
                                : _tCalc.getCalcTimeToStr(),
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
          } else {
            return const Center(
              child: Text('Wrong state'),
            );
          }
        },
      ),
    );
  }
}
