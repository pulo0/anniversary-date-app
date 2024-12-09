import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:anniversary_date_app/style/app_theme.dart';
import 'package:anniversary_date_app/presentation/bottom_sheet/widgets/custom_input_field.dart';
import 'package:anniversary_date_app/presentation/date/cubit/date_cubit.dart';
import 'package:anniversary_date_app/data/service/service_locator.dart';
import 'package:anniversary_date_app/utils/shared_date_preferences.dart';

class DateBottomSheet extends StatefulWidget {
  const DateBottomSheet(this._dateCubit, {super.key});

  final DateCubit _dateCubit;

  @override
  State<DateBottomSheet> createState() => _DateBottomSheetState();
}

class _DateBottomSheetState extends State<DateBottomSheet> {
  final _sharedPrefs = locator<SharedDatePreferences>();

  TimeOfDay rawTime = TimeOfDay.now();
  DateTime rawDate = DateTime.now();

  final double horPadding = 30;
  final double verPadding = 45;
  final _nameController = TextEditingController();
  final _dateController = TextEditingController();
  final _timeController = TextEditingController();
  final DateTime dateNow = DateTime.now();
  final DateTime dateLast = DateTime(1800);
  DateTime? selectedDateTime;

  @override
  void dispose() {
    _nameController.dispose();
    _dateController.dispose();
    _timeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final keyboardPlacement = MediaQuery.of(context).viewInsets.bottom;
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.fromLTRB(
              horPadding,
              verPadding,
              horPadding,
              keyboardPlacement + verPadding,
            ),
            child: Column(
              children: <Widget>[
                CustomInputField(
                  controller: _nameController,
                  labelTxt: 'Name',
                  hintTxt: 'Special event name',
                  isInputText: true,
                ),
                CustomInputField(
                  controller: _dateController,
                  labelTxt: 'Date',
                  hintTxt: 'Select date of event',
                  isInputText: false,
                  icon: const Icon(Icons.date_range_outlined),
                  showPicker: () => _openDateSelector(context),
                ),
                const SizedBox(height: 16),
                CustomInputField(
                  controller: _timeController,
                  labelTxt: 'Time',
                  hintTxt: 'Select time of your date',
                  isInputText: false,
                  icon: const Icon(Icons.access_time),
                  showPicker: () => _openTimeSelector(context),
                ),
                const SizedBox(height: 16),
                Row(
                  children: <Widget>[
                    OutlinedButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text('Back'),
                    ),
                    const Spacer(),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          final formattedDate = DateTime(
                                  rawDate.year,
                                  rawDate.month,
                                  rawDate.day,
                                  rawTime.hour,
                                  rawTime.minute)
                              .millisecondsSinceEpoch;
                          _sharedPrefs.saveNameValue(_nameController.text);
                          _sharedPrefs.saveDateValue(formattedDate);
                          widget._dateCubit.initializeData();
                          Navigator.of(context).pop();
                        });
                      },
                      child: const Text('Add date'),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }

  _openDateSelector(BuildContext context) async {
    final newDate = await showDatePicker(
        context: context,
        initialDate: dateNow,
        firstDate: dateLast,
        lastDate: dateNow,

        builder: (BuildContext context, Widget? child) {
          return Theme(
            data: ThemeData(
              useMaterial3: true,
              colorScheme: colorScheme,
            ),
            child: child!,
          );
        });
    if (newDate == null) return;
    rawDate = newDate;
    _dateController.text = DateFormat('yyyy-MM-dd').format(newDate);
  }

  _openTimeSelector(BuildContext context) async {
    final newTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
        builder: (BuildContext context, Widget? child) {
          return Theme(
            data: ThemeData(
              useMaterial3: true,
              colorScheme: colorScheme,
            ),
            child: child!,
          );
        });

    if (newTime == null) return;
    if (context.mounted) {
      rawTime = newTime;
      _timeController.text = newTime.format(context);
    }
  }
}
