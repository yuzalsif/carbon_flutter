import 'package:flutter/material.dart';
import 'package:carbon_flutter/carbon_flutter.dart';

class ProgressIndicatorExample extends StatelessWidget {
  const ProgressIndicatorExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Horizontal', style: CTypography.heading03),
        const SizedBox(height: CSpacing.medium),
        const CProgressIndicator(
          steps: [
            CProgressStep(label: 'First step', isComplete: true),
            CProgressStep(label: 'Second step', isCurrent: true),
            CProgressStep(label: 'Third step'),
            CProgressStep(label: 'Fourth step', isDisabled: true),
          ],
        ),
        const SizedBox(height: CSpacing.xxLarge),

        Text('Vertical', style: CTypography.heading03),
        const SizedBox(height: CSpacing.medium),
        const CProgressIndicator(
          isVertical: true,
          steps: [
            CProgressStep(label: 'First step', isComplete: true),
            CProgressStep(label: 'Second step', isCurrent: true),
            CProgressStep(label: 'Third step'),
          ],
        ),
      ],
    );
  }
}
