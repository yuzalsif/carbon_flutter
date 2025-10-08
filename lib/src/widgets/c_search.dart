import 'package:flutter/material.dart';
import 'package:carbon_flutter/carbon_flutter.dart';

/// A Carbon Design System compliant Search input field.
class CSearch extends StatefulWidget {
  const CSearch({
    super.key,
    this.labelText = 'Search',
    this.hintText,
    this.onChanged,
    this.onSubmitted,
    this.enabled = true,
  });

  final String labelText;
  final String? hintText;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final bool enabled;

  @override
  State<CSearch> createState() => _CSearchState();
}

class _CSearchState extends State<CSearch> {
  final _controller = TextEditingController();
  bool _showClearButton = false;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {
        _showClearButton = _controller.text.isNotEmpty;
      });
      widget.onChanged?.call(_controller.text);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _clearText() {
    _controller.clear();
    widget.onChanged?.call('');
  }

  @override
  Widget build(BuildContext context) {
    return CTextInput(
      labelText: widget.labelText,
      controller: _controller,
      hintText: widget.hintText,
      enabled: widget.enabled,
      onSubmitted: widget.onSubmitted,
      prefixIcon: const Icon(Icons.search, size: 20),
      suffixIcon: _showClearButton
          ? IconButton(
              icon: const Icon(Icons.close, size: 20),
              onPressed: _clearText,
            )
          : null,
    );
  }
}
