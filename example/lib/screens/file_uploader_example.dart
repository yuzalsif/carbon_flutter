import 'package:flutter/material.dart';
import 'package:carbon_flutter/carbon_flutter.dart';

// Note: To make this functional, you would add a package like `file_picker`
// and implement the file selection logic inside the `onTap` callback.

class FileUploaderExample extends StatelessWidget {
  const FileUploaderExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CFileUploader(
          onTap: () {
            CSnackbar.show(
              context,
              title: 'File picker would open here.',
              subtitle: 'Use a package like file_picker to implement this.',
            );
          },
        ),
        const SizedBox(height: CSpacing.large),
        const CFileUploader(
          buttonLabel: 'Disabled uploader',
          onTap: null,
          enabled: false,
        ),
      ],
    );
  }
}
