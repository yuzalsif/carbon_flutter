import 'package:flutter/material.dart';

import 'package:carbon_flutter/carbon_flutter.dart';

/// A Carbon Design System compliant text input field.
///
/// This widget is a complete form field, including a label, helper text,
/// and error handling. It is built on top of Flutter's [TextField] and
/// styled according to the Carbon specifications.
class CTextInput extends StatelessWidget {
  const CTextInput({
    super.key,
    required this.labelText,
    this.controller,
    this.hintText,
    this.helperText,
    this.errorText,
    this.onChanged,
    this.obscureText = false,
  });

  /// The text that is displayed above the input field.
  final String labelText;

  /// Controls the text being edited.
  ///
  /// If null, this widget will create its own [TextEditingController].
  final TextEditingController? controller;

  /// Text that suggests what sort of input the field accepts.
  final String? hintText;

  /// Text that provides additional guidance on how to fill out the input.
  final String? helperText;

  /// Text that is displayed below the input field when an error has occurred.
  /// When this is non-null, the field border will turn red.
  final String? errorText;

  /// Called when the user initiates a change to the field's value.
  final ValueChanged<String>? onChanged;

  /// Whether to hide the text being edited (e.g., for passwords).
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    // Determine if we are in an error state.
    final bool hasError = errorText != null && errorText!.isNotEmpty;

    // Determine what text to show below the input field.
    final String? bottomText = errorText ?? helperText;
    final Color bottomTextColor = hasError
        ? CColors.supportError
        : CColors.textSecondary;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        // --- 1. Label ---
        Text(
          labelText,
          style: CTypography.label01.copyWith(color: CColors.textSecondary),
        ),
        const SizedBox(height: CSpacing.small),

        // --- 2. TextField with Carbon's InputDecoration ---
        TextField(
          controller: controller,
          onChanged: onChanged,
          obscureText: obscureText,
          style: CTypography.bodyCompact01, // Style for the text the user types
          decoration: InputDecoration(
            hintText: hintText,
            // The inputDecorationTheme from CTheme handles the rest of the styling!
            // We just need to override the error state styles if there's an error.
            errorText: hasError
                ? ""
                : null, // Use an empty string to trigger the error state visually without showing default error text
            errorStyle: const TextStyle(
              height: 0,
            ), // Hide the default error text area
          ),
        ),

        // --- 3. Helper or Error Text ---
        if (bottomText != null && bottomText.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(top: CSpacing.small),
            child: Text(
              bottomText,
              style: CTypography.label01.copyWith(color: bottomTextColor),
            ),
          ),
      ],
    );
  }
}
