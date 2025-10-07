import 'package:flutter/material.dart';
import 'package:carbon_flutter/src/theme/colors.dart';
import 'package:carbon_flutter/src/theme/typography.dart';
import 'package:google_fonts/google_fonts.dart';

/// A class that provides static methods to generate [ThemeData]
/// for the Carbon light and dark themes.
class CTheme {
  CTheme._();

  /// Generates the [ThemeData] for the Carbon Design System's light theme.
  static ThemeData get lightTheme {
    return _buildTheme(isDark: false);
  }

  /// Generates the [ThemeData] for the Carbon Design System's dark theme.
  static ThemeData get darkTheme {
    return _buildTheme(isDark: true);
  }

  static ThemeData _buildTheme({required bool isDark}) {
    // Define colors based on the theme mode (light/dark).
    final Color scaffoldBackgroundColor = isDark
        ? CColors.gray100Inverted
        : CColors.gray100;
    final Color componentBackgroundColor = isDark
        ? CColors.gray90Inverted
        : CColors.gray10;
    final Color primaryTextColor = isDark ? CColors.white : CColors.textPrimary;
    final Color secondaryTextColor = isDark
        ? CColors.gray30
        : CColors.textSecondary;
    final Color hintTextColor = CColors.textPlaceholder;
    final Color borderColor = isDark ? CColors.gray30 : CColors.gray30;

    // Build the base TextTheme using GoogleFonts and apply colors.
    final textTheme = GoogleFonts.ibmPlexSansTextTheme(
      TextTheme(
        labelSmall: CTypography.label01,
        bodyMedium: CTypography.bodyCompact01,
        bodyLarge: CTypography.body01,
        titleMedium: CTypography.heading03,
        headlineMedium: CTypography.heading05,
      ).apply(bodyColor: primaryTextColor, displayColor: primaryTextColor),
    );

    return ThemeData(
      brightness: isDark ? Brightness.dark : Brightness.light,
      scaffoldBackgroundColor: scaffoldBackgroundColor,
      primaryColor: CColors.blue60,

      colorScheme: ColorScheme(
        brightness: isDark ? Brightness.dark : Brightness.light,
        primary: CColors.blue60,
        onPrimary: CColors.white,
        secondary: CColors.blue60,
        onSecondary: CColors.white,
        error: CColors.red60,
        onError: CColors.white,
        surface: componentBackgroundColor,
        onSurface: primaryTextColor,
      ),

      textTheme: textTheme,

      // Define default styles for common widgets.
      cardTheme: CardThemeData(
        color: componentBackgroundColor,
        elevation: 0,
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      ),

      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: componentBackgroundColor,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 14.0,
        ),
        labelStyle: CTypography.label01.copyWith(color: secondaryTextColor),
        hintStyle: CTypography.bodyCompact01.copyWith(color: hintTextColor),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.zero,
          borderSide: BorderSide(color: borderColor, width: 1.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.zero,
          borderSide: BorderSide(color: borderColor, width: 1.0),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.zero,
          borderSide: BorderSide(
            color: CColors.blue60,
            width: 2.0,
          ), // Carbon focus indicator
        ),
        errorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.zero,
          borderSide: BorderSide(color: CColors.red60, width: 1.0),
        ),
      ),
    );
  }
}
