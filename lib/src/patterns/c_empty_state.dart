import 'package:flutter/material.dart';
import 'package:carbon_flutter/carbon_flutter.dart';

class CEmptyState extends StatelessWidget {
  const CEmptyState({
    super.key,
    this.image,
    required this.title,
    this.description,
    this.action,
  });

  /// An optional visual element, typically a large [Icon] or an [Image].
  final Widget? image;

  final String title;
  final String? description;
  final Widget? action;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 400),
        child: Padding(
          padding: const EdgeInsets.all(CSpacing.xxLarge),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
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
                const SizedBox(height: CSpacing.large),
              ],

              if (action != null) action!,
            ],
          ),
        ),
      ),
    );
  }
}
