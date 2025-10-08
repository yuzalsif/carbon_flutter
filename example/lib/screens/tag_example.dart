import 'package:flutter/material.dart';
import 'package:carbon_flutter/carbon_flutter.dart';

class TagExample extends StatelessWidget {
  const TagExample({super.key});

  @override
  Widget build(BuildContext context) {
    // Use a Wrap to display all tag variants.
    return Wrap(
      spacing: CSpacing.small,
      runSpacing: CSpacing.small,
      children: CTagColor.values.map((color) {
        // Simple way to get the enum name as a string
        final label = color.toString().split('.').last;
        return CTag(label: label, color: color);
      }).toList(),
    );
  }
}
