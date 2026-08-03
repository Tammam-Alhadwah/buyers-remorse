// ===========================================================================
// dashboard_screen.dart  -  the main screen after logging in.
//
// Module 1 scope: it is the "home" of a logged-in session. It receives the
// User, hosts the side menu (AppDrawer) that leads to every other module, and
// offers logout (FR4) from the app bar.
//
// The balance, totals and charts belong to the reports/dashboard task and are
// deliberately NOT here yet.
//
// It is a StatefulWidget because the User can change while the screen is open
// (after a password change) and the screen must redraw with the new object.
// ===========================================================================

import 'package:flutter/material.dart';

import '../models/user.dart';
import '../utils/constants.dart';
import '../widgets/app_drawer.dart';
import 'login_screen.dart';

class DashboardScreen extends StatefulWidget {
  // Receives the user sent from the login screen.
  final User user;

  const DashboardScreen({super.key, required this.user});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  // A copy we are allowed to replace. widget.user itself is final.
  late User currentUser = widget.user;

  // FR4: end the session, with a confirmation first.
  Future<void> logout() async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Log out'),
        content: const Text('Do you want to end your session?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext, false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(dialogContext, true),
            child: const Text('Log out'),
          ),
        ],
      ),
    );

    // null = the dialog was dismissed by tapping outside.
    if (confirmed != true || !mounted) return;

    // Go back to login and remove all screens behind it, so the
    // back button cannot return to the dashboard.
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const LoginScreen()),
      (route) => false, // remove everything
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        actions: [
          // Logout button on the right of the app bar.
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: 'Logout',
            onPressed: logout,
          ),
        ],
      ),

      // The side menu with links to all modules. When the change-password
      // screen returns a new User, we store it and redraw.
      drawer: AppDrawer(
        user: currentUser,
        onUserChanged: (updated) => setState(() => currentUser = updated),
      ),

      // Center puts its child in the middle of the screen.
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(kPadding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.check_circle, size: 90, color: kPrimaryColor),

              const SizedBox(height: 20),

              Text(
                'Welcome, ${currentUser.displayName}',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              const Text(
                'Open the menu to manage your expenses, incomes and categories.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
