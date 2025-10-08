import 'package:flutter/material.dart';
import 'package:carbon_flutter/carbon_flutter.dart';

class CLink extends StatelessWidget {
  const CLink({super.key, required this.text, this.onTap, this.enabled = true});

  final String text;
  final VoidCallback? onTap;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    final bool isEnabled = enabled && onTap != null;

    return InkWell(
      onTap: isEnabled ? onTap : null,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Text(
        text,
        style: CTypography.bodyCompact01.copyWith(
          color: isEnabled ? CColors.primary : CColors.textDisabled,
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }
}
