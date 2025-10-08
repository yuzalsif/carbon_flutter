import 'package:flutter/material.dart';
import 'package:carbon_flutter/carbon_flutter.dart';

class SearchExample extends StatelessWidget {
  const SearchExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CSearch(
          hintText: 'Search for users...',
          onChanged: (value) {
            // In a real app, you would filter a list here.
            print('Search query: $value');
          },
        ),
        const SizedBox(height: CSpacing.large),
        const CSearch(labelText: 'Disabled Search', enabled: false),
      ],
    );
  }
}
