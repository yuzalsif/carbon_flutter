/// Defines the spacing and layout tokens for the Carbon Flutter theme.
///
/// This is a non-instantiable class that provides static [double] constants
/// that align with the IBM Carbon Design System's 8px grid. Using these
/// constants ensures a consistent and rhythmic layout throughout the application.
class CSpacing {
  // This class is not meant to be instantiated.
  CSpacing._();

  /// 2px. For micro-adjustments and tight layouts. (Carbon token: `spacing-01`)
  static const double halfXSmall = 2.0;

  /// 4px. For small gaps between inline elements. (Carbon token: `spacing-02`)
  static const double xSmall = 4.0;

  /// 8px. The base grid unit. For small margins or padding. (Carbon token: `spacing-03`)
  static const double small = 8.0;

  /// 12px. (Carbon token: `spacing-04`)
  static const double mediumSmall = 12.0;

  /// 16px. The most common spacing for padding within components. (Carbon token: `spacing-05`)
  static const double medium = 16.0;

  /// 24px. For separating larger components or sections. (Carbon token: `spacing-06`)
  static const double large = 24.0;

  /// 32px. For significant separation between layout sections. (Carbon token: `spacing-07`)
  static const double xLarge = 32.0;

  /// 48px. For page-level margins and very large gaps. (Carbon token: `spacing-09`)
  static const double xxLarge = 48.0;
}
