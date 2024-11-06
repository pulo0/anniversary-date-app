import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:anniversary_date_app/widgets/custom_input_field.dart';

class DateBottomSheet extends StatefulWidget {
  const DateBottomSheet({super.key});

  @override
  State<DateBottomSheet> createState() => _DateBottomSheetState();
}

class _DateBottomSheetState extends State<DateBottomSheet> {
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
    );
    if (newDate == null) return;
    _dateController.text = DateFormat('yyyy-MM-dd').format(newDate);
  }

  _openTimeSelector(BuildContext context) async {
    final newTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (newTime == null) return;
    if(context.mounted) {
      _timeController.text = newTime.format(context);
    }
  }
}
