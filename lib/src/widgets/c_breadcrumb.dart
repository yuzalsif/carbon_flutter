import 'package:flutter/material.dart';
import 'package:carbon_flutter/src/theme/colors.dart';
import 'package:carbon_flutter/src/theme/spacing.dart';
import 'package:carbon_flutter/src/theme/typography.dart';

/// A data model for an item within a [CBreadcrumb].
class CBreadcrumbItem {
  const CBreadcrumbItem({required this.text, this.onTap});

  /// The text to display for this breadcrumb item.
  final String text;

  /// The callback to be executed when the item is tapped.
  /// If null, the item is treated as non-interactive (e.g., the current page).
  final VoidCallback? onTap;
}

/// A Carbon Design System compliant Breadcrumb.
///
/// Breadcrumbs are a navigational aid to help users keep track of their
/// location within an app.
class CBreadcrumb extends StatelessWidget {
  const CBreadcrumb({super.key, required this.items});

  /// The list of [CBreadcrumbItem]s to display.
  final List<CBreadcrumbItem> items;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final separatorColor = isDark
        ? CColors.textSecondaryInverse
        : CColors.textSecondary;
    final currentPageColor = isDark
        ? CColors.textPrimaryInverse
        : CColors.textPrimary;
    final linkColor = CColors.primary;

    // Build the list of widgets dynamically, including separators.
    final List<Widget> children = [];
    for (int i = 0; i < items.length; i++) {
      final item = items[i];
      final bool isLast = i == items.length - 1;

      children.add(
        InkWell(
          onTap: item.onTap,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          hoverColor: CColors.primary.withValues(alpha: 0.1),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: CSpacing.xSmall),
            child: Text(
              item.text,
              style: CTypography.bodyCompact01.copyWith(
                color: isLast ? currentPageColor : linkColor,
              ),
            ),
          ),
        ),
      );

      // Add a separator after each item except the last one.
      if (!isLast) {
        children.add(
          Text(
            '/',
            style: CTypography.bodyCompact01.copyWith(color: separatorColor),
          ),
        );
      }
    }

    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      children: children,
    );
  }
}
