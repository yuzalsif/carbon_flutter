import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:carbon_flutter/carbon_flutter.dart';

/// A Carbon Design System compliant Slider.
class CSlider extends StatefulWidget {
  const CSlider({
    super.key,
    required this.labelText,
    required this.value,
    required this.onChanged,
    this.min = 0.0,
    this.max = 100.0,
    this.enabled = true,
  });

  final String labelText;
  final double value;
  final ValueChanged<double> onChanged;
  final double min;
  final double max;
  final bool enabled;

  @override
  State<CSlider> createState() => _CSliderState();
}

class _CSliderState extends State<CSlider> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.value.toStringAsFixed(0));
  }

  @override
  void didUpdateWidget(CSlider oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.value != oldWidget.value) {
      // Update text field only if the value has changed from outside
      _controller.text = widget.value.toStringAsFixed(0);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onSliderChanged(double newValue) {
    _controller.text = newValue.toStringAsFixed(0);
    widget.onChanged(newValue);
  }

  void _onTextFieldSubmitted(String textValue) {
    final double? parsedValue = double.tryParse(textValue);
    if (parsedValue != null) {
      final clampedValue = parsedValue.clamp(widget.min, widget.max);
      widget.onChanged(clampedValue);
    } else {
      // If parsing fails, reset to the current value
      _controller.text = widget.value.toStringAsFixed(0);
    }
  }

  @override
  Widget build(BuildContext context) {
    final bool isEnabled = widget.enabled;

    return Opacity(
      opacity: isEnabled ? 1.0 : 0.5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.labelText, style: CTypography.label01),
          const SizedBox(height: CSpacing.medium),
          Row(
            children: [
              Expanded(
                child: SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    activeTrackColor: CColors.primary,
                    inactiveTrackColor: CColors.borderSubtle,
                    thumbColor: CColors.primary,
                    overlayColor: CColors.primary.withValues(alpha: 0.2),
                  ),
                  child: Slider(
                    value: widget.value,
                    min: widget.min,
                    max: widget.max,
                    onChanged: isEnabled ? _onSliderChanged : null,
                  ),
                ),
              ),
              const SizedBox(width: CSpacing.medium),
              SizedBox(
                width: 80,
                child: CTextInput(
                  labelText: '', // Label is handled above
                  controller: _controller,
                  enabled: isEnabled,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  onSubmitted: _onTextFieldSubmitted,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
