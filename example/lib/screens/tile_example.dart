import 'package:flutter/material.dart';
import 'package:carbon_flutter/carbon_flutter.dart';

class TileExample extends StatelessWidget {
  const TileExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Clickable Tile', style: CTypography.heading03),
        const SizedBox(height: CSpacing.medium),
        CClickableTile(
          onTap: () {
            CSnackbar.show(context, title: 'Tile tapped!');
          },
          child: const Text('This is a clickable tile.'),
        ),
        const SizedBox(height: CSpacing.large),

        Text('Expandable Tile', style: CTypography.heading03),
        const SizedBox(height: CSpacing.medium),
        CExpandableTile(
          title: 'Expandable Tile Title',
          expandedContent: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('This is the expanded content.'),
              const SizedBox(height: CSpacing.medium),
              CButton(
                label: 'Action',
                onPressed: () {},
                type: CButtonType.secondary,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
