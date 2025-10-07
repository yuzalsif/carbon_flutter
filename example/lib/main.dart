import 'package:example/text_input_example.dart';
import 'package:flutter/material.dart';
import 'package:carbon_flutter/carbon_flutter.dart';

import 'button_examples.dart' show ButtonExample;

void main() {
  runApp(const CarbonExampleApp());
}

class CarbonExampleApp extends StatelessWidget {
  const CarbonExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Carbon Flutter Example',
      debugShowCheckedModeBanner: false,
      theme: CTheme.lightTheme,
      darkTheme: CTheme.darkTheme,
      themeMode: ThemeMode.dark,
      home: const ExampleHomePage(),
    );
  }
}

class ExampleHomePage extends StatelessWidget {
  const ExampleHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Carbon Flutter Components'),
        backgroundColor: CColors.backgroundComponent, // Using our theme colors
        elevation: 0,
      ),
      // Use a ListView to allow scrolling as we add more components
      body: ListView(
        padding: const EdgeInsets.all(CSpacing.medium),
        children: const [ButtonExample(), TextInputExample()],
      ),
    );
  }
}
