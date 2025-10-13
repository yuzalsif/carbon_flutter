import 'package:flutter/material.dart';

import 'package:carbon_flutter/carbon_flutter.dart';

/// Defines the visual style and semantic purpose of a [CButton].
enum CButtonType {
  /// For the most important action on the page.
  primary,

  /// For secondary actions that are less prominent.
  secondary,

  /// For actions that are potentially destructive (e.g., delete, remove).
  danger,

  /// For the least prominent actions, often used in groups.
  ghost,

  tertiary,
}

/// A Carbon Design System compliant button.
///
/// This widget provides a flexible and customizable button that adheres to the
/// Carbon visual style. It supports different types, states (enabled/disabled),
/// and can include an optional leading icon.
class CButton extends StatefulWidget {
  const CButton({
    super.key,
    this.label,
    required this.onPressed,
    this.icon,
    this.type = CButtonType.primary,
  });

  /// The text to display inside the button.
  final String? label;

  /// An optional icon to display before the label.
  final Widget? icon;

  /// The callback that is called when the button is tapped.
  /// If `null`, the button will be displayed in a disabled state.
  final VoidCallback? onPressed;

  /// The type of button, which determines its visual style.
  /// Defaults to [CButtonType.primary].
  final CButtonType type;

  @override
  State<CButton> createState() => _CButtonState();
}

class _CButtonState extends State<CButton> {
  bool _isHovered = false;
  bool _isPressed = false;

  bool get _isDisabled => widget.onPressed == null;

  Color _getBackgroundColor() {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    if (_isDisabled) {
      // Use a neutral disabled color for the background.
      return CColors.borderStrong.withValues(alpha: 0.5);
    }
    if (_isPressed) {
      switch (widget.type) {
        case CButtonType.primary:
          return CColors.primaryHover;
        case CButtonType.secondary:
          return CColors.borderSubtle;
        case CButtonType.danger:
          return CColors.supportError.withValues(alpha: 0.8);
        case CButtonType.ghost:
          return CColors.borderSubtle;
        case CButtonType.tertiary:
          return isDark ? CColors.borderInverse : CColors.borderSubtle;
      }
    }
    if (_isHovered) {
      switch (widget.type) {
        case CButtonType.primary:
          return CColors.primaryHover.withValues(alpha: 0.9);
        case CButtonType.secondary:
          // A subtle background appears on hover for secondary.
          return CColors.backgroundComponent.withValues(alpha: 0.8);
        case CButtonType.danger:
          return CColors.supportError.withValues(alpha: 0.9);
        case CButtonType.ghost:
          return CColors.borderSubtle.withValues(alpha: 0.8);
        case CButtonType.tertiary:
          return isDark
              ? CColors.borderInverse.withValues(alpha: 0.8)
              : CColors.borderSubtle.withValues(alpha: 0.8);
      }
    }
    // Default background colors
    switch (widget.type) {
      case CButtonType.primary:
        return CColors.primary;
      case CButtonType.danger:
        return CColors.supportError;
      case CButtonType.secondary:
      case CButtonType.ghost:
        return Colors.transparent;
      case CButtonType.tertiary:
        return Colors.transparent;
    }
  }

  Color _getForegroundColor() {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    if (_isDisabled) {
      return CColors.textDisabled;
    }
    switch (widget.type) {
      case CButtonType.primary:
      case CButtonType.danger:
        return CColors.textOnColor;
      case CButtonType.secondary:
      case CButtonType.ghost:
        return CColors.primary;

      case CButtonType.tertiary:
        // Use the primary text color for the icon for good contrast
        return isDark ? CColors.textPrimaryInverse : CColors.textPrimary;
    }
  }

  BorderSide _getBorderSide() {
    // Secondary button has a border.
    if (widget.type == CButtonType.secondary && !_isDisabled) {
      return const BorderSide(color: CColors.primary, width: 1.0);
    }
    return BorderSide.none;
  }

  @override
  Widget build(BuildContext context) {
    final foregroundColor = _getForegroundColor();

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: _isDisabled
          ? SystemMouseCursors.forbidden
          : SystemMouseCursors.click,
      child: GestureDetector(
        onTapDown: (_) => setState(() => _isPressed = true),
        onTapUp: (_) => setState(() => _isPressed = false),
        onTapCancel: () => setState(() => _isPressed = false),
        onTap: _isDisabled ? null : widget.onPressed,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 100),
          height: 48.0,
          padding: const EdgeInsets.symmetric(horizontal: CSpacing.medium),
          decoration: BoxDecoration(
            color: _getBackgroundColor(),
            border: Border.fromBorderSide(_getBorderSide()),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (widget.icon != null)
                IconTheme(
                  data: IconThemeData(color: foregroundColor, size: 16),
                  child: widget.icon!,
                ),
              if (widget.icon != null) const SizedBox(width: CSpacing.small),
              if (widget.label != null && widget.label != '')
                Text(
                  widget.label!,
                  style: CTypography.button.copyWith(color: foregroundColor),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
