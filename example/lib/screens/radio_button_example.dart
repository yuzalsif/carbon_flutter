import 'package:flutter/material.dart';
import 'package:carbon_flutter/carbon_flutter.dart';

enum RadioOptions { option1, option2, option3 }

class RadioButtonExample extends StatefulWidget {
  const RadioButtonExample({super.key});
  @override
  State<RadioButtonExample> createState() => _RadioButtonExampleState();
}

class _RadioButtonExampleState extends State<RadioButtonExample> {
  RadioOptions _groupValue = RadioOptions.option1;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CRadioButtonGroup<RadioOptions>(
          title: 'Radio button group',
          groupValue: _groupValue,
          onChanged: (value) => setState(() => _groupValue = value!),
          items: const [
            CRadioButtonItem(
              value: RadioOptions.option1,
              labelText: 'Option 1',
            ),
            CRadioButtonItem(
              value: RadioOptions.option2,
              labelText: 'Option 2',
            ),
            CRadioButtonItem(
              value: RadioOptions.option3,
              labelText: 'Option 3',
            ),
          ],
        ),
        const SizedBox(height: CSpacing.large),
        const CRadioButtonGroup<RadioOptions>(
          title: 'Disabled radio button group',
          groupValue: RadioOptions.option1,
          onChanged: null,
          enabled: false,
          items: [
            CRadioButtonItem(
              value: RadioOptions.option1,
              labelText: 'Option 1',
            ),
            CRadioButtonItem(
              value: RadioOptions.option2,
              labelText: 'Option 2',
            ),
          ],
        ),
      ],
    );
  }
}
