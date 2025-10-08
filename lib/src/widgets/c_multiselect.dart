import 'package:flutter/material.dart';
import 'package:carbon_flutter/carbon_flutter.dart';

/// A data model for an item in a [CMultiselect].
class CMultiselectItem<T> {
  const CMultiselectItem({required this.value, required this.text});
  final T value;
  final String text;
}

/// A Carbon Design System compliant Multiselect.
///
/// This implementation opens a dialog to select multiple items.
class CMultiselect<T> extends StatelessWidget {
  const CMultiselect({
    super.key,
    required this.labelText,
    required this.items,
    required this.selectedItems,
    required this.onChanged,
    this.enabled = true,
  });

  final String labelText;
  final List<CMultiselectItem<T>> items;
  final List<T> selectedItems;
  final ValueChanged<List<T>> onChanged;
  final bool enabled;

  Future<void> _showMultiselectDialog(BuildContext context) async {
    final List<T>? result = await showDialog<List<T>>(
      context: context,
      builder: (BuildContext context) {
        return _CMultiselectDialog(
          title: labelText,
          items: items,
          initialSelectedItems: selectedItems,
        );
      },
    );

    if (result != null) {
      onChanged(result);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: CTypography.label01.copyWith(color: CColors.textSecondary),
        ),
        const SizedBox(height: CSpacing.small),
        InkWell(
          onTap: enabled ? () => _showMultiselectDialog(context) : null,
          child: InputDecorator(
            decoration: const InputDecoration(), // Gets style from CTheme
            child: Wrap(
              spacing: CSpacing.small,
              runSpacing: CSpacing.small,
              children: selectedItems.isEmpty
                  ? [
                      Text(
                        'Select options...',
                        style: CTypography.bodyCompact01.copyWith(
                          color: CColors.textPlaceholder,
                        ),
                      ),
                    ]
                  : selectedItems.map((value) {
                      final item = items.firstWhere((i) => i.value == value);
                      return CTag(label: item.text);
                    }).toList(),
            ),
          ),
        ),
      ],
    );
  }
}

/// The dialog content for the multiselect.
class _CMultiselectDialog<T> extends StatefulWidget {
  const _CMultiselectDialog({
    required this.title,
    required this.items,
    required this.initialSelectedItems,
  });

  final String title;
  final List<CMultiselectItem<T>> items;
  final List<T> initialSelectedItems;

  @override
  __CMultiselectDialogState<T> createState() => __CMultiselectDialogState<T>();
}

class __CMultiselectDialogState<T> extends State<_CMultiselectDialog<T>> {
  late List<T> _selectedValues;

  @override
  void initState() {
    super.initState();
    _selectedValues = List<T>.from(widget.initialSelectedItems);
  }

  void _onItemTapped(T value) {
    setState(() {
      if (_selectedValues.contains(value)) {
        _selectedValues.remove(value);
      } else {
        _selectedValues.add(value);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      backgroundColor: CColors.backgroundComponent,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 400, maxHeight: 600),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(CSpacing.medium),
              child: Text(widget.title, style: CTypography.heading03),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: widget.items.length,
                itemBuilder: (context, index) {
                  final item = widget.items[index];
                  final bool isSelected = _selectedValues.contains(item.value);
                  return CCheckbox(
                    labelText: item.text,
                    value: isSelected,
                    onChanged: (_) => _onItemTapped(item.value),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(CSpacing.medium),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CButton(
                    label: 'Cancel',
                    type: CButtonType.secondary,
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                  const SizedBox(width: CSpacing.small),
                  CButton(
                    label: 'Done',
                    onPressed: () => Navigator.of(context).pop(_selectedValues),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
