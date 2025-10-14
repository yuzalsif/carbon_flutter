import 'package:flutter/material.dart';
import 'package:carbon_flutter/carbon_flutter.dart';

/// Defines the size of a [CButton], affecting its height and padding.
enum CButtonSize { small, regular }

/// Defines the visual style and semantic purpose of a [CButton],
/// aligned with the official Carbon Design System types.
enum CButtonType {
  /// For the single most important action on a page.
  primary,

  /// For important, but not primary, actions.
  secondary,

  /// For less prominent, supplemental actions.
  tertiary,

  /// For actions that are potentially destructive.
  danger,

  /// A variant of Tertiary with a transparent background for minimal emphasis.
  ghost,
}

/// A Carbon Design System compliant button.
class CButton extends StatefulWidget {
  const CButton({
    super.key,
    this.label,
    required this.onPressed,
    this.icon,
    this.type = CButtonType.primary,
    this.size = CButtonSize.regular,
  });

  final String? label;
  final Widget? icon;
  final VoidCallback? onPressed;
  final CButtonType type;
  final CButtonSize size;

  @override
  State<CButton> createState() => _CButtonState();
}

class _CButtonState extends State<CButton> {
  bool _isHovered = false;
  bool _isPressed = false;

  bool get _isDisabled => widget.onPressed == null;

  Color _getBackgroundColor() {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    if (_isDisabled) {
      return isDark
          ? CColors.borderInverse.withValues(alpha: 0.5)
          : CColors.borderSubtle;
    }

    if (_isPressed) {
      switch (widget.type) {
        case CButtonType.primary:
          return CColors.primaryHover;
        case CButtonType.secondary:
          return isDark
              ? CColors.borderInverse.withValues(alpha: 0.6)
              : CColors.backgroundInverse.withValues(alpha: 0.1);
        case CButtonType.danger:
          return CColors.supportError.withValues(alpha: 0.8);
        case CButtonType.tertiary:
        case CButtonType.ghost:
          return isDark
              ? CColors.backgroundComponentInverse.withValues(alpha: 0.5)
              : CColors.borderSubtle;
      }
    }

    if (_isHovered) {
      switch (widget.type) {
        case CButtonType.primary:
          return CColors.primaryHover.withValues(alpha: 0.9);
        case CButtonType.secondary:
          return isDark
              ? CColors.borderInverse.withValues(alpha: 0.9)
              : CColors.backgroundInverse.withValues(alpha: 0.9);
        case CButtonType.danger:
          return CColors.supportError.withValues(alpha: 0.9);
        case CButtonType.tertiary:
        case CButtonType.ghost:
          return isDark
              ? CColors.backgroundComponentInverse.withValues(alpha: 0.2)
              : CColors.background.withValues(alpha: 0.5);
      }
    }

    // Default background colors
    switch (widget.type) {
      case CButtonType.primary:
        return CColors.primary;
      case CButtonType.secondary:
        return isDark ? CColors.borderInverse : CColors.backgroundInverse;
      case CButtonType.danger:
        return CColors.supportError;
      case CButtonType.tertiary:
      case CButtonType.ghost:
        return Colors.transparent;
    }
  }

  Color _getForegroundColor() {
    if (_isDisabled) return CColors.textDisabled;

    switch (widget.type) {
      case CButtonType.primary:
      case CButtonType
          .secondary: // Secondary has white text on its dark background
      case CButtonType.danger:
        return CColors.textOnColor;
      case CButtonType.tertiary: // Tertiary has a blue outline, so blue text
      case CButtonType.ghost:
        return CColors.primary;
    }
  }

  BorderSide _getBorderSide() {
    if (_isDisabled) return BorderSide.none;

    switch (widget.type) {
      case CButtonType
          .tertiary: // Tertiary is the only one with a visible border by default
        return const BorderSide(color: CColors.primary, width: 1.0);
      case CButtonType.primary:
      case CButtonType.secondary:
      case CButtonType.danger:
      case CButtonType.ghost:
        return BorderSide.none;
    }
  }

  @override
  Widget build(BuildContext context) {
    final foregroundColor = _getForegroundColor();
    final buttonHeight = widget.size == CButtonSize.regular ? 48.0 : 32.0;
    final horizontalPadding = widget.size == CButtonSize.regular
        ? CSpacing.medium
        : CSpacing.small;

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
          height: buttonHeight,
          padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
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
              if (widget.icon != null &&
                  (widget.label != null && widget.label != ''))
                const SizedBox(width: CSpacing.small),
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
