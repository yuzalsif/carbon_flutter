import 'package:flutter/material.dart';
import 'package:carbon_flutter/carbon_flutter.dart';

/// A Carbon Design System compliant AppBar.
///
/// This widget provides a styled, flat header that is a common
/// feature in Carbon's UI Shell.
class CAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CAppBar({
    super.key,
    this.title,
    this.actions,
    this.automaticallyImplyLeading = true,
  });

  /// The primary widget displayed in the app bar. Typically a [Text] widget.
  final Widget? title;

  /// A list of widgets to display after the title.
  /// Typically a list of [IconButton]s or [CButton]s.
  final List<Widget>? actions;

  /// Controls whether we should try to imply the leading widget, such as
  /// a back button on secondary pages. Defaults to true.
  final bool automaticallyImplyLeading;

  // The standard height for a Carbon header.
  static const double appBarHeight = 48.0;

  @override
  Widget build(BuildContext context) {
    // Determine if a back button should be shown.
    final bool canPop = Navigator.of(context).canPop();
    final parentRoute = ModalRoute.of(context);
    final bool useCloseButton =
        parentRoute is PageRoute<dynamic> && parentRoute.fullscreenDialog;

    Widget? leading;
    if (automaticallyImplyLeading && canPop) {
      leading = useCloseButton
          ? IconButton(
              icon: const Icon(Icons.close),
              onPressed: () => Navigator.pop(context),
            )
          : IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => Navigator.pop(context),
            );
    }

    return AppBar(
      // Let our CTheme handle the colors and elevation.
      // CTheme already sets elevation to 0 and provides the correct
      // backgroundColor and foregroundColor via the appBarTheme property.
      title: title,
      leading: leading,
      actions: actions,
      centerTitle: false, // Carbon titles are typically left-aligned.
      automaticallyImplyLeading: false, // We handle it manually.
      // Add a subtle bottom border to separate the AppBar from the content.
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1.0),
        child: Divider(
          height: 1,
          thickness: 1,
          color: Theme.of(context).dividerTheme.color,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(appBarHeight);
}
