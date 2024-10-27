import 'package:flutter/material.dart';
import 'package:anniversary_date_app/style/app_theme.dart';

class CustomInputField extends StatelessWidget {
  final TextEditingController controller;
  final String labelTxt;
  final String hintTxt;
  final bool isInputText;
  final Icon? icon;
  final void Function()? showPicker;

  const CustomInputField({
    super.key,
    required this.controller,
    required this.labelTxt,
    required this.hintTxt,
    required this.isInputText,
    this.showPicker,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    const double radius = 4;
    const double opacity = 0.65;
    const double allPadding = 10;
    const int max = 40;

    return TextField(
      controller: controller,
      autocorrect: isInputText ? true : false,
      maxLength: isInputText ? max : null,
      onTap: isInputText ? null : showPicker,
      readOnly: isInputText ? false : true,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: colorScheme.primary,
          ),
        ),
        // fillColor: Colors.transparent,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        labelText: labelTxt,
        icon: icon,
        hintText: hintTxt,
        hintStyle: TextStyle(
          color: colorScheme.outline.withOpacity(opacity),
        ),
        filled: true,
        // fillColor: colorScheme.onTertiary,
        contentPadding: const EdgeInsets.all(allPadding),
      ),
    );
  }
}
