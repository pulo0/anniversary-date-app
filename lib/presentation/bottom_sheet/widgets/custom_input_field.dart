import 'package:flutter/material.dart';

class CustomInputField extends StatelessWidget {
  final TextEditingController controller;
  final String labelTxt;
  final String hintTxt;
  final bool isInputText;
  final Icon? icon;
  final void Function()? showPicker;
  final String? Function(String?)? validator;

  const CustomInputField({
    super.key,
    required this.controller,
    required this.labelTxt,
    required this.hintTxt,
    required this.isInputText,
    this.showPicker,
    this.validator,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    const int maxLetterCount = 40;

    return TextFormField(
      controller: controller,
      autocorrect: isInputText ? true : false,
      maxLength: isInputText ? maxLetterCount : null,
      onTap: isInputText ? null : showPicker,
      readOnly: isInputText ? false : true,
      decoration: InputDecoration(
        labelText: labelTxt,
        icon: icon,
        hintText: hintTxt,
      ),
      validator: validator,
    );
  }
}
