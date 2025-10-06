import 'package:flutter/painting.dart';
import 'package:carbon_flutter/src/theme/colors.dart';

/// Defines the text styles for the Carbon Flutter theme.
///
/// This is a non-instantiable class that provides static [TextStyle] constants
/// that align with the IBM Carbon Design System's typographic scale. It uses
/// the 'IBMPlexSans' font family.
class CTypography {
  // This class is not meant to be instantiated.
  CTypography._();

  /// The official font family of the Carbon Design System.
  static const String fontFamily = 'IBMPlexSans';

  // --- Productive Type Scale ---

  /// For short, scannable labels.
  /// Font size: 12, Weight: 400 (regular)
  static const TextStyle label01 = TextStyle(
    fontFamily: fontFamily,
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: CColors.textSecondary,
  );

  /// For helper text, and smaller body copy.
  /// Font size: 14, Weight: 400 (regular)
  static const TextStyle bodyCompact01 = TextStyle(
    fontFamily: fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: CColors.textPrimary,
  );

  /// For primary body copy.
  /// Font size: 16, Weight: 400 (regular)
  static const TextStyle body01 = TextStyle(
    fontFamily: fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: CColors.textPrimary,
  );

  /// For subtitles, and medium-sized headings.
  /// Font size: 20, Weight: 400 (regular)
  static const TextStyle heading03 = TextStyle(
    fontFamily: fontFamily,
    fontSize: 20,
    fontWeight: FontWeight.w400,
    color: CColors.textPrimary,
  );

  /// For large, impactful headings.
  /// Font size: 28, Weight: 600 (semibold)
  static const TextStyle heading05 = TextStyle(
    fontFamily: fontFamily,
    fontSize: 28,
    fontWeight: FontWeight.w600,
    color: CColors.textPrimary,
  );

  /// Used for button labels.
  /// Font size: 14, Weight: 600 (semibold)
  static const TextStyle button = TextStyle(
    fontFamily: fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w600,
  );
}
