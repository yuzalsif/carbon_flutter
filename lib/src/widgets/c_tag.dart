import 'package:flutter/material.dart';
import 'package:carbon_flutter/carbon_flutter.dart';

/// Defines the color palette for a [CTag].
enum CTagColor {
  red,
  magenta,
  purple,
  blue,
  cyan,
  teal,
  green,
  gray,
  coolGray,
  warmGray,
}

/// A Carbon Design System compliant Tag.
class CTag extends StatelessWidget {
  const CTag({super.key, required this.label, this.color = CTagColor.gray});

  final String label;
  final CTagColor color;

  // Internal method to map enum to actual colors.
  Color _getBackgroundColor() {
    switch (color) {
      case CTagColor.red:
        return const Color(0xFFFFB0B0);
      case CTagColor.magenta:
        return const Color(0xFFFDD0F3);
      case CTagColor.purple:
        return const Color(0xFFE2D3FF);
      case CTagColor.blue:
        return const Color(0xFFA6C8FF).withValues(alpha: .4);
      case CTagColor.cyan:
        return const Color(0xFF9EF0F0);
      case CTagColor.teal:
        return const Color(0xFF9EF0F0);
      case CTagColor.green:
        return const Color(0xFFA7F0BA);
      case CTagColor.gray:
        return const Color(0xFFE0E0E0);
      case CTagColor.coolGray:
        return const Color(0xFFD0E2FF);
      case CTagColor.warmGray:
        return const Color(0xFFF7F7F7);
    }
  }

  Color _getTextColor() {
    switch (color) {
      case CTagColor.blue:
        return Color.fromARGB(255, 42, 118, 239);
      default:
        return const Color(0xFF161616);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: CSpacing.medium,
        vertical: CSpacing.xSmall,
      ),
      decoration: BoxDecoration(
        color: _getBackgroundColor(),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        label,
        style: CTypography.label01.copyWith(
          color: _getTextColor(),
          fontWeight: FontWeight.normal,
        ),
      ),
    );
  }
}
