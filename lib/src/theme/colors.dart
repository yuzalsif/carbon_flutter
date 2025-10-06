import 'package:flutter/painting.dart';

/// Defines the color palette for the Carbon Flutter theme.
///
/// This is a non-instantiable class that provides static [Color] constants
/// that align with the IBM Carbon Design System's "Gray 100" theme.
/// The naming convention (e.g., `blue60`, `gray100`) is taken directly
/// from the Carbon color tokens to maintain a shared vocabulary.
class CColors {
  // This class is not meant to be instantiated.
  CColors._();

  // --- Core Palette ---
  static const Color black = Color(0xFF000000);
  static const Color white = Color(0xFFFFFFFF);

  // --- Interactive Colors (Primary Actions) ---
  /// The primary interactive color for buttons, links, and highlighted items.
  static const Color blue60 = Color(0xFF0F62FE);

  /// The hover state for primary interactive elements.
  static const Color blue70 = Color(0xFF0043CE);

  // --- UI Backgrounds ---
  /// The primary background color for the entire application page.
  static const Color gray100 = Color(0xFFF4F4F4);

  /// The background color for UI components like cards, modals, and input fields.
  static const Color gray10 = Color(0xFFFFFFFF);

  // --- UI Borders & Separators ---
  /// Used for subtle borders on components like text inputs.
  static const Color gray30 = Color(0xFFC6C6C6);

  /// Used for dividers and rules.
  static const Color gray20 = Color(0xFFE0E0E0);

  // --- Text & Icons ---
  /// For primary text, headings, and important content.
  static const Color textPrimary = Color(0xFF161616);

  /// For secondary text, descriptions, and helper text.
  static const Color textSecondary = Color(0xFF525252);

  /// For placeholder text in input fields.
  static const Color textPlaceholder = Color(0xFFA8A8A8);

  /// Text on top of colored backgrounds (e.g., on a primary button).
  static const Color textOnColor = Color(0xFFFFFFFF);

  /// For disabled text and components.
  static const Color textDisabled = Color(0xFFC6C6C6);

  // --- Support Colors (Feedback & Status) ---
  /// For destructive actions, errors, and validation messages.
  static const Color red60 = Color(0xFFDA1E28);

  /// For success states and positive feedback.
  static const Color green50 = Color(0xFF24A148);

  /// For warnings and cautionary messages.
  static const Color yellow30 = Color(0xFFF1C21B);

  /// For informational messages.
  static const Color blue50 = Color(0xFF3D70B2);
}
