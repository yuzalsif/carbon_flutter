import 'package:flutter/material.dart';
import 'package:carbon_flutter/carbon_flutter.dart';

/// A Carbon Design System compliant File Uploader button.
///
/// This is a UI component. The file picking logic should be
/// implemented in the `onTap` callback, likely using a package
/// like `file_picker`.
class CFileUploader extends StatelessWidget {
  const CFileUploader({
    super.key,
    this.buttonLabel = 'Add file',
    this.onTap,
    this.enabled = true,
  });

  final String buttonLabel;
  final VoidCallback? onTap;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return CButton(
      label: buttonLabel,
      icon: const Icon(Icons.upload_file, size: 20),
      onPressed: enabled ? onTap : null,
      type: CButtonType.secondary,
    );
  }
}
