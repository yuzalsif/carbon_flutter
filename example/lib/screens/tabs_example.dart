import 'package:flutter/material.dart';
import 'package:carbon_flutter/carbon_flutter.dart';

class TabsExample extends StatelessWidget {
  const TabsExample({super.key});

  @override
  Widget build(BuildContext context) {
    // CTabs requires a DefaultTabController.
    return DefaultTabController(
      length: 3,
      child: SizedBox(
        // Give the example a constrained height to show it works within a layout.
        height: 200,
        child: CTabs(
          tabs: const ['Tab 1', 'Tab 2', 'Tab 3 with a longer name'],
          views: [
            _buildTabView('Content for Tab 1'),
            _buildTabView('Content for Tab 2'),
            _buildTabView('Content for Tab 3'),
          ],
        ),
      ),
    );
  }

  Widget _buildTabView(String content) {
    return Padding(
      padding: const EdgeInsets.all(CSpacing.medium),
      child: Text(content, style: CTypography.body01),
    );
  }
}
