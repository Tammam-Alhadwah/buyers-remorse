// ===========================================================================
// dashboard_card.dart  -  a small colored box for the dashboard summary.
//
// STUB for a later task. You will reuse it three times: total balance,
// total income, total expenses. Pass a title, a value, and a color.
// ===========================================================================

import 'package:flutter/material.dart';
import '../utils/constants.dart';

class DashboardCard extends StatelessWidget {
  final String title; // e.g. "Balance"
  final String value; // e.g. "1,250.00"
  final Color color;

  const DashboardCard({
    super.key,
    this.title = 'Title',
    this.value = '0.00',
    this.color = kPrimaryColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(kPadding),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(kRadius),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(color: Colors.white70)),
          const SizedBox(height: 8),
          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
