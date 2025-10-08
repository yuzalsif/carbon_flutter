# Carbon Flutter

A Flutter implementation of the IBM Carbon Design System.

This package provides a comprehensive set of widgets, themes, and design tokens to build beautiful and consistent Flutter applications that adhere to the Carbon visual language. It is designed to be modular, themeable, and easy to use.

## Features

- **Consistent Theming:** Full support for both light and dark modes out of the box.
- **Design Tokens:** Pre-defined colors, typography, and spacing that align with the Carbon Design System.
- **Comprehensive Component Library:** A wide array of widgets built from the ground up for a native Flutter experience.
- **Detailed Example App:** A complete showcase of every component in all its variations, serving as live documentation.

## Getting Started

### 1. Add Dependency

To use this package in your project, add it to your `pubspec.yaml`. If you are using it as a local package during development:

```yaml
dependencies:
  carbon_flutter:
    path: ../carbon_flutter # Adjust the path to your local package
```

### 2. Apply the Theme

In your main application file, import the library and apply the CTheme to your MaterialApp.

```dart
import 'package:flutter/material.dart';
import 'package:carbon_flutter/carbon_flutter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Carbon App',
      theme: CTheme.lightTheme,
      darkTheme: CTheme.darkTheme,
      themeMode: ThemeMode.system, // Or ThemeMode.light / ThemeMode.dark
      home: MyHomePage(),
    );
  }
}
```

### 3. Use the Components

You can now use any of the Carbon components throughout your application.

```dart
import 'package:carbon_flutter/carbon_flutter.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Welcome')),
      body: Padding(
        padding: const EdgeInsets.all(CSpacing.medium),
        child: Column(
          children: [
            CTextInput(labelText: 'Username'),
            const SizedBox(height: CSpacing.medium),
            CButton(
              label: 'Submit',
              onPressed: () {
                CSnackbar.show(context, title: 'Form submitted!');
              },
            ),
          ],
        ),
      ),
    );
  }
}
```

## Implemented Components

This library includes the following components, designed and built to match the Carbon Design System specifications:

- **Actions & Inputs:**
  - `CButton`
  - `CCheckbox`
  - `CDatePicker`
  - `CDropdown`
  - `CFileUploader`
  - `CLink`
  - `CMultiselect`
  - `CNumberInput`
  - `CRadioButtonGroup`
  - `CSearch`
  - `CSlider`
  - `CTextInput`
  - `CToggle`

- **Navigation:**
  - `CBreadcrumb`
  - `CContentSwitcher`
  - `CPagination`
  - `CTabs`

- **Feedback & Status:**
  - `CInlineLoading`
  - `CLoading`
  - `CProgressIndicator`
  - `CSnackbar` (Toast Notification)
  - `CTooltip`

- **Content & Data Display:**
  - `CAccordion`
  - `CCodeSnippet`
  - `CContainedList`
  - `CDataTable`
  - `CModal`
  - `CTag`
  - `CTile` (Clickable & Expandable)


 ###  Contributing
  Contributions are welcome! Please feel free to open an issue or submit a pull request.