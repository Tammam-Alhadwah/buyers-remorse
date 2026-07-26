// ===========================================================================
// main.dart  -  the file Flutter runs first.
//
// It does almost nothing on purpose: it just starts the app, applies the
// theme, and shows the login screen. All the real work lives in the other
// files inside lib/.
// ===========================================================================

import 'package:flutter/material.dart';

import 'theme/app_theme.dart';
import 'utils/constants.dart';
import 'screens/login_screen.dart';

// main() = where every Dart program starts.
// runApp() puts our app on the screen.
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // MaterialApp = the root of the app: gives Material Design + settings.
    return MaterialApp(
      title: kAppName,
      debugShowCheckedModeBanner: false, // hide the red DEBUG ribbon
      theme: AppTheme.light, // the style we defined in app_theme.dart
      home: const LoginScreen(), // the first screen
    );
  }
}
