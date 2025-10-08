import 'package:flutter/material.dart';
import 'package:carbon_flutter/carbon_flutter.dart';


/// A widget that showcases the [CAccordion] component.
class AccordionExample extends StatelessWidget {
  const AccordionExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Accordions', style: CTypography.heading03),
        const SizedBox(height: CSpacing.medium),
        const CAccordion(
          title: 'Section 1: Getting Started',
          children: [
            Text(
              'This is the content for the first section. It can contain any widget.',
              style: CTypography.body01,
            ),
          ],
        ),
        CAccordion(
          title: 'Section 2: Advanced Topics',
          initiallyExpanded: true,
          children: [
            Text(
              'This section starts expanded by default.',
              style: CTypography.body01,
            ),
            SizedBox(height: CSpacing.medium),
            CButton(label: 'A button can go here', onPressed: () {}),
          ],
        ),
        const SizedBox(height: CSpacing.xLarge),
      ],
    );
  }
}
