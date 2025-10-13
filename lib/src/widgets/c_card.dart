// lib/src/widgets/c_card.dart

import 'package:flutter/material.dart';

/// A Carbon Design System compliant Card.
///
/// Cards are surfaces that display content and actions on a single topic.
/// They are essentially styled containers that get their look from the [CTheme].
class CCard extends StatelessWidget {
  const CCard({super.key, required this.child, this.onTap});

  /// The primary content of the card.
  final Widget child;

  /// An optional callback that is fired when the card is tapped.
  /// If provided, the card will have a ripple effect on tap.
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    // The Card widget automatically uses the `cardTheme` from our CTheme.
    return Card(
      // Allow children like positioned badges to draw outside the card's bounds.
      clipBehavior: Clip.none,
      child: onTap != null ? InkWell(onTap: onTap, child: child) : child,
    );
  }
}
