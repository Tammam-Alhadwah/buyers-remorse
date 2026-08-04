// ===========================================================================
// dashboard_card.dart  -  one colored summary box of the dashboard.
//
// The dashboard shows the same shape three times (balance, total income,
// total expenses) with different words and colors. Writing that box once here
// means the three cards can never drift apart, and a change to the padding or
// the corner radius happens in ONE place.
//
// The widget knows nothing about money or the database. It is given a title,
// a value and a color, and it draws them - that is the whole job. Keeping it
// "dumb" like this is what makes it reusable.
// ===========================================================================

import 'package:flutter/material.dart';
import '../utils/constants.dart';

class DashboardCard extends StatelessWidget {
  final String title; // e.g. "Balance"
  final String value; // e.g. "1,250.00"
  final Color color;
  final IconData? icon; // optional picture on the right
  final String? subtitle; // optional small line under the value
  final bool large; // true = the wide hero card at the top
  final VoidCallback? onTap; // optional: make the card tappable

  const DashboardCard({
    super.key,
    required this.title,
    required this.value,
    this.color = kPrimaryColor,
    this.icon,
    this.subtitle,
    this.large = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final card = Container(
      padding: const EdgeInsets.all(kPadding),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(kRadius),
        boxShadow: [
          // A soft shadow in the card's own color: it lifts the box off the
          // grey page without the dirty grey halo a black shadow gives.
          BoxShadow(
            color: color.withValues(alpha: 0.25),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          // Expanded lets the texts take all the space that is left after the
          // icon, so a long amount wraps instead of overflowing the screen.
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  style: const TextStyle(color: Colors.white70, fontSize: 14),
                ),
                const SizedBox(height: 6),
                // FittedBox shrinks the text instead of letting a very large
                // number spill outside the card.
                FittedBox(
                  fit: BoxFit.scaleDown,
                  alignment: Alignment.centerLeft,
                  child: Text(
                    value,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: large ? 32 : 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                if (subtitle != null) ...[
                  const SizedBox(height: 4),
                  Text(
                    subtitle!,
                    style: const TextStyle(color: Colors.white70, fontSize: 12),
                  ),
                ],
              ],
            ),
          ),

          if (icon != null) ...[
            const SizedBox(width: 8),
            Icon(icon, color: Colors.white24, size: large ? 46 : 30),
          ],
        ],
      ),
    );

    // Nothing to tap? Return the plain card. Otherwise wrap it so the user
    // also gets the ripple animation that says "this is a button".
    if (onTap == null) return card;

    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(kRadius),
      child: InkWell(
        borderRadius: BorderRadius.circular(kRadius),
        onTap: onTap,
        child: card,
      ),
    );
  }
}