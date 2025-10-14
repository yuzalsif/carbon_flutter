import 'package:flutter/material.dart';
import 'package:carbon_flutter/carbon_flutter.dart';

/// A helper class to display a Carbon Design System compliant Modal.
class CModal {
  CModal._();

  /// Shows a modal dialog.
  ///
  /// [context] is the `BuildContext`.
  /// [title] is the text in the modal's header.
  /// [content] is the main widget to display in the modal's body.
  /// [actions] is a list of widgets (usually [CButton]s) to display at the bottom.
  static Future<T?> show<T>(
    BuildContext context, {
    required String title,
    required Widget content,
    required List<Widget> actions,
  }) {
    return showDialog<T>(
      context: context,
      barrierDismissible: false, // User must interact with an action
      builder: (BuildContext context) {
        return _CModalContent(title: title, content: content, actions: actions);
      },
    );
  }
}

class _CModalContent extends StatelessWidget {
  const _CModalContent({
    required this.title,
    required this.content,
    required this.actions,
  });

  final String title;
  final Widget content;
  final List<Widget> actions;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      backgroundColor: CColors.backgroundComponent,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 400),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.all(CSpacing.medium),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(title, style: CTypography.heading03),
                  InkWell(
                    onTap: () => Navigator.of(context).pop(),
                    child: const Icon(Icons.close, size: 24),
                  ),
                ],
              ),
            ),
            // Content
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: CSpacing.medium),
              child: DefaultTextStyle(
                style: CTypography.body01,
                child: content,
              ),
            ),
            const SizedBox(height: CSpacing.large),
            // Actions
            Padding(
              padding: const EdgeInsets.only(top: CSpacing.large),
              child: Row(
                children: [
                  Expanded(child: actions[0]),
                  SizedBox(width: 200, child: actions[1]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
