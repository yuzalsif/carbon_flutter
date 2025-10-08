import 'package:flutter/material.dart';
import 'package:carbon_flutter/carbon_flutter.dart';

class ContentSwitcherExample extends StatelessWidget {
  const ContentSwitcherExample({super.key});

  @override
  Widget build(BuildContext context) {
    return CContentSwitcher(
      options: const ['First section', 'Second section', 'Third section'],
      views: [
        _buildView('Content for the first section.'),
        _buildView('Content for the second section.'),
        _buildView('Content for the third section.'),
      ],
    );
  }

  Widget _buildView(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: CSpacing.small),
      child: Text(text, style: CTypography.body01),
    );
  }
}
