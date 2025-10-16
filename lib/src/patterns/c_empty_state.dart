import 'package:flutter/material.dart';
import 'package:carbon_flutter/carbon_flutter.dart';

/// A Carbon Design System compliant Empty State pattern.
///
/// Empty states are moments in an application where there is no data to display.
/// This pattern provides a clear and helpful message to the user, often with
/// actions to resolve the state.
class CEmptyState extends StatelessWidget {
  const CEmptyState({
    super.key,
    this.image,
    required this.title,
    this.description,
    this.primaryAction,
    this.secondaryAction,
  });

  /// An optional visual element, typically a large [Icon] or an [Image].
  final Widget? image;

  /// The main message or heading for the empty state.
  final String title;

  /// An optional, more detailed description providing context.
  final String? description;

  /// An optional primary action widget, typically a [CButton].
  final Widget? primaryAction;

  /// An optional secondary action widget, typically a [CLink], displayed
  /// below the primary action.
  final Widget? secondaryAction;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 400),
        child: Padding(
          padding: const EdgeInsets.all(CSpacing.xxLarge),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (image != null) ...[
                DefaultTextStyle(
                  style: const TextStyle(color: CColors.textSecondary),
                  child: IconTheme(
                    data: const IconThemeData(
                      size: 128,
                      color: CColors.textSecondary,
                    ),
                    child: image!,
                  ),
                ),
                const SizedBox(height: CSpacing.large),
              ],

              Text(
                title,
                style: CTypography.heading03,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: CSpacing.medium),

              if (description != null) ...[
                Text(
                  description!,
                  style: CTypography.body01,
                  textAlign: TextAlign.center,
                ),
              ],

              if (description != null &&
                  (primaryAction != null || secondaryAction != null))
                const SizedBox(height: CSpacing.large),

              if (primaryAction != null) ...[primaryAction!],

              if (primaryAction != null && secondaryAction != null)
                const SizedBox(height: CSpacing.medium),

              if (secondaryAction != null) ...[secondaryAction!],
            ],
          ),
        ),
      ),
    );
  }
}
