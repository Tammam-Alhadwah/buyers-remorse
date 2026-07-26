// ===========================================================================
// constants.dart  -  values used all over the app, kept in ONE place.
// Change something here and it changes everywhere. No magic numbers scattered
// around the code.
// ===========================================================================

import 'package:flutter/material.dart';

// -------- TEXT --------
const String kAppName = 'My Wallet';

// -------- COLORS --------
// 0xFF means "fully visible", then the 6-digit hex color.
const Color kPrimaryColor = Color(0xFF1E5F8C); // dark blue (main color)
const Color kAccentColor = Color(0xFF4FA3C4); // light blue
const Color kExpenseColor = Color(0xFFD2544F); // red   (money going out)
const Color kIncomeColor = Color(0xFF3BA776); // green (money coming in)

// -------- SPACING --------
// Standard gaps so all screens breathe the same way.
const double kPadding = 16.0;
const double kRadius = 16.0; // corner rounding for cards and buttons
