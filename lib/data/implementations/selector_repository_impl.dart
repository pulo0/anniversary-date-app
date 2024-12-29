import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:anniversary_date_app/style/app_theme.dart';
import 'package:anniversary_date_app/domain/repositories/selector_repository.dart';

class SelectorRepositoryImpl implements SelectorRepository {
  const SelectorRepositoryImpl();

  @override
  Future<void> openDateSelector(
    BuildContext context, {
    required DateTime rawDate,
    required DateTime initialAndLastDate,
    required DateTime firstDate,
    required Function(DateTime) onDateSelected,
    required TextEditingController controller,
  }) async {
    final newDate = await showDatePicker(
      context: context,
      initialDate: initialAndLastDate,
      firstDate: firstDate,
      lastDate: initialAndLastDate,
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData(
            useMaterial3: true,
            colorScheme: colorScheme,
          ),
          child: child!,
        );
      },
    );
    if (newDate == null) return;
    onDateSelected(newDate);
    controller.text = DateFormat('yyyy-MM-dd').format(newDate);
  }

  @override
  Future<void> openTimeSelector(
    BuildContext context, {
    required TimeOfDay rawTime,
    required TimeOfDay initialTime,
    required Function(TimeOfDay) onTimeSelected,
    required TextEditingController controller,
  }) async {
    final newTime = await showTimePicker(
      context: context,
      initialTime: initialTime,
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData(
            useMaterial3: true,
            colorScheme: colorScheme,
          ),
          child: child!,
        );
      },
    );
    if (newTime == null) return;
    if (context.mounted) {
      onTimeSelected(newTime);
      controller.text = newTime.format(context);
    }
  }
}
