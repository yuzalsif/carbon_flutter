import 'package:flutter/material.dart';
import 'package:carbon_flutter/carbon_flutter.dart';

class CCheckbox extends StatelessWidget {
  const CCheckbox({
    super.key,
    required this.value,
    required this.onChanged,
    this.labelText,
    this.enabled = true,
  });

  final String? labelText;
  final bool value;
  final ValueChanged<bool?>? onChanged;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    final Color checkColor = isDark
        ? CColors.backgroundInverse
        : CColors.background;
    final Color activeColor = CColors.primary;
    final Color labelColor = enabled
        ? (isDark ? CColors.textPrimaryInverse : CColors.textPrimary)
        : (isDark ? CColors.textDisabledInverse : CColors.textDisabled);

    return Opacity(
      opacity: enabled ? 1.0 : 0.5,
      child: InkWell(
        onTap: enabled ? () => onChanged?.call(!value) : null,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Checkbox(
              value: value,
              onChanged: enabled ? onChanged : null,
              checkColor: checkColor,
              activeColor: activeColor,
              visualDensity: VisualDensity.compact,
            ),
            if (labelText != null)
              Flexible(
                child: Text(
                  labelText!,
                  style: CTypography.bodyCompact01.copyWith(color: labelColor),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
