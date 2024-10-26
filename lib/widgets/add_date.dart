import 'package:anniversary_date_app/style/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddDate extends StatefulWidget {
  const AddDate({super.key});

  @override
  State<StatefulWidget> createState() => _AddDateState();
}

class _AddDateState extends State<AddDate> {
  final double horPadding = 30;
  final double verPadding = 45;
  final double radius = 4;
  final double opacity = 0.65;
  final double allPadding = 10;
  final _nameController = TextEditingController();
  final _dateController = TextEditingController();
  final DateTime dateNow = DateTime.now();
  final DateTime dateLast = DateTime(1800);
  DateTime? selectedDateTime;

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
                TextField(
                  controller: _nameController,
                  autocorrect: true,
                  maxLength: 40,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: colorScheme.primary,
                      ),
                    ),
                    // fillColor: Colors.transparent,
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    labelText: 'Name',
                    hintText: 'Special event',
                    hintStyle: TextStyle(
                      color: colorScheme.outline.withOpacity(opacity),
                    ),
                    filled: true,
                    // fillColor: colorScheme.onTertiary,
                    contentPadding: EdgeInsets.all(allPadding),
                  ),
                ),
                TextField(
                  controller: _dateController,
                  onTap: () => _openDateSelector(context),
                  readOnly: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: colorScheme.primary,
                      ),
                    ),
                    // fillColor: Colors.transparent,
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    labelText: 'Date',
                    icon: const Icon(Icons.date_range_rounded),
                    filled: true,
                    // fillColor: colorScheme.onTertiary,
                    contentPadding: EdgeInsets.all(allPadding),
                  ),
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
}
