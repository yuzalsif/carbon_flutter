import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
    this.onSubmitted,
    this.obscureText = false,
    this.keyboardType,
    this.inputFormatters,
    this.prefixIcon,
    this.suffixIcon,
    this.enabled = true,
  });

  /// The text that is displayed above the input field.
  final String labelText;

  /// Controls the text being edited.
  final TextEditingController? controller;

  /// Text that suggests what sort of input the field accepts.
  final String? hintText;

  /// Text that provides additional guidance on how to fill out the input.
  final String? helperText;

  /// Text that is displayed below the input field when an error has occurred.
  final String? errorText;

  /// Called when the user initiates a change to the field's value.
  final ValueChanged<String>? onChanged;

  /// Called when the user indicates that they are done editing the text in the field.
  final ValueChanged<String>? onSubmitted;

  /// Whether to hide the text being edited (e.g., for passwords).
  final bool obscureText;

  /// The type of keyboard to use for editing the text.
  final TextInputType? keyboardType;

  /// Optional input validation and formatting rules.
  final List<TextInputFormatter>? inputFormatters;

  /// An optional icon to display before the input field.
  final Widget? prefixIcon;

  /// An optional icon or widget to display after the input field.
  final Widget? suffixIcon;

  /// Whether the input field is interactive.
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    final bool hasError = errorText != null && errorText!.isNotEmpty;
    final String? bottomText = errorText ?? helperText;
    final Color bottomTextColor = hasError
        ? CColors.supportError
        : CColors.textSecondary;

    return Opacity(
      opacity: enabled ? 1.0 : 0.5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Label is hidden if it's empty (for CSearch and CSlider)
          if (labelText.isNotEmpty) ...[
            Text(
              labelText,
              style: CTypography.label01.copyWith(color: CColors.textSecondary),
            ),
            const SizedBox(height: CSpacing.small),
          ],

          TextField(
            controller: controller,
            onChanged: enabled ? onChanged : null,
            onSubmitted: enabled ? onSubmitted : null,
            obscureText: obscureText,
            enabled: enabled,
            style: CTypography.bodyCompact01,
            keyboardType: keyboardType,
            inputFormatters: inputFormatters,
            decoration: InputDecoration(
              hintText: hintText,
              prefixIcon: prefixIcon,
              suffixIcon: suffixIcon,
              errorText: hasError ? "" : null,
              errorStyle: const TextStyle(height: 0),
            ),
          ),

          if (bottomText != null && bottomText.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(top: CSpacing.small),
              child: Text(
                bottomText,
                style: CTypography.label01.copyWith(color: bottomTextColor),
              ),
            ),
        ],
      ),
    );
  }
}
