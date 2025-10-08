import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:carbon_flutter/carbon_flutter.dart';

/// A Carbon Design System compliant Code Snippet.
///
/// Used to display a single line of code with a copy button.
class CCodeSnippet extends StatelessWidget {
  const CCodeSnippet({super.key, required this.text});

  /// The code text to display.
  final String text;

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    final Color backgroundColor = isDark
        ? CColors.backgroundInverse
        : CColors.background;
    final Color textColor = isDark
        ? CColors.textPrimaryInverse
        : CColors.textPrimary;

    return Container(
      color: backgroundColor,
      padding: const EdgeInsets.symmetric(
        horizontal: CSpacing.medium,
        vertical: CSpacing.small,
      ),
      child: Row(
        children: [
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Text(
                text,
                style: CTypography.bodyCompact01.copyWith(
                  fontFamily: 'monospace', // Use a monospace font for code
                  color: textColor,
                ),
              ),
            ),
          ),
          const SizedBox(width: CSpacing.medium),
          CTooltip(
            message: 'Copy to clipboard',
            child: CButton(
              icon: const Icon(Icons.copy, size: 20),
              label: '',
              type: CButtonType.ghost,
              onPressed: () {
                Clipboard.setData(ClipboardData(text: text));
                CSnackbar.show(
                  context,
                  title: 'Copied to clipboard',
                  type: CSnackbarType.info,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
