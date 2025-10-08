import 'package:flutter/material.dart';
import 'package:carbon_flutter/carbon_flutter.dart';

class ListExample extends StatelessWidget {
  const ListExample({super.key});

  @override
  Widget build(BuildContext context) {
    return CContainedList(
      title: 'My List',
      items: [
        CListItem(
          child: const Text('List item 1'),
          onTap: () => CSnackbar.show(context, title: 'Tapped item 1'),
        ),
        CListItem(
          child: const Text('List item 2'),
          onTap: () => CSnackbar.show(context, title: 'Tapped item 2'),
        ),
        CListItem(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Item with actions'),
              CToggle(value: true, onChanged: (val) {}),
            ],
          ),
        ),
        const CListItem(
          child: Text('Non-interactive item'),
          // No onTap makes it non-interactive
        ),
      ],
    );
  }
}
