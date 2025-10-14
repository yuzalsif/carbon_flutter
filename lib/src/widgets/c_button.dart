import 'package:flutter/material.dart';
import 'package:carbon_flutter/carbon_flutter.dart';

/// Defines the size of a [CButton], affecting its height and padding.
enum CButtonSize {
  xsmall, // 24px
  small, // 32px
  medium, // 40px
  regular, // 48px (Default, corresponds to 'lg' productive)
  xlarge, // 64px
}

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
    this.width,
  });

  final String? label;
  final Widget? icon;
  final VoidCallback? onPressed;
  final CButtonType type;
  final CButtonSize size;
  final double? width;

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
              ? CColors.borderInverse.withValues(alpha: 0.3)
              : CColors.backgroundInverse.withValues(alpha: 0.3);
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
    late final double buttonHeight;
    late final double horizontalPadding;
    late final double iconSize;

    switch (widget.size) {
      case CButtonSize.xsmall:
        buttonHeight = 24.0;
        horizontalPadding = CSpacing.small; // Less padding for smaller size
        iconSize = 16.0;
        break;
      case CButtonSize.small:
        buttonHeight = 32.0;
        horizontalPadding = CSpacing.medium;
        iconSize = 16.0;
        break;
      case CButtonSize.medium:
        buttonHeight = 40.0;
        horizontalPadding = CSpacing.medium;
        iconSize = 20.0;
        break;
      case CButtonSize.regular:
        buttonHeight = 48.0;
        horizontalPadding = CSpacing.medium;
        iconSize = 20.0;
        break;
      case CButtonSize.xlarge:
        buttonHeight = 64.0;
        horizontalPadding = CSpacing.large; // More padding for larger size
        iconSize = 24.0;
        break;
    }

    final bool hasIcon = widget.icon != null;
    final MainAxisAlignment alignment = hasIcon
        ? MainAxisAlignment.center
        : MainAxisAlignment.start;

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
          width: widget.width,
          padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
          decoration: BoxDecoration(
            color: _getBackgroundColor(),
            border: Border.fromBorderSide(_getBorderSide()),
          ),
          child: Row(
            mainAxisAlignment: alignment,
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (widget.icon != null)
                    IconTheme(
                      data: IconThemeData(
                        color: foregroundColor,
                        size: iconSize,
                      ),
                      child: widget.icon!,
                    ),
                  if (widget.icon != null &&
                      (widget.label != null && widget.label != ''))
                    const SizedBox(width: CSpacing.small),
                  if (widget.label != null && widget.label != '')
                    Text(
                      widget.label!,
                      style: CTypography.button.copyWith(
                        color: foregroundColor,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
