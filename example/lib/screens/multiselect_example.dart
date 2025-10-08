// example/lib/screens/multiselect_example.dart

import 'package:flutter/material.dart';
import 'package:carbon_flutter/carbon_flutter.dart';

class MultiselectExample extends StatefulWidget {
  const MultiselectExample({super.key});
  @override
  State<MultiselectExample> createState() => _MultiselectExampleState();
}

class _MultiselectExampleState extends State<MultiselectExample> {
  List<String> _selected = ['option2'];

  final _items = const [
    CMultiselectItem(value: 'option1', text: 'Option 1'),
    CMultiselectItem(value: 'option2', text: 'Option 2'),
    CMultiselectItem(value: 'option3', text: 'Option 3'),
    CMultiselectItem(value: 'option4', text: 'Option 4'),
  ];

  @override
  Widget build(BuildContext context) {
    return CMultiselect<String>(
      labelText: 'Multiselect Label',
      items: _items,
      selectedItems: _selected,
      onChanged: (values) => setState(() => _selected = values),
    );
  }
}
