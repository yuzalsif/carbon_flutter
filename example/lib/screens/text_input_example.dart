import 'package:flutter/material.dart';
import 'package:carbon_flutter/carbon_flutter.dart';
import 'package:flutter/services.dart';

/// A widget that showcases the different states of [CTextInput].
class TextInputExample extends StatefulWidget {
  const TextInputExample({super.key});

  @override
  State<TextInputExample> createState() => _TextInputExampleState();
}

class _TextInputExampleState extends State<TextInputExample> {
  String? _errorText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // --- Section Header ---
        Text('Text Inputs', style: CTypography.heading03),
        const SizedBox(height: CSpacing.medium),

        // --- Showcase different text input configurations ---

        // 1. Basic Text Input
        const CTextInput(labelText: 'Label for Basic Input'),
        const SizedBox(height: CSpacing.large),

        // 2. Text Input with Placeholder and Helper Text
        const CTextInput(
          labelText: 'Label for Input with Helper',
          hintText: 'Placeholder text',
          helperText: 'This is some helpful text.',
        ),
        const SizedBox(height: CSpacing.large),

        // 3. Password Input
        const CTextInput(labelText: 'Password Input', obscureText: true),
        const SizedBox(height: CSpacing.large),

        // 4. Text Input with Error State (Interactive)
        CTextInput(
          labelText: 'Input with Validation (type "error")',
          helperText: 'Type the word "error" to see the error state.',
          errorText: _errorText,
          onChanged: (value) {
            // Simple validation logic to demonstrate the error state
            if (value.toLowerCase() == 'error') {
              setState(() {
                _errorText = 'This is an example error message.';
              });
            } else {
              // Clear the error if the input is valid
              if (_errorText != null) {
                setState(() {
                  _errorText = null;
                });
              }
            }
          },
        ),
        const SizedBox(height: CSpacing.large),
        // 5. Number inputs
        CTextInput(
          labelText: 'Number Input',
          hintText: 'Enter numbers only',
          // Use the new properties to configure it for numbers
          keyboardType: TextInputType.number,
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.digitsOnly,
          ],
        ),
        const SizedBox(
          height: CSpacing.xLarge,
        ), // Space before the next component
      ],
    );
  }
}
