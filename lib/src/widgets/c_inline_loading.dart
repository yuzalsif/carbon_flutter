import 'package:flutter/material.dart';
import 'package:carbon_flutter/carbon_flutter.dart';

/// Defines the current status of an [CInlineLoading] operation.
enum CInlineLoadingStatus { loading, success, error }

/// A Carbon Design System compliant inline loading indicator.
///
/// Used to indicate the status of a specific action, such as submitting a form.
class CInlineLoading extends StatelessWidget {
  const CInlineLoading({
    super.key,
    required this.status,
    required this.loadingText,
    this.successText,
    this.errorText,
  });

  final CInlineLoadingStatus status;
  final String loadingText;
  final String? successText;
  final String? errorText;

  @override
  Widget build(BuildContext context) {
    Widget icon;
    String text;
    Color iconColor;

    switch (status) {
      case CInlineLoadingStatus.loading:
        icon = const CLoading(size: CLoadingSize.small);
        text = loadingText;
        iconColor = CColors.primary; // Not used for CLoading but good practice
        break;
      case CInlineLoadingStatus.success:
        icon = const Icon(Icons.check_circle, size: 20);
        text = successText ?? 'Success';
        iconColor = CColors.supportSuccess;
        break;
      case CInlineLoadingStatus.error:
        icon = const Icon(Icons.error, size: 20);
        text = errorText ?? 'Error';
        iconColor = CColors.supportError;
        break;
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconTheme(
          data: IconTheme.of(context).copyWith(color: iconColor),
          child: icon,
        ),
        const SizedBox(width: CSpacing.medium),
        Text(text, style: CTypography.bodyCompact01),
      ],
    );
  }
}
