import 'package:flutter/material.dart';
import 'package:carbon_flutter/carbon_flutter.dart';

/// A data model for a step in a [CProgressIndicator].
class CProgressStep {
  const CProgressStep({
    required this.label,
    this.isComplete = false,
    this.isCurrent = false,
    this.isDisabled = false,
  });

  final String label;
  final bool isComplete;
  final bool isCurrent;
  final bool isDisabled;
}

/// A Carbon Design System compliant Progress Indicator.
class CProgressIndicator extends StatelessWidget {
  const CProgressIndicator({
    super.key,
    required this.steps,
    this.isVertical = false,
  });

  final List<CProgressStep> steps;
  final bool isVertical;

  @override
  Widget build(BuildContext context) {
    if (isVertical) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: _buildStepWidgets(),
      );
    }
    return Row(children: _buildStepWidgets());
  }

  List<Widget> _buildStepWidgets() {
    final List<Widget> widgets = [];
    for (int i = 0; i < steps.length; i++) {
      widgets.add(
        isVertical
            ? _CProgressStepVertical(
                step: steps[i],
                isLast: i == steps.length - 1,
              )
            : Expanded(
                child: _CProgressStepHorizontal(
                  step: steps[i],
                  isLast: i == steps.length - 1,
                ),
              ),
      );
    }
    return widgets;
  }
}

// Internal widgets for horizontal and vertical layouts

class _CProgressStepHorizontal extends StatelessWidget {
  const _CProgressStepHorizontal({required this.step, required this.isLast});
  final CProgressStep step;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            _buildCircle(context),
            if (!isLast)
              Expanded(
                child: Container(height: 1, color: _getConnectorColor(context)),
              ),
          ],
        ),
        const SizedBox(height: CSpacing.small),
        Text(
          step.label,
          style: CTypography.label01.copyWith(color: _getTextColor(context)),
        ),
      ],
    );
  }

  Color _getConnectorColor(BuildContext context) {
    return step.isComplete ? CColors.primary : CColors.borderSubtle;
  }

  Color _getTextColor(BuildContext context) {
    return step.isDisabled
        ? CColors.textDisabled
        : Theme.of(context).textTheme.bodyLarge!.color!;
  }

  Widget _buildCircle(BuildContext context) {
    if (step.isComplete) {
      return Container(
        width: 24,
        height: 24,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: CColors.primary,
        ),
        child: const Icon(Icons.check, color: CColors.textOnColor, size: 16),
      );
    }
    if (step.isCurrent) {
      return Container(
        width: 24,
        height: 24,
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: CColors.primary, width: 2),
        ),
        child: Container(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: CColors.primary,
          ),
        ),
      );
    }
    return Container(
      width: 24,
      height: 24,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: CColors.borderStrong, width: 1),
      ),
    );
  }
}

class _CProgressStepVertical extends StatelessWidget {
  const _CProgressStepVertical({required this.step, required this.isLast});
  final CProgressStep step;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            _CProgressStepHorizontal(
              step: step,
              isLast: true,
            )._buildCircle(context),
            if (!isLast)
              Container(
                width: 1,
                height: 48,
                color: _CProgressStepHorizontal(
                  step: step,
                  isLast: true,
                )._getConnectorColor(context),
              ),
          ],
        ),
        const SizedBox(width: CSpacing.medium),
        Padding(
          padding: const EdgeInsets.only(top: 4.0),
          child: Text(
            step.label,
            style: CTypography.label01.copyWith(
              color: _CProgressStepHorizontal(
                step: step,
                isLast: true,
              )._getTextColor(context),
            ),
          ),
        ),
      ],
    );
  }
}
