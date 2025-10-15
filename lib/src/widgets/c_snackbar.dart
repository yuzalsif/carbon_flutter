import 'package:flutter/material.dart';
import 'package:carbon_flutter/src/theme/colors.dart';
import 'package:carbon_flutter/src/theme/spacing.dart';
import 'package:carbon_flutter/src/theme/typography.dart';

/// Defines the visual style and semantic purpose of a [CSnackbar].
enum CSnackbarType { info, success, warning, error }

/// A helper class to display Carbon Design System "Toast Notifications".
class CSnackbar {
  /// This class is not meant to be instantiated.
  CSnackbar._();

  /// Shows a Carbon-styled toast notification at the bottom of the screen.
  ///
  /// [context] is the `BuildContext` from which to find the [ScaffoldMessenger].
  /// [title] is the main message of the notification.
  /// [subtitle] is the optional, more detailed message.
  /// [type] determines the color and icon of the notification.
  static void show(
    BuildContext context, {
    required String title,
    String? subtitle,
    CSnackbarType type = CSnackbarType.info,
  }) {
    // Hide any currently displayed snackbar.
    ScaffoldMessenger.of(context).hideCurrentSnackBar();

    final screenWidth = MediaQuery.of(context).size.width;

    const double breakpoint =
        600.0; // A common breakpoint for mobile vs. tablet/desktop

    final SnackBarBehavior behavior = screenWidth > breakpoint
        ? SnackBarBehavior
              .floating // Use floating for large screens
        : SnackBarBehavior.fixed; // Use fixed (full-width) for small screens

    final double? width = screenWidth > breakpoint ? 400.0 : null;

    // Show the new snackbar.
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        // The content is our custom Carbon-styled widget.
        content: CSnackbarContent(title: title, subtitle: subtitle, type: type),
        // We make the SnackBar itself transparent and remove elevation
        // because our custom widget handles its own background and styling.
        backgroundColor: Colors.transparent,
        behavior: behavior,
        width: width,
        elevation: 0,
        padding: const EdgeInsets.symmetric(
          horizontal: CSpacing.medium,
          vertical: CSpacing.small,
        ),
      ),
    );
  }
}

/// The internal widget that builds the visual layout of the toast notification.
class CSnackbarContent extends StatelessWidget {
  const CSnackbarContent({
    super.key,
    required this.title,
    this.subtitle,
    required this.type,
  });

  final String title;
  final String? subtitle;
  final CSnackbarType type;

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;

    // Determine colors and icon based on the notification type.
    final Color indicatorColor;
    final IconData iconData;

    switch (type) {
      case CSnackbarType.info:
        indicatorColor = CColors.supportInfo;
        iconData = Icons.info_outline;
        break;
      case CSnackbarType.success:
        indicatorColor = CColors.supportSuccess;
        iconData = Icons.check_circle_outline;
        break;
      case CSnackbarType.warning:
        indicatorColor = CColors.supportWarning;
        iconData = Icons.warning_amber_outlined;
        break;
      case CSnackbarType.error:
        indicatorColor = CColors.supportError;
        iconData = Icons.error_outline;
        break;
    }

    final Color backgroundColor = isDark
        ? CColors.backgroundComponentInverse
        : CColors.backgroundComponent;
    final Color textColor = isDark
        ? CColors.textPrimaryInverse
        : CColors.textPrimary;
    final Color secondaryTextColor = isDark
        ? CColors.textSecondaryInverse
        : CColors.textSecondary;

    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        border: Border(left: BorderSide(color: indicatorColor, width: 4.0)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.all(CSpacing.medium),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(iconData, color: indicatorColor, size: 20),
          const SizedBox(width: CSpacing.medium),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  style: CTypography.body01.copyWith(
                    fontWeight: FontWeight.w600,
                    color: textColor,
                  ),
                ),
                if (subtitle != null) ...[
                  const SizedBox(height: CSpacing.xSmall),
                  Text(
                    subtitle ?? "",
                    style: CTypography.bodyCompact01.copyWith(
                      color: secondaryTextColor,
                    ),
                  ),
                ],
              ],
            ),
          ),
          const SizedBox(width: CSpacing.medium),
          InkWell(
            onTap: () => ScaffoldMessenger.of(context).hideCurrentSnackBar(),
            child: Icon(Icons.close, color: textColor, size: 20),
          ),
        ],
      ),
    );
  }
}
