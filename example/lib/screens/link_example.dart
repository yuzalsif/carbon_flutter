import 'package:flutter/material.dart';
import 'package:carbon_flutter/carbon_flutter.dart';

class LinkExample extends StatelessWidget {
  const LinkExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CLink(
          text: 'This is an active link',
          onTap: () {
            CSnackbar.show(context, title: 'Link tapped!');
          },
        ),
        const SizedBox(height: CSpacing.medium),
        const CLink(
          text: 'This is a disabled link',
          onTap: null,
          enabled: false,
        ),
      ],
    );
  }
}
