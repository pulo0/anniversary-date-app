import 'package:flutter/material.dart';

abstract class SelectorRepository {
  Future<void> openDateSelector(
    BuildContext context, {
    required DateTime rawDate,
    required DateTime initialAndLastDate,
    required DateTime firstDate,
    required Function(DateTime) onDateSelected,
    required TextEditingController controller,
  });

  Future<void> openTimeSelector(
    BuildContext context, {
    required TimeOfDay rawTime,
    required TimeOfDay initialTime,
    required Function(TimeOfDay) onTimeSelected,
    required TextEditingController controller,
  });
}
