import 'package:example/screens/accordion_example.dart';
import 'package:example/screens/breadcumb_example.dart' show BreadcrumbExample;
import 'package:example/screens/snackbar_example.dart';
import 'package:example/screens/text_input_example.dart';
import 'package:flutter/material.dart';
import 'package:carbon_flutter/carbon_flutter.dart';

import 'screens/button_examples.dart' show ButtonExample;

final ValueNotifier<ThemeMode> themeNotifier = ValueNotifier(ThemeMode.system);

void main() {
  runApp(const CarbonExampleApp());
}

class CarbonExampleApp extends StatelessWidget {
  const CarbonExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: themeNotifier,
      builder: (_, mode, __) {
        return MaterialApp(
          title: 'Carbon Flutter Example',
          theme: CTheme.lightTheme,
          darkTheme: CTheme.darkTheme,
          themeMode: mode,
          home: const ExampleHomePage(),
        );
      },
    );
  }
}

class ExampleHomePage extends StatelessWidget {
  const ExampleHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Carbon Flutter Components'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: CSpacing.medium),
            child: CToggle(
              labelText: 'Dark Mode',
              value: isDark,
              onChanged: (bool isNowDark) {
                themeNotifier.value = isNowDark
                    ? ThemeMode.dark
                    : ThemeMode.light;
              },
            ),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(CSpacing.medium),
        children: const [
          ButtonExample(),
          TextInputExample(),
          SnackbarExample(),
          AccordionExample(),
          BreadcrumbExample(),
        ],
      ),
    );
  }
}
