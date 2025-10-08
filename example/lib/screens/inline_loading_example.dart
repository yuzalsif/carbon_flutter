import 'package:flutter/material.dart';
import 'package:carbon_flutter/carbon_flutter.dart';

class InlineLoadingExample extends StatefulWidget {
  const InlineLoadingExample({super.key});
  @override
  State<InlineLoadingExample> createState() => _InlineLoadingExampleState();
}

class _InlineLoadingExampleState extends State<InlineLoadingExample> {
  CInlineLoadingStatus _status = CInlineLoadingStatus.loading;

  void _simulateRequest() {
    setState(() => _status = CInlineLoadingStatus.loading);

    // Simulate a network request
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        setState(() => _status = CInlineLoadingStatus.success);
      }
      // Reset after a while
      Future.delayed(const Duration(seconds: 2), () {
        if (mounted) {
          setState(() => _status = CInlineLoadingStatus.loading);
        }
      });
    });
  }

  void _simulateFailedRequest() {
    setState(() => _status = CInlineLoadingStatus.loading);
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        setState(() => _status = CInlineLoadingStatus.error);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Live Example', style: CTypography.heading03),
        const SizedBox(height: CSpacing.medium),
        CInlineLoading(
          status: _status,
          loadingText: 'Submitting request...',
          successText: 'Submission successful!',
          errorText: 'Submission failed.',
        ),
        const SizedBox(height: CSpacing.medium),
        Row(
          children: [
            CButton(
              label: 'Simulate Success',
              onPressed: _simulateRequest,
              type: CButtonType.secondary,
            ),
            const SizedBox(width: CSpacing.medium),
            CButton(
              label: 'Simulate Error',
              onPressed: _simulateFailedRequest,
              type: CButtonType.secondary,
            ),
          ],
        ),
      ],
    );
  }
}
