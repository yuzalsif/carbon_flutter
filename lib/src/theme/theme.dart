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
    final Color scaffoldBackgroundColor = isDark
        ? CColors.backgroundInverse
        : CColors.background;
    final Color componentBackgroundColor = isDark
        ? CColors.backgroundComponentInverse
        : CColors.backgroundComponent;

    final Color primaryTextColor = isDark
        ? CColors.textPrimaryInverse
        : CColors.textPrimary;
    final Color secondaryTextColor = isDark
        ? CColors.textSecondaryInverse
        : CColors.textSecondary;
    final Color hintTextColor = isDark
        ? CColors.textPlaceholderInverse
        : CColors.textPlaceholder;
    final Color borderColor = isDark
        ? CColors.borderInverse
        : CColors.borderStrong;
    final Color disabledTextColor = isDark
        ? CColors.textDisabledInverse
        : CColors.textDisabled;

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
      primaryColor: CColors.primary,
      disabledColor: disabledTextColor,

      colorScheme: ColorScheme(
        brightness: isDark ? Brightness.dark : Brightness.light,
        primary: CColors.primary,
        onPrimary: CColors.textOnColor,
        secondary: CColors.primary,
        onSecondary: CColors.textOnColor,
        error: CColors.supportError,
        onError: CColors.textOnColor,
        background: scaffoldBackgroundColor,
        onBackground: primaryTextColor,
        surface: componentBackgroundColor,
        onSurface: primaryTextColor,
      ),

      textTheme: textTheme,

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
          borderSide: BorderSide(color: CColors.primary, width: 2.0),
        ),
        errorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.zero,
          borderSide: BorderSide(color: CColors.supportError, width: 1.0),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.zero,
          borderSide: BorderSide(
            color: borderColor.withValues(alpha: 0.5),
            width: 1.0,
          ),
        ),
      ),
    );
  }
}
