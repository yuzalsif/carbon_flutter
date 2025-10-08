import 'package:flutter/material.dart';
import 'package:carbon_flutter/carbon_flutter.dart';

class LoadingExample extends StatelessWidget {
  const LoadingExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Large Spinner', style: CTypography.heading03),
        const SizedBox(height: CSpacing.medium),
        const CLoading(size: CLoadingSize.large),
        const SizedBox(height: CSpacing.large),

        Text('Small Spinner', style: CTypography.heading03),
        const SizedBox(height: CSpacing.medium),
        const CLoading(size: CLoadingSize.small),
        const SizedBox(height: CSpacing.large),

        Text('Overlay Example', style: CTypography.heading03),
        const SizedBox(height: CSpacing.medium),
        const Text('The spinner below is in a 150x150 box.'),
        const SizedBox(height: CSpacing.small),
        SizedBox(
          width: 150,
          height: 150,
          // Stack allows the overlay to cover the content
          child: Stack(
            children: [
              // Some background content
              Container(
                color: CColors.backgroundComponent,
                child: const Center(child: Text('Content')),
              ),
              // The loading overlay
              const CLoading(isOverlay: true),
            ],
          ),
        ),
      ],
    );
  }
}
