import 'package:flutter/material.dart';
import 'package:carbon_flutter/carbon_flutter.dart';


/// A widget that showcases the [CBreadcrumb] component.
class BreadcrumbExample extends StatelessWidget {
  const BreadcrumbExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Breadcrumbs', style: CTypography.heading03),
        const SizedBox(height: CSpacing.medium),
        CBreadcrumb(
          items: [
            CBreadcrumbItem(text: 'Home', onTap: () {}),
            CBreadcrumbItem(text: 'Users', onTap: () {}),
            CBreadcrumbItem(text: 'Yusef'), // Last item has no onTap
          ],
        ),
        const SizedBox(height: CSpacing.xLarge),
      ],
    );
  }
}
