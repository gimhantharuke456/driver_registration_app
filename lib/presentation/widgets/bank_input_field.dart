import 'package:flutter/material.dart';

class BankInputField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final String? Function(String?) validator;
  final TextInputType inputType;

  const BankInputField({
    super.key,
    required this.label,
    required this.controller,
    required this.validator,
    this.inputType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(labelText: label),
      keyboardType: inputType,
      validator: validator,
    );
  }
}
