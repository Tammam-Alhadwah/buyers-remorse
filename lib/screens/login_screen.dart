// ===========================================================================
// login_screen.dart  -  the first screen the user sees.
//
// Task 1: the LOGIN button just navigates to the dashboard (no database check
// yet). The database check is prepared for later - see the login() function.
// ===========================================================================

import 'package:flutter/material.dart';

import '../utils/constants.dart';
import '../database/database_helper.dart';
import 'dashboard_screen.dart';
// import '../database/database_helper.dart'; // uncomment for the DB check later

// StatefulWidget = a screen that CAN change while open.
// We need it because the password field can be hidden or shown.
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // Controllers let us READ what the user typed.
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  bool hidePassword = true; // true = show dots instead of letters

  // Runs when the screen is destroyed. Frees the controllers' memory.
  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  // Runs when the LOGIN button is pressed.
  // Runs when the LOGIN button is pressed.
  Future<void> login() async {
    // Ask the database if this username + password exist.
    // First call also opens the DB and seeds the accounts automatically.
    final user = await DatabaseHelper().login(
      usernameController.text,
      passwordController.text,
    );

    // After an await, the screen might have closed. This guard prevents a
    // crash/warning when we use `context` below. Always do this after await.
    if (!mounted) return;

    if (user == null) {
      // No match → wrong login. Show a red bar, stay here.
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Wrong username or password')),
      );
    } else {
      // Match → go to the dashboard, carrying the username with us.
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DashboardScreen(username: user.username),
        ),
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    // Scaffold = basic page: app bar on top, body below.
    return Scaffold(
      // -------- APP BAR (app name + logo) --------
      appBar: AppBar(
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Icon(Icons.account_balance_wallet), // the logo
            SizedBox(width: 8),
            Text(kAppName),
          ],
        ),
      ),

      // -------- BODY --------
      body: Container(
        // Gradient background: dark blue on top, light blue at the bottom.
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [kPrimaryColor, kAccentColor],
          ),
        ),

        // ListView = vertical list that scrolls when the keyboard appears.
        child: ListView(
          padding: const EdgeInsets.all(24),
          children: [
            const SizedBox(height: 30),

            // -------- BIG ROUND LOGO --------
            const CircleAvatar(
              radius: 45,
              backgroundColor: Colors.white,
              child: Icon(
                Icons.account_balance_wallet,
                size: 50,
                color: kPrimaryColor,
              ),
              // For a real image instead:
              //   backgroundImage: AssetImage('assets/images/logo.png'),
            ),

            const SizedBox(height: 20),

            // -------- WELCOME TEXT --------
            const Text(
              'Welcome Back',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 6),
            const Text(
              'Sign in to continue',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white70, fontSize: 14),
            ),

            const SizedBox(height: 30),

            // -------- WHITE CARD WITH THE FIELDS --------
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(kRadius),
              ),
              child: Column(
                children: [
                  // ---- USERNAME FIELD ----
                  TextField(
                    controller: usernameController,
                    decoration: const InputDecoration(
                      labelText: 'Username',
                      prefixIcon: Icon(Icons.person),
                    ),
                  ),

                  const SizedBox(height: 16),

                  // ---- PASSWORD FIELD ----
                  TextField(
                    controller: passwordController,
                    obscureText: hidePassword, // true = dots
                    decoration: InputDecoration(
                      labelText: 'Password',
                      prefixIcon: const Icon(Icons.lock),
                      // The eye button on the right.
                      suffixIcon: IconButton(
                        icon: Icon(
                          hidePassword
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: () {
                          // setState() = "redraw the screen, something changed".
                          setState(() => hidePassword = !hidePassword);
                        },
                      ),
                    ),
                  ),

                  const SizedBox(height: 24),

                  // ---- LOGIN BUTTON ----
                  ElevatedButton(
                    onPressed: login,
                    child: const Text(
                      'LOGIN',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  const SizedBox(height: 8),

                  // ---- LINK TO REGISTER (screen is a stub for now) ----
                  TextButton(
                    onPressed: () {
                      // Later: Navigator.push(... RegisterScreen ...);
                    },
                    child: const Text("Don't have an account? Register"),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              'Mobile Programming - 2026',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white70, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}
