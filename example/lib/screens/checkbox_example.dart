import 'package:flutter/material.dart';
import 'package:carbon_flutter/carbon_flutter.dart';

class CheckboxExample extends StatefulWidget {
  const CheckboxExample({super.key});

  @override
  State<CheckboxExample> createState() => _CheckboxExampleState();
}

class _CheckboxExampleState extends State<CheckboxExample> {
  bool _value1 = false;
  bool _value2 = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CCheckbox(
          labelText: 'Unchecked',
          value: _value1,
          onChanged: (value) => setState(() => _value1 = value!),
        ),
        const SizedBox(height: CSpacing.medium),
        CCheckbox(
          labelText: 'Checked',
          value: _value2,
          onChanged: (value) => setState(() => _value2 = value!),
        ),
        const SizedBox(height: CSpacing.medium),
        const CCheckbox(
          labelText: 'Disabled',
          value: false,
          onChanged: null,
          enabled: false,
        ),
      ],
    );
  }
}
