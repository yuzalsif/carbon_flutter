import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:carbon_flutter/carbon_flutter.dart';

class CNumberInput extends StatefulWidget {
  const CNumberInput({
    super.key,
    this.labelText = '',
    required this.value,
    required this.onChanged,
    this.min = 0,
    this.max = 100,
    this.step = 1,
    this.enabled = true,
    this.onIncrement,
    this.onDecrement,
    this.onInputTap,
  });

  final String labelText;
  final num value;
  final ValueChanged<num> onChanged;
  final num min;
  final num max;
  final num step;
  final bool enabled;

  /// A custom callback for the increment (+) button.
  /// If provided, this overrides the default `value + step` logic.
  final VoidCallback? onIncrement;

  /// A custom callback for the decrement (-) button.
  /// If provided, this overrides the default `value - step` logic.
  final VoidCallback? onDecrement;

  /// A custom callback for when the text input area is tapped.
  /// Useful for opening custom dialogs.
  final VoidCallback? onInputTap;

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
        if (widget.labelText.isNotEmpty) ...[
          Text(widget.labelText, style: CTypography.label01),
          const SizedBox(height: CSpacing.small),
        ],
        Expanded(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: widget.onInputTap,
                  child: AbsorbPointer(
                    absorbing: widget.onInputTap != null,
                    child: CTextInput(
                      labelText: '',
                      controller: _controller,
                      enabled: isEnabled,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                          RegExp(r'^-?\d*\.?\d*'),
                        ),
                      ],
                      onSubmitted: _onTextFieldSubmitted,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: CSpacing.xSmall),
              Column(
                children: [
                  _buildStepperButton(
                    icon: Icons.keyboard_arrow_up,
                    onPressed: isEnabled
                        ? (widget.onIncrement ??
                              () => _updateValue(widget.value + widget.step))
                        : null,
                  ),
                  const SizedBox(width: CSpacing.halfXSmall),
                  _buildStepperButton(
                    icon: Icons.keyboard_arrow_down,
                    onPressed: isEnabled
                        ? (widget.onDecrement ??
                              () => _updateValue(widget.value - widget.step))
                        : null,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildStepperButton({
    required IconData icon,
    required VoidCallback? onPressed,
  }) {
    return SizedBox(
      width: 34,
      height: 23, // Half of the text field's inner height
      child: CButton(
        icon: Icon(icon),
        label: '',
        onPressed: onPressed,
        type: CButtonType.tertiary,
      ),
    );
  }
}
