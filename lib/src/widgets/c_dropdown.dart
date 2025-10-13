import 'package:flutter/material.dart';
import 'package:carbon_flutter/carbon_flutter.dart';

/// A data model for an item in a [CDropdown].
class CDropdownItem<T> {
  const CDropdownItem({required this.value, required this.text});

  final T value;
  final String text;
}

/// A Carbon Design System compliant Dropdown.
class CDropdown<T> extends StatelessWidget {
  const CDropdown({
    super.key,
    required this.labelText,
    required this.items,
    this.value,
    required this.onChanged,
    this.hintText,
    this.enabled = true,
  });

  final String labelText;
  final String? hintText;
  final List<CDropdownItem<T>> items;
  final T? value;
  final ValueChanged<T?> onChanged;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    final Color textColor = enabled
        ? (isDark ? CColors.textPrimaryInverse : CColors.textPrimary)
        : (isDark ? CColors.textDisabledInverse : CColors.textDisabled);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          labelText,
          style: CTypography.label01.copyWith(color: CColors.textSecondary),
        ),
        const SizedBox(height: CSpacing.small),
        DropdownButtonFormField<T>(
          initialValue: value,
          items: items.map((item) {
            return DropdownMenuItem<T>(
              value: item.value,
              child: Text(item.text, style: CTypography.bodyCompact01),
            );
          }).toList(),
          onChanged: enabled ? onChanged : null,
          style: CTypography.bodyCompact01.copyWith(color: textColor),
          icon: const Icon(Icons.keyboard_arrow_down),
          decoration: InputDecoration(
            hintText: hintText,
            // The CTheme inputDecorationTheme handles the rest!
          ),
        ),
      ],
    );
  }
}
