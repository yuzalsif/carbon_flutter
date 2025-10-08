import 'package:flutter/material.dart';
import 'package:carbon_flutter/carbon_flutter.dart';

/// A Carbon Design System compliant clickable Tile.
class CClickableTile extends StatelessWidget {
  const CClickableTile({
    super.key,
    required this.child,
    this.onTap,
    this.enabled = true,
  });

  final Widget child;
  final VoidCallback? onTap;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: enabled ? 1.0 : 0.5,
      child: Material(
        color: CColors.backgroundComponent,
        child: InkWell(
          onTap: enabled ? onTap : null,
          child: Container(
            padding: const EdgeInsets.all(CSpacing.medium),
            child: child,
          ),
        ),
      ),
    );
  }
}

/// A Carbon Design System compliant expandable Tile.
class CExpandableTile extends StatefulWidget {
  const CExpandableTile({
    super.key,
    required this.title,
    required this.expandedContent,
    this.initiallyExpanded = false,
  });

  final String title;
  final Widget expandedContent;
  final bool initiallyExpanded;

  @override
  State<CExpandableTile> createState() => _CExpandableTileState();
}

class _CExpandableTileState extends State<CExpandableTile> {
  late bool _isExpanded;

  @override
  void initState() {
    super.initState();
    _isExpanded = widget.initiallyExpanded;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: CColors.backgroundComponent,
      child: Column(
        children: [
          InkWell(
            onTap: () => setState(() => _isExpanded = !_isExpanded),
            child: Container(
              padding: const EdgeInsets.all(CSpacing.medium),
              child: Row(
                children: [
                  AnimatedRotation(
                    turns: _isExpanded ? 0.25 : 0,
                    duration: const Duration(milliseconds: 200),
                    child: const Icon(Icons.chevron_right, size: 20),
                  ),
                  const SizedBox(width: CSpacing.medium),
                  Expanded(
                    child: Text(widget.title, style: CTypography.body01),
                  ),
                ],
              ),
            ),
          ),
          AnimatedCrossFade(
            firstChild: const SizedBox.shrink(),
            secondChild: Container(
              padding: const EdgeInsets.all(CSpacing.medium),
              width: double.infinity,
              child: widget.expandedContent,
            ),
            crossFadeState: _isExpanded
                ? CrossFadeState.showSecond
                : CrossFadeState.showFirst,
            duration: const Duration(milliseconds: 200),
          ),
        ],
      ),
    );
  }
}
