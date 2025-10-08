import 'package:flutter/material.dart';
import 'package:carbon_flutter/carbon_flutter.dart';

/// A Carbon Design System compliant Tab bar and Tab view.
///
/// This widget requires a [DefaultTabController] to be an ancestor in the widget tree.
class CTabs extends StatelessWidget {
  const CTabs({super.key, required this.tabs, required this.views});

  /// The list of text labels for each tab.
  final List<String> tabs;

  /// The list of widgets to display as content for each tab.
  /// The length of [views] must match the length of [tabs].
  final List<Widget> views;

  @override
  Widget build(BuildContext context) {
    assert(tabs.length == views.length);

    final isDark = Theme.of(context).brightness == Brightness.dark;
    final unselectedLabelColor = isDark
        ? CColors.textSecondaryInverse
        : CColors.textSecondary;
    final labelColor = isDark
        ? CColors.textPrimaryInverse
        : CColors.textPrimary;
    final indicatorColor = CColors.primary;
    final dividerColor = isDark ? CColors.borderInverse : CColors.borderSubtle;

    return Column(
      children: [
        TabBar(
          isScrollable: true,
          labelPadding: const EdgeInsets.symmetric(
            horizontal: CSpacing.medium,
            vertical: 10,
          ),
          labelStyle: CTypography.bodyCompact01,
          unselectedLabelColor: unselectedLabelColor,
          labelColor: labelColor,
          indicator: UnderlineTabIndicator(
            borderSide: BorderSide(color: indicatorColor, width: 2.0),
            insets: const EdgeInsets.symmetric(horizontal: CSpacing.medium),
          ),
          dividerColor: dividerColor,
          tabs: tabs.map((label) => Tab(text: label)).toList(),
        ),
        Expanded(child: TabBarView(children: views)),
      ],
    );
  }
}
