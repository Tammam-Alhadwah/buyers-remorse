// ===========================================================================
// custom_button.dart  -  one button style reused everywhere.
//
// STUB for a later task. Instead of styling every button by hand, use this:
//   CustomButton(text: 'Save', onPressed: saveExpense)
// ===========================================================================

import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed; // the function to run when tapped

  const CustomButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    // Uses the ElevatedButton style already set in app_theme.dart.
    return ElevatedButton(onPressed: onPressed, child: Text(text));
  }
}
