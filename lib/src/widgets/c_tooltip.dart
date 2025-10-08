
import 'package:flutter/material.dart';
import 'package:carbon_flutter/carbon_flutter.dart';

/// A Carbon Design System compliant Tooltip.
///
/// Wraps a child widget and displays a message when the user
/// hovers over or long-presses the child.
class CTooltip extends StatelessWidget {
  const CTooltip({super.key, required this.message, required this.child});

  /// The text to display in the tooltip.
  final String message;

  /// The widget that the tooltip will be displayed for.
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: message,
      // Styling the tooltip to match Carbon's dark, square look.
      decoration: BoxDecoration(
        color: CColors.backgroundInverse.withValues(alpha: 0.9),
        borderRadius: BorderRadius.zero,
      ),
      textStyle: CTypography.label01.copyWith(
        color: CColors.textPrimaryInverse,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: CSpacing.medium,
        vertical: CSpacing.small,
      ),
      waitDuration: const Duration(milliseconds: 300), // Standard wait time
      child: child,
    );
  }
}
