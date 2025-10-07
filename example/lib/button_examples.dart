import 'package:flutter/material.dart';
import 'package:carbon_flutter/carbon_flutter.dart';


/// A widget that showcases the different types and states of [CButton].
class ButtonExample extends StatelessWidget {
  const ButtonExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Use a Text widget styled with our theme's typography
        Text('Buttons', style: CTypography.heading03),
        const SizedBox(height: CSpacing.medium),

        // --- Showcase Buttons in a Wrap widget for responsiveness ---
        Wrap(
          spacing: CSpacing.medium, // Horizontal space between buttons
          runSpacing: CSpacing.small, // Vertical space if they wrap
          children: [
            // --- Primary Buttons ---
            CButton(
              label: 'Primary button',
              onPressed: () => _showSnackbar(context, 'Primary button tapped!'),
            ),
            CButton(
              label: 'With icon',
              icon: const Icon(Icons.add),
              onPressed: () =>
                  _showSnackbar(context, 'Primary icon button tapped!'),
            ),
            const CButton(
              label: 'Primary disabled',
              onPressed: null, // Disables the button
            ),

            // --- Secondary Buttons ---
            CButton(
              label: 'Secondary button',
              type: CButtonType.secondary,
              onPressed: () =>
                  _showSnackbar(context, 'Secondary button tapped!'),
            ),
            CButton(
              label: 'Secondary disabled',
              type: CButtonType.secondary,
              onPressed: null,
            ),

            // --- Danger Buttons ---
            CButton(
              label: 'Danger button',
              type: CButtonType.danger,
              onPressed: () => _showSnackbar(context, 'Danger button tapped!'),
            ),
            CButton(
              label: 'Danger disabled',
              type: CButtonType.danger,
              onPressed: null,
            ),

            // --- Ghost Buttons ---
            CButton(
              label: 'Ghost button',
              type: CButtonType.ghost,
              onPressed: () => _showSnackbar(context, 'Ghost button tapped!'),
            ),
          ],
        ),

        const SizedBox(
          height: CSpacing.xLarge,
        ), // Space before the next component
      ],
    );
  }

  // Helper method to show feedback
  void _showSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), duration: const Duration(seconds: 1)),
    );
  }
}
