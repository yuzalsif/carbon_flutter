import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:carbon_flutter/carbon_flutter.dart';

/// A Carbon Design System compliant Pagination control.
class CPagination extends StatelessWidget {
  const CPagination({
    super.key,
    required this.currentPage,
    required this.totalItems,
    required this.itemsPerPage,
    required this.onPageChanged,
  });

  /// The currently selected page (1-based index).
  final int currentPage;

  /// The total number of items in the dataset.
  final int totalItems;

  /// The number of items displayed on each page.
  final int itemsPerPage;

  /// A callback that is fired when the user selects a new page.
  /// The new page number (1-based) is passed as an argument.
  final ValueChanged<int> onPageChanged;

  @override
  Widget build(BuildContext context) {
    if (totalItems <= 0 || itemsPerPage <= 0) {
      return const SizedBox.shrink();
    }

    final int totalPages = (totalItems / itemsPerPage).ceil();

    if (totalPages <= 1) {
      return const SizedBox.shrink();
    }

    final int startItem = (currentPage - 1) * itemsPerPage + 1;
    final int endItem = math.min(currentPage * itemsPerPage, totalItems);

    final bool isFirstPage = currentPage == 1;
    final bool isLastPage = currentPage == totalPages;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Page size (optional in Carbon, but good for context)
        // You could add a Dropdown here to change itemsPerPage
        Text('$itemsPerPage items per page', style: CTypography.label01),

        // Navigation controls
        Row(
          children: [
            // Current range display
            Text(
              '$startItem–$endItem of $totalItems',
              style: CTypography.label01,
            ),
            const SizedBox(width: CSpacing.large),

            // Back button
            _buildNavButton(
              icon: Icons.chevron_left,
              enabled: !isFirstPage,
              onPressed: () => onPageChanged(currentPage - 1),
            ),
            const SizedBox(width: 2),

            // Forward button
            _buildNavButton(
              icon: Icons.chevron_right,
              enabled: !isLastPage,
              onPressed: () => onPageChanged(currentPage + 1),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildNavButton({
    required IconData icon,
    required bool enabled,
    required VoidCallback onPressed,
  }) {
    return SizedBox(
      width: 48,
      height: 48,
      child: CButton(
        icon: Icon(icon),
        label: '',
        onPressed: enabled ? onPressed : null,
        type: CButtonType.ghost,
      ),
    );
  }
}
