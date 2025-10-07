import 'package:flutter/material.dart';
import 'package:carbon_flutter/src/theme/colors.dart';
import 'package:carbon_flutter/src/theme/spacing.dart';
import 'package:carbon_flutter/src/theme/typography.dart';

/// A Carbon Design System compliant Toggle switch.
///
/// Toggles are used to switch between two states, often on or off.
class CToggle extends StatelessWidget {
  const CToggle({
    super.key,
    required this.value,
    required this.onChanged,
    this.labelText,
    this.enabled = true,
  });

  /// The text that is displayed to the side of the toggle.
  final String? labelText;

  /// Whether this toggle is on or off.
  final bool value;

  /// Called when the user taps the toggle.
  final ValueChanged<bool>? onChanged;

  /// Whether the toggle is interactive. If false, the toggle is disabled.
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    final bool isEnabled = enabled && onChanged != null;

    // --- Define Colors based on State ---
    final Color trackColor = value
        ? CColors.primary
        : isDark
        ? CColors.borderInverse
        : CColors.borderStrong;

    final Color thumbColor = isEnabled
        ? CColors.backgroundComponent
        : isDark
        ? CColors.borderInverse
        : CColors.borderStrong;

    final Color labelColor = isEnabled
        ? (isDark ? CColors.textPrimaryInverse : CColors.textPrimary)
        : (isDark ? CColors.textDisabledInverse : CColors.textDisabled);

    return Opacity(
      opacity: isEnabled ? 1.0 : 0.5,
      child: InkWell(
        onTap: isEnabled ? () => onChanged!(!value) : null,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            // --- The Toggle Switch UI ---
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeInOut,
              width: 48,
              height: 24,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: trackColor,
              ),
              child: AnimatedAlign(
                duration: const Duration(milliseconds: 200),
                curve: Curves.easeInOut,
                alignment: value ? Alignment.centerRight : Alignment.centerLeft,
                child: Container(
                  width: 18,
                  height: 18,
                  margin: const EdgeInsets.symmetric(horizontal: 3),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: thumbColor,
                  ),
                ),
              ),
            ),

            // --- The Label ---
            if (labelText != null) ...[
              const SizedBox(width: CSpacing.medium),
              Text(
                labelText!,
                style: CTypography.body01.copyWith(color: labelColor),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
