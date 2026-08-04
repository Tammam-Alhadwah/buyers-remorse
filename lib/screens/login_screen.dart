// ===========================================================================
// login_screen.dart  -  the first screen the user sees.
//
// FR1 (login) and the entry point to FR2 (register).
// The layout is unchanged; what is new is:
//   - a Form + TextFormField, so every field validates itself
//   - a loading state, so the button cannot be pressed twice
//   - pushReplacement, so the back button cannot return to the login screen
// ===========================================================================

import 'package:flutter/material.dart';

import '../utils/constants.dart';
import '../utils/validators.dart';
import '../utils/session.dart';
import '../database/database_helper.dart';
import 'dashboard_screen.dart';
import 'register_screen.dart';

// StatefulWidget = a screen that CAN change while open.
// We need it because the password field can be hidden or shown.
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // A Form needs a "key" so we can reach it from code and ask:
  //     _formKey.currentState!.validate()
  // That one call runs the validator of EVERY field inside the form and
  // returns true only if all of them returned null.
  final _formKey = GlobalKey<FormState>();

  // Controllers let us READ what the user typed.
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  bool hidePassword = true; // true = show dots instead of letters
  bool isLoading = false; // true while we are talking to the database

  // Runs when the screen is destroyed. Frees the controllers' memory.
  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  // Small helper so every screen shows messages the same way.
  void _showMessage(String message, {bool isError = true}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: isError ? kExpenseColor : kIncomeColor,
      ),
    );
  }

  // Runs when the LOGIN button is pressed.
  Future<void> login() async {
    // STEP 1: check the form. If a field is invalid, the message appears
    // under it and we stop here - the database is never touched.
    if (!_formKey.currentState!.validate()) return;

    // STEP 2: clean the input. Nobody should fail to log in because of a
    // space they did not notice at the end of their username.
    final username = Validators.sanitize(usernameController.text);
    final password = passwordController.text;

    setState(() => isLoading = true); // show the spinner

    try {
      // STEP 3: ask the database if this username + password exist.
      // The first call also opens the DB and seeds the demo accounts.
      final user = await DatabaseHelper().login(username, password);

      // After an await the user may have left the screen. Touching context
      // then would crash, so we check mounted first.
      if (!mounted) return;

      if (user == null) {
        // No match -> wrong login. One generic message for both cases: never
        // reveal whether it was the username or the password that was wrong.
        _showMessage('Wrong username or password');
      } else {
        // Match. Session.start() must happen BEFORE the dashboard is built:
        // the dashboard asks the providers for data as soon as it appears,
        // and they ask Session whose data to load.
        Session.start(user);

        // Go to the dashboard, carrying the whole User with us (we need the
        // id later, for example to change the password).
        // pushReplacement REPLACES the login screen instead of stacking on
        // top of it, so pressing back cannot come back here.
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => DashboardScreen(user: user)),
        );
      }
    } catch (e) {
      // Any unexpected database problem ends up here instead of a red screen.
      if (!mounted) return;
      _showMessage('Could not reach the database. Please try again.');
    } finally {
      // finally always runs (success OR error), so the spinner never sticks.
      if (mounted) setState(() => isLoading = false);
    }
  }

  // Opens the register screen and waits for it to close.
  // If it returns a username (the account was created), we type it in for the
  // user so they only have to enter their password.
  Future<void> openRegister() async {
    final createdUsername = await Navigator.push<String>(
      context,
      MaterialPageRoute(builder: (context) => const RegisterScreen()),
    );

    if (!mounted || createdUsername == null) return;

    setState(() {
      usernameController.text = createdUsername;
      passwordController.clear();
    });
    _showMessage('Account created. You can log in now.', isError: false);
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

        // Form wraps every field so one validate() call checks them all.
        child: Form(
          key: _formKey,
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
                    TextFormField(
                      controller: usernameController,
                      enabled: !isLoading, // frozen while logging in
                      textInputAction: TextInputAction.next,
                      decoration: const InputDecoration(
                        labelText: 'Username',
                        prefixIcon: Icon(Icons.person),
                      ),
                      validator: Validators.username,
                    ),

                    const SizedBox(height: 16),

                    // ---- PASSWORD FIELD ----
                    TextFormField(
                      controller: passwordController,
                      enabled: !isLoading,
                      obscureText: hidePassword, // true = dots
                      textInputAction: TextInputAction.done,
                      // Pressing "done" on the keyboard logs in as well.
                      onFieldSubmitted: (_) => isLoading ? null : login(),
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
                      // On login we only require "not empty": an existing
                      // account may have an old, weaker password.
                      validator: Validators.loginPassword,
                    ),

                    const SizedBox(height: 24),

                    // ---- LOGIN BUTTON ----
                    // While loading, onPressed is null -> Flutter greys the
                    // button out and a second tap is impossible.
                    ElevatedButton(
                      onPressed: isLoading ? null : login,
                      child: isLoading
                          ? const SizedBox(
                              height: 22,
                              width: 22,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                color: Colors.white,
                              ),
                            )
                          : const Text(
                              'LOGIN',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                    ),

                    const SizedBox(height: 8),

                    // ---- LINK TO REGISTER ----
                    TextButton(
                      onPressed: isLoading ? null : openRegister,
                      child: const Text("Don't have an account? Register"),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
