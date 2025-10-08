import 'package:flutter/material.dart';
import 'package:carbon_flutter/carbon_flutter.dart';

class SliderExample extends StatefulWidget {
  const SliderExample({super.key});
  @override
  State<SliderExample> createState() => _SliderExampleState();
}

class _SliderExampleState extends State<SliderExample> {
  double _value = 50.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CSlider(
          labelText: 'Slider label',
          value: _value,
          onChanged: (value) => setState(() => _value = value),
        ),
        const SizedBox(height: CSpacing.large),
        CSlider(
          labelText: 'Disabled slider',
          value: 25.0,
          onChanged: (value) {},
          enabled: false,
        ),
      ],
    );
  }
}
