import 'package:flutter/painting.dart';

/// Defines the color palette for the Carbon Flutter theme.
///
/// This is a non-instantiable class that provides static [Color] constants
/// that align with the IBM Carbon Design System's "Gray 100" theme.
/// The naming convention (e.g., `primary60`, `gray100`) is taken directly
/// from the Carbon color tokens to maintain a shared vocabulary.

class CColors {
  CColors._();

  // --- Core Palette (Literal Colors) ---
  static const Color black = Color(0xFF000000);
  static const Color white = Color(0xFFFFFFFF);

  // --- Semantic Colors (Role-Based Naming) ---

  // --- Interactive Colors ---
  /// The primary interactive color for buttons, links, etc. (Carbon: blue60)
  static const Color primary = Color(0xFF0F62FE);

  /// The hover state for primary interactive elements. (Carbon: blue70)
  static const Color primaryHover = Color(0xFF0043CE);

  // --- Background Colors ---
  static const Color background = Color(0xFFF4F4F4);
  static const Color backgroundInverse = Color(0xFF161616);
  static const Color backgroundComponent = Color(0xFFFFFFFF);
  static const Color backgroundComponentInverse = Color(0xFF262626);

  // --- Border Colors ---
  static const Color borderSubtle = Color(0xFFE0E0E0);
  static const Color borderStrong = Color(0xFFC6C6C6);

  // --- Text & Icon Colors ---
  static const Color textPrimary = Color(0xFF161616);
  static const Color textPrimaryInverse = Color(0xFFF4F4F4);
  static const Color textSecondary = Color(0xFF525252);
  static const Color textPlaceholder = Color(0xFFA8A8A8);
  static const Color textOnColor = Color(0xFFFFFFFF);
  static const Color textDisabled = Color(0xFFC6C6C6);

  // --- Support Colors ---
  static const Color supportError = Color(0xFFDA1E28);
  static const Color supportSuccess = Color(0xFF24A148);
  static const Color supportWarning = Color(0xFFF1C21B);
  static const Color supportInfo = Color(0xFF3D70B2);
}
