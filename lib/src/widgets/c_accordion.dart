import 'package:flutter/material.dart';
import 'package:carbon_flutter/src/theme/colors.dart';
import 'package:carbon_flutter/src/theme/spacing.dart';
import 'package:carbon_flutter/src/theme/typography.dart';

/// A Carbon Design System compliant Accordion.
///
/// Accordions are used to expand and collapse sections of content.
class CAccordion extends StatefulWidget {
  const CAccordion({
    super.key,
    required this.title,
    required this.children,
    this.initiallyExpanded = false,
  });

  /// The text displayed in the header of the accordion.
  final String title;

  /// The content to be displayed when the accordion is expanded.
  final List<Widget> children;

  /// Whether the accordion is expanded by default.
  final bool initiallyExpanded;

  @override
  State<CAccordion> createState() => _CAccordionState();
}

class _CAccordionState extends State<CAccordion> {
  late bool _isExpanded;

  @override
  void initState() {
    super.initState();
    _isExpanded = widget.initiallyExpanded;
  }

  void _toggleExpanded() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final headerColor = isDark
        ? CColors.backgroundComponentInverse
        : CColors.backgroundComponent;
    final borderColor = isDark ? CColors.borderInverse : CColors.borderSubtle;
    final textColor = isDark ? CColors.textPrimaryInverse : CColors.textPrimary;

    return Container(
      decoration: BoxDecoration(
        color: headerColor,
        border: Border(top: BorderSide(color: borderColor)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          InkWell(
            onTap: _toggleExpanded,
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: CSpacing.medium,
                vertical: CSpacing.medium,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.title,
                    style: CTypography.body01.copyWith(color: textColor),
                  ),
                  AnimatedRotation(
                    turns: _isExpanded ? 0.25 : 0, // Rotates 90 degrees
                    duration: const Duration(milliseconds: 200),
                    child: Icon(Icons.chevron_right, color: textColor),
                  ),
                ],
              ),
            ),
          ),
          AnimatedCrossFade(
            firstChild: const SizedBox(width: double.infinity),
            secondChild: Container(
              decoration: BoxDecoration(
                border: Border(top: BorderSide(color: borderColor)),
              ),
              padding: const EdgeInsets.all(CSpacing.medium),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: widget.children,
              ),
            ),
            crossFadeState: _isExpanded
                ? CrossFadeState.showSecond
                : CrossFadeState.showFirst,
            duration: const Duration(milliseconds: 200),
          ),
        ],
      ),
    );
  }
}
