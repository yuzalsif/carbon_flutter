import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:carbon_flutter/carbon_flutter.dart';

/// A Carbon Design System compliant Number Input with stepper controls.
class CNumberInput extends StatefulWidget {
  const CNumberInput({
    super.key,
    required this.labelText,
    required this.value,
    required this.onChanged,
    this.min = 0,
    this.max = 100,
    this.step = 1,
    this.enabled = true,
  });

  final String labelText;
  final num value;
  final ValueChanged<num> onChanged;
  final num min;
  final num max;
  final num step;
  final bool enabled;

  @override
  State<CNumberInput> createState() => _CNumberInputState();
}

class _CNumberInputState extends State<CNumberInput> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.value.toString());
  }

  @override
  void didUpdateWidget(CNumberInput oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.value != oldWidget.value) {
      _controller.text = widget.value.toString();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _updateValue(num newValue) {
    final clampedValue = newValue.clamp(widget.min, widget.max);
    widget.onChanged(clampedValue);
  }

  void _onTextFieldSubmitted(String textValue) {
    final num? parsedValue = num.tryParse(textValue);
    if (parsedValue != null) {
      _updateValue(parsedValue);
    } else {
      _controller.text = widget.value.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    final bool isEnabled = widget.enabled;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.labelText, style: CTypography.label01),
        const SizedBox(height: CSpacing.small),
        Row(
          children: [
            Expanded(
              child: CTextInput(
                labelText: '',
                controller: _controller,
                enabled: isEnabled,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'^-?\d*\.?\d*')),
                ],
                onSubmitted: _onTextFieldSubmitted,
              ),
            ),
            const SizedBox(width: 2), // Small gap
            Column(
              children: [
                _buildStepperButton(
                  icon: Icons.keyboard_arrow_up,
                  onPressed: isEnabled
                      ? () => _updateValue(widget.value + widget.step)
                      : null,
                ),
                const SizedBox(height: 2),
                _buildStepperButton(
                  icon: Icons.keyboard_arrow_down,
                  onPressed: isEnabled
                      ? () => _updateValue(widget.value - widget.step)
                      : null,
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildStepperButton({
    required IconData icon,
    required VoidCallback? onPressed,
  }) {
    return SizedBox(
      width: 48,
      height: 23, // Half of the text field's inner height
      child: CButton(
        icon: Icon(icon, size: 20),
        label: '',
        onPressed: onPressed,
        type: CButtonType.secondary,
      ),
    );
  }
}
