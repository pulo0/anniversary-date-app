import 'package:anniversary_date_app/style/app_theme.dart';
import 'package:flutter/material.dart';

class AddDate extends StatefulWidget {
  const AddDate({super.key});

  @override
  State<StatefulWidget> createState() => _AddDateState();
}

class _AddDateState extends State<AddDate> {
  final double horPadding = 30;
  final double verPadding = 45;
  final _nameController = TextEditingController();
  DateTime? _selectedDateTime;

  @override
  Widget build(BuildContext context) {
    final keyboardPlacement = MediaQuery.of(context).viewInsets.bottom;
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(horPadding, verPadding, horPadding,
                keyboardPlacement + verPadding),
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
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    labelText: 'Name',
                    hintText: 'Special event',
                    hintTextDirection: TextDirection.ltr,
                    hintStyle: TextStyle(
                      color: colorScheme.outline.withOpacity(0.65),
                    ),
                    filled: true,
                    // fillColor: colorScheme.onTertiary,
                    contentPadding: const EdgeInsets.all(10),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
