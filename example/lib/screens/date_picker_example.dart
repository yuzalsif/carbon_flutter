import 'package:flutter/material.dart';
import 'package:carbon_flutter/carbon_flutter.dart';

class DatePickerExample extends StatefulWidget {
  const DatePickerExample({super.key});
  @override
  State<DatePickerExample> createState() => _DatePickerExampleState();
}

class _DatePickerExampleState extends State<DatePickerExample> {
  DateTime? _selectedDate;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CDatePicker(
          labelText: 'Date Picker',
          initialDate: _selectedDate,
          onDateSelected: (date) {
            setState(() => _selectedDate = date);
            CSnackbar.show(
              context,
              title: 'Selected: ${date.toLocal()}'.split(' ')[0],
            );
          },
        ),
        const SizedBox(height: CSpacing.large),
        CDatePicker(
          labelText: 'Disabled Date Picker',
          onDateSelected: (date) {},
          enabled: false,
        ),
      ],
    );
  }
}
