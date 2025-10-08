import 'package:flutter/material.dart';
import 'package:carbon_flutter/carbon_flutter.dart';

class CodeSnippetExample extends StatelessWidget {
  const CodeSnippetExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CCodeSnippet(text: 'flutter run -t lib/example/main.dart'),
        const SizedBox(height: CSpacing.medium),
        const CCodeSnippet(
          text:
              'This is a much longer line of code that will likely overflow the available space, demonstrating the horizontal scrolling behavior of the widget.',
        ),
      ],
    );
  }
}
