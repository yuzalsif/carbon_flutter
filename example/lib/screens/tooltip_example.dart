import 'package:flutter/material.dart';
import 'package:carbon_flutter/carbon_flutter.dart';

class TooltipExample extends StatelessWidget {
  const TooltipExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Hover over or long-press the icons.'),
        const SizedBox(height: CSpacing.large),
        Row(
          children: [
            const CTooltip(
              message: 'This is a tooltip for an icon button.',
              child: CButton(
                icon: Icon(Icons.info_outline),
                label: '', // Icon-only button
                onPressed: null, // Often used on disabled or static items
                type: CButtonType.ghost,
              ),
            ),
            const SizedBox(width: CSpacing.medium),
            CTooltip(
              message: 'This tooltip is for a text element.',
              child: Text(
                'Some text here',
                style: CTypography.body01.copyWith(
                  decoration: TextDecoration.underline,
                  decorationStyle: TextDecorationStyle.dotted,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
