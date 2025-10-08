import 'package:flutter/material.dart';
import 'package:carbon_flutter/carbon_flutter.dart';

class DropdownExample extends StatefulWidget {
  const DropdownExample({super.key});
  @override
  State<DropdownExample> createState() => _DropdownExampleState();
}

class _DropdownExampleState extends State<DropdownExample> {
  String _selectedValue = 'option2';

  final _items = const [
    CDropdownItem(value: 'option1', text: 'Option 1'),
    CDropdownItem(
      value: 'option2',
      text: 'Option 2 (A much longer option to test sizing)',
    ),
    CDropdownItem(value: 'option3', text: 'Option 3'),
    CDropdownItem(value: 'option4', text: 'Option 4'),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CDropdown<String>(
          labelText: 'Dropdown label',
          hintText: 'Select an option',
          items: _items,
          value: _selectedValue,
          onChanged: (value) => setState(() => _selectedValue = value!),
        ),
        const SizedBox(height: CSpacing.large),
        CDropdown<String>(
          labelText: 'Disabled dropdown',
          items: _items,
          value: 'option1',
          onChanged: (value) {},
          enabled: false,
        ),
      ],
    );
  }
}
