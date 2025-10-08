import 'package:flutter/material.dart';
import 'package:carbon_flutter/carbon_flutter.dart';

/// An item to be used within a [CContainedList].
class CListItem extends StatelessWidget {
  const CListItem({super.key, required this.child, this.onTap});

  /// The primary content of the list item. Usually a [Text] widget.
  final Widget child;

  /// Called when the user taps this list item.
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(
          horizontal: CSpacing.medium,
          vertical: CSpacing.medium,
        ),
        child: DefaultTextStyle(style: CTypography.body01, child: child),
      ),
    );
  }
}

/// A Carbon Design System compliant Contained List.
///
/// A contained list is used to display a collection of related items.
class CContainedList extends StatelessWidget {
  const CContainedList({super.key, this.title, required this.items});

  /// An optional title displayed above the list.
  final String? title;

  /// The list of [CListItem] widgets to display.
  final List<CListItem> items;

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    final backgroundColor = isDark
        ? CColors.backgroundComponentInverse
        : CColors.background;
    final dividerColor = isDark ? CColors.borderInverse : CColors.borderSubtle;

    return Container(
      color: backgroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (title != null)
            Padding(
              padding: const EdgeInsets.all(CSpacing.medium),
              child: Text(
                title!,
                style: CTypography.label01.copyWith(
                  color: CColors.textSecondary,
                ),
              ),
            ),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: items.length,
            itemBuilder: (context, index) => items[index],
            separatorBuilder: (context, index) =>
                Divider(height: 1, thickness: 1, color: dividerColor),
          ),
        ],
      ),
    );
  }
}
