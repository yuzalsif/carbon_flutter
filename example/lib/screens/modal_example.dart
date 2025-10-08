import 'package:flutter/material.dart';
import 'package:carbon_flutter/carbon_flutter.dart';

class ModalExample extends StatelessWidget {
  const ModalExample({super.key});

  void _showSimpleModal(BuildContext context) {
    CModal.show(
      context,
      title: 'Simple Modal',
      content: const Text(
        'This is the content of the modal. It can be any widget you want.',
      ),
      actions: [
        CButton(
          label: 'Cancel',
          type: CButtonType.secondary,
          onPressed: () => Navigator.of(context).pop(),
        ),
        const SizedBox(width: CSpacing.small),
        CButton(label: 'OK', onPressed: () => Navigator.of(context).pop()),
      ],
    );
  }

  void _showDestructiveModal(BuildContext context) async {
    final bool? shouldDelete = await CModal.show<bool>(
      context,
      title: 'Confirm Deletion',
      content: const Text(
        'Are you sure you want to delete this item? This action cannot be undone.',
      ),
      actions: [
        CButton(
          label: 'Cancel',
          type: CButtonType.secondary,
          onPressed: () => Navigator.of(context).pop(false),
        ),
        const SizedBox(width: CSpacing.small),
        CButton(
          label: 'Delete',
          type: CButtonType.danger,
          onPressed: () => Navigator.of(context).pop(true),
        ),
      ],
    );

    if (context.mounted) {
      if (shouldDelete == true) {
        CSnackbar.show(
          context,
          title: 'Item deleted.',
          type: CSnackbarType.success,
        );
      } else {
        CSnackbar.show(context, title: 'Deletion cancelled.');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CButton(
          label: 'Show Simple Modal',
          onPressed: () => _showSimpleModal(context),
        ),
        const SizedBox(height: CSpacing.medium),
        CButton(
          label: 'Show Destructive Modal',
          onPressed: () => _showDestructiveModal(context),
        ),
      ],
    );
  }
}
