
import 'package:flutter/material.dart';
import 'package:carbon_flutter/carbon_flutter.dart';

/// A Carbon Design System compliant Content Switcher.
///
/// This is a stateful widget that manages the selected index internally.
class CContentSwitcher extends StatefulWidget {
  const CContentSwitcher({
    super.key,
    required this.options,
    required this.views,
    this.initialIndex = 0,
  });

  /// The list of text labels for each switcher option.
  final List<String> options;

  /// The list of widgets to display as content for each option.
  /// The length of [views] must match the length of [options].
  final List<Widget> views;

  /// The initially selected index.
  final int initialIndex;

  @override
  State<CContentSwitcher> createState() => _CContentSwitcherState();
}

class _CContentSwitcherState extends State<CContentSwitcher> {
  late int _selectedIndex;

  @override
  void initState() {
    super.initState();
    assert(widget.options.length == widget.views.length);
    _selectedIndex = widget.initialIndex;
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // The switcher control
        Container(
          height: 40,
          decoration: BoxDecoration(
            color: isDark
                ? CColors.backgroundComponentInverse
                : CColors.borderSubtle,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(widget.options.length, (index) {
              final bool isSelected = index == _selectedIndex;
              return Material(
                color: isSelected
                    ? CColors.backgroundComponent
                    : Colors.transparent,
                child: InkWell(
                  onTap: () => setState(() => _selectedIndex = index),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: CSpacing.medium,
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      widget.options[index],
                      style: CTypography.bodyCompact01.copyWith(
                        fontWeight: isSelected
                            ? FontWeight.w600
                            : FontWeight.normal,
                      ),
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
        // The content view
        Padding(
          padding: const EdgeInsets.only(top: CSpacing.medium),
          child: IndexedStack(index: _selectedIndex, children: widget.views),
        ),
      ],
    );
  }
}
