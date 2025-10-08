import 'package:flutter/material.dart';
import 'package:carbon_flutter/carbon_flutter.dart';

class PaginationExample extends StatefulWidget {
  const PaginationExample({super.key});
  @override
  State<PaginationExample> createState() => _PaginationExampleState();
}

class _PaginationExampleState extends State<PaginationExample> {
  int _currentPage = 1;
  final int _totalItems = 123;
  final int _itemsPerPage = 10;

  @override
  Widget build(BuildContext context) {
    // In a real app, this would be your data for the current page
    final List<String> currentPageData = List.generate(_itemsPerPage, (index) {
      final itemNumber = (_currentPage - 1) * _itemsPerPage + index + 1;
      return itemNumber <= _totalItems ? 'Item $itemNumber' : '';
    }).where((item) => item.isNotEmpty).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Display the data for the current page
        CContainedList(
          title: 'Current Page Data',
          items: currentPageData
              .map((item) => CListItem(child: Text(item)))
              .toList(),
        ),
        const SizedBox(height: CSpacing.medium),

        // The Pagination widget
        CPagination(
          currentPage: _currentPage,
          totalItems: _totalItems,
          itemsPerPage: _itemsPerPage,
          onPageChanged: (newPage) {
            setState(() {
              _currentPage = newPage;
            });
            CSnackbar.show(context, title: 'Navigated to page $newPage');
          },
        ),
      ],
    );
  }
}
