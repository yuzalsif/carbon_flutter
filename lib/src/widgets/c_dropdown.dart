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
    this.labelText,
    required this.items,
    this.value,
    required this.onChanged,
    this.hintText,
    this.enabled = true,
    this.onBackground = false,
  });

  final String? labelText;
  final String? hintText;
  final List<CDropdownItem<T>> items;
  final T? value;
  final ValueChanged<T?> onChanged;
  final bool enabled;
  final bool onBackground;

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    final Color textColor = enabled
        ? (isDark ? CColors.textPrimaryInverse : CColors.textPrimary)
        : (isDark ? CColors.textDisabledInverse : CColors.textDisabled);

    late final Color fillColor;

    if (onBackground) {
      // The input is on a contrasting surface (e.g., a white card).
      // Use the main page background color for the fill.
      fillColor = isDark ? CColors.backgroundInverse : CColors.background;
    } else {
      // The input is on the main page background.
      // Use the component background color for the fill.
      fillColor = isDark
          ? CColors.backgroundComponentInverse
          : CColors.backgroundComponent;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (labelText != null && labelText != '')
          Text(
            labelText!,
            style: CTypography.label01.copyWith(color: CColors.textSecondary),
          ),
        const SizedBox(height: CSpacing.small),
        DropdownButtonFormField<T>(
          isExpanded: true,
          initialValue: value,
          items: items.map((item) {
            return DropdownMenuItem<T>(
              value: item.value,
              child: Text(
                item.text,
                style: CTypography.bodyCompact01,
                overflow: TextOverflow.ellipsis,
                softWrap: false,
                maxLines: 1,
              ),
            );
          }).toList(),
          onChanged: enabled ? onChanged : null,
          style: CTypography.bodyCompact01.copyWith(color: textColor),
          icon: const Icon(Icons.keyboard_arrow_down),
          decoration: InputDecoration(
            fillColor: fillColor,
            hintText: hintText,
            errorStyle: const TextStyle(height: 0),
          ),
        ),
      ],
    );
  }
}
