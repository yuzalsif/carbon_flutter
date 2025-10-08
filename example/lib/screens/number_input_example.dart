import 'package:flutter/material.dart';
import 'package:carbon_flutter/carbon_flutter.dart';

class NumberInputExample extends StatefulWidget {
  const NumberInputExample({super.key});
  @override
  State<NumberInputExample> createState() => _NumberInputExampleState();
}

class _NumberInputExampleState extends State<NumberInputExample> {
  num _value = 50;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CNumberInput(
          labelText: 'Number Input label',
          value: _value,
          onChanged: (value) => setState(() => _value = value),
        ),
        const SizedBox(height: CSpacing.large),
        CNumberInput(
          labelText: 'Disabled Number Input',
          value: 25,
          onChanged: (value) {},
          enabled: false,
        ),
      ],
    );
  }
}
