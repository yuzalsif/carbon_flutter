import 'package:flutter/material.dart';
import 'package:carbon_flutter/carbon_flutter.dart';

/// A single item in a radio button group.
class CRadioButtonItem<T> {
  const CRadioButtonItem({required this.value, required this.labelText});

  final T value;
  final String labelText;
}

/// A Carbon Design System compliant Radio Button Group.
class CRadioButtonGroup<T> extends StatelessWidget {
  const CRadioButtonGroup({
    super.key,
    required this.items,
    required this.groupValue,
    required this.onChanged,
    this.title,
    this.enabled = true,
  });

  final String? title;
  final List<CRadioButtonItem<T>> items;
  final T groupValue;
  final ValueChanged<T?>? onChanged;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    final Color labelColor = enabled
        ? (isDark ? CColors.textPrimaryInverse : CColors.textPrimary)
        : (isDark ? CColors.textDisabledInverse : CColors.textDisabled);

    return Opacity(
      opacity: enabled ? 1.0 : 0.5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (title != null) ...[
            Text(
              title!,
              style: CTypography.label01.copyWith(color: CColors.textSecondary),
            ),
            const SizedBox(height: CSpacing.small),
          ],
          ...items.map((item) {
            return InkWell(
              onTap: enabled ? () => onChanged?.call(item.value) : null,
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Radio<T>(
                    value: item.value,
                    groupValue: groupValue,
                    onChanged: enabled ? onChanged : null,
                    activeColor: CColors.primary,
                    visualDensity: VisualDensity.compact,
                  ),
                  Flexible(
                    child: Text(
                      item.labelText,
                      style: CTypography.bodyCompact01.copyWith(
                        color: labelColor,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ],
      ),
    );
  }
}
