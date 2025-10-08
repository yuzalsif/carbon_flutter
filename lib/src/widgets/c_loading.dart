import 'package:flutter/material.dart';
import 'package:carbon_flutter/carbon_flutter.dart';

/// Defines the size of the [CLoading] spinner.
enum CLoadingSize { small, large }

/// A Carbon Design System compliant loading spinner.
class CLoading extends StatelessWidget {
  const CLoading({
    super.key,
    this.size = CLoadingSize.large,
    this.isOverlay = false,
  });

  /// The size of the circular spinner.
  final CLoadingSize size;

  /// If true, this widget will display as a semi-transparent overlay
  /// covering its parent, typically used for page-level loading.
  final bool isOverlay;

  @override
  Widget build(BuildContext context) {
    final spinner = CircularProgressIndicator(
      strokeWidth: size == CLoadingSize.large ? 4.0 : 3.0,
      valueColor: const AlwaysStoppedAnimation<Color>(CColors.primary),
    );

    final sizedSpinner = SizedBox(
      width: size == CLoadingSize.large ? 48 : 24,
      height: size == CLoadingSize.large ? 48 : 24,
      child: spinner,
    );

    if (isOverlay) {
      return Container(
        alignment: Alignment.center,
        color: CColors.background.withOpacity(0.5),
        child: sizedSpinner,
      );
    }

    return sizedSpinner;
  }
}
