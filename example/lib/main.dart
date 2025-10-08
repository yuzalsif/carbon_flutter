import 'package:example/screens/accordion_example.dart';
import 'package:example/screens/breadcumb_example.dart' show BreadcrumbExample;
import 'package:example/screens/code_snippet_example.dart';
import 'package:example/screens/content_switcher_example.dart';
import 'package:example/screens/data_table_example.dart';
import 'package:example/screens/date_picker_example.dart';
import 'package:example/screens/dropdown_example.dart';
import 'package:example/screens/file_uploader_example.dart';
import 'package:example/screens/inline_loading_example.dart';
import 'package:example/screens/link_example.dart';
import 'package:example/screens/list_example.dart';
import 'package:example/screens/loading_example.dart';
import 'package:example/screens/modal_example.dart';
import 'package:example/screens/multiselect_example.dart';
import 'package:example/screens/number_input_example.dart';
import 'package:example/screens/pagination_example.dart';
import 'package:example/screens/progress_indicator_example.dart';
import 'package:example/screens/radio_button_example.dart';
import 'package:example/screens/search_example.dart';
import 'package:example/screens/slider_example.dart';
import 'package:example/screens/snackbar_example.dart';
import 'package:example/screens/tabs_example.dart';
import 'package:example/screens/tag_example.dart';
import 'package:example/screens/text_input_example.dart';
import 'package:example/screens/tile_example.dart';
import 'package:example/screens/tooltip_example.dart';
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
          debugShowCheckedModeBanner: false,
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
          SizedBox(height: CSpacing.xLarge),
          LinkExample(),
          SizedBox(height: CSpacing.xLarge),
          RadioButtonExample(),
          SizedBox(height: CSpacing.xLarge),
          LoadingExample(),
          SizedBox(height: CSpacing.xLarge),
          InlineLoadingExample(),
          SizedBox(height: CSpacing.xLarge),
          DropdownExample(),
          SizedBox(height: CSpacing.xLarge),
          ModalExample(),
          SizedBox(height: CSpacing.xLarge),
          TabsExample(),
          SizedBox(height: CSpacing.xLarge),
          TagExample(),
          SizedBox(height: CSpacing.xLarge),
          SliderExample(),
          SizedBox(height: CSpacing.xLarge),
          ProgressIndicatorExample(),
          SizedBox(height: CSpacing.xLarge),
          SearchExample(),
          SizedBox(height: CSpacing.xLarge),
          TileExample(),
          SizedBox(height: CSpacing.xLarge),
          TooltipExample(),
          SizedBox(height: CSpacing.xLarge),
          NumberInputExample(),
          SizedBox(height: CSpacing.xLarge),
          DataTableExample(),
          SizedBox(height: CSpacing.xLarge),
          CodeSnippetExample(),
          SizedBox(height: CSpacing.xLarge),
          ContentSwitcherExample(),
          SizedBox(height: CSpacing.xLarge),
          DatePickerExample(),
          SizedBox(height: CSpacing.xLarge),
          FileUploaderExample(),
          SizedBox(height: CSpacing.xLarge),
          ListExample(),
          SizedBox(height: CSpacing.xLarge),
          MultiselectExample(),
          SizedBox(height: CSpacing.xLarge),
          PaginationExample(),
        ],
      ),
    );
  }
}
