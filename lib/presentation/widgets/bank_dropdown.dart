import 'package:flutter/material.dart';

class BankDropdown extends StatelessWidget {
  final String? value;
  final Function(String?) onChanged;

  const BankDropdown({super.key, required this.value, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: value,
      decoration: const InputDecoration(labelText: "Bank Name"),
      items: ['Bank A', 'Bank B', 'Bank C'].map((bank) {
        return DropdownMenuItem(value: bank, child: Text(bank));
      }).toList(),
      onChanged: onChanged,
      validator: (val) => val == null ? "Bank Name is required" : null,
    );
  }
}
