// ===========================================================================
// dashboard_screen.dart  -  the main screen after logging in.
//
// Task 1: it just shows a "Hello World" welcome message.
// Later it will show the balance, recent expenses, charts, etc.
// ===========================================================================

import 'package:flutter/material.dart';

import '../utils/constants.dart';
import 'login_screen.dart';

class DashboardScreen extends StatelessWidget {
  // Receives the username sent from the login screen.
  final String username;

  const DashboardScreen({super.key, this.username = ''});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        actions: [
          // Logout button on the right of the app bar.
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              // Go back to login and remove all screens behind it, so the
              // back button cannot return to the dashboard.
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const LoginScreen()),
                (route) => false, // remove everything
              );
            },
          ),
        ],
      ),

      // Center puts its child in the middle of the screen.
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.check_circle, size: 90, color: kPrimaryColor),

            const SizedBox(height: 20),

            const Text(
              'Hello World',
              style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            Text(
              username.isEmpty ? 'You are logged in' : 'Welcome, $username',
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
