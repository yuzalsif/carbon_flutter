import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; 
import 'package:carbon_flutter/carbon_flutter.dart';

/// A Carbon Design System compliant Date Picker.
///
/// This widget combines a text input with a calendar icon to launch
/// a native date picker dialog.
class CDatePicker extends StatefulWidget {
  const CDatePicker({
    super.key,
    required this.labelText,
    this.initialDate,
    this.firstDate,
    this.lastDate,
    required this.onDateSelected,
    this.enabled = true,
  });

  final String labelText;
  final DateTime? initialDate;
  final DateTime? firstDate;
  final DateTime? lastDate;
  final ValueChanged<DateTime> onDateSelected;
  final bool enabled;

  @override
  State<CDatePicker> createState() => _CDatePickerState();
}

class _CDatePickerState extends State<CDatePicker> {
  late final TextEditingController _controller;
  static final DateFormat _dateFormat = DateFormat('MM/dd/yyyy');

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(
      text: widget.initialDate != null
          ? _dateFormat.format(widget.initialDate!)
          : '',
    );
  }

  @override
  void didUpdateWidget(CDatePicker oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.initialDate != oldWidget.initialDate) {
      _controller.text = widget.initialDate != null
          ? _dateFormat.format(widget.initialDate!)
          : '';
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: widget.initialDate ?? DateTime.now(),
      firstDate: widget.firstDate ?? DateTime(2000),
      lastDate: widget.lastDate ?? DateTime(2101),
    );
    if (picked != null && picked != widget.initialDate) {
      widget.onDateSelected(picked);
      setState(() {
        _controller.text = _dateFormat.format(picked);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.enabled ? () => _selectDate(context) : null,
      child: AbsorbPointer(
        // Absorb pointer events to prevent keyboard from showing
        child: CTextInput(
          labelText: widget.labelText,
          controller: _controller,
          enabled: widget.enabled,
          suffixIcon: const Icon(Icons.calendar_today, size: 20),
        ),
      ),
    );
  }
}
