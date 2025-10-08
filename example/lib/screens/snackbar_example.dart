import 'package:flutter/material.dart';
import 'package:carbon_flutter/carbon_flutter.dart';

/// A widget that showcases how to trigger [CSnackbar] notifications.
class SnackbarExample extends StatelessWidget {
  const SnackbarExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Snackbars (Toast Notifications)', style: CTypography.heading03),
        const SizedBox(height: CSpacing.medium),
        Wrap(
          spacing: CSpacing.medium,
          runSpacing: CSpacing.small,
          children: [
            CButton(
              label: 'Show Info',
              type: CButtonType.secondary,
              onPressed: () => CSnackbar.show(
                context,
                title: 'This is an informational message.',
                subtitle: 'It provides additional details for the user.',
                type: CSnackbarType.info,
              ),
            ),
            CButton(
              label: 'Show Success',
              type: CButtonType.secondary,
              onPressed: () => CSnackbar.show(
                context,
                title: 'Action Successful',
                type: CSnackbarType.success,
              ),
            ),
            CButton(
              label: 'Show Warning',
              type: CButtonType.secondary,
              onPressed: () => CSnackbar.show(
                context,
                title: 'Warning: Please review your input.',
                type: CSnackbarType.warning,
              ),
            ),
            CButton(
              label: 'Show Error',
              type: CButtonType.secondary,
              onPressed: () => CSnackbar.show(
                context,
                title: 'Error: Could not complete the request.',
                subtitle: 'The server returned a 500 error.',
                type: CSnackbarType.error,
              ),
            ),
          ],
        ),
        const SizedBox(height: CSpacing.xLarge),
      ],
    );
  }
}
