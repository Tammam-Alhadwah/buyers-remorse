// ===========================================================================
// register_screen.dart  -  sign-up screen (FR2).
//
// Creates a new row in the users table through DatabaseHelper.addUser().
// When the account is created we close the screen and hand the username back
// to the login screen:  Navigator.pop(context, username).
// ===========================================================================

import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart' show DatabaseException;

import '../utils/constants.dart';
import '../utils/validators.dart';
import '../database/database_helper.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();

  final fullNameController = TextEditingController();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmController = TextEditingController();

  bool hidePassword = true;
  bool isLoading = false;

  @override
  void dispose() {
    // Every controller we create must be disposed, or its memory leaks.
    fullNameController.dispose();
    usernameController.dispose();
    passwordController.dispose();
    confirmController.dispose();
    super.dispose();
  }

  void _showMessage(String message, {bool isError = true}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: isError ? kExpenseColor : kIncomeColor,
      ),
    );
  }

  Future<void> register() async {
    // STEP 1: the instant rules (empty, length, characters, passwords match).
    if (!_formKey.currentState!.validate()) return;

    // STEP 2: clean the text before it reaches the database.
    final fullName = Validators.sanitize(fullNameController.text);
    final username = Validators.sanitize(usernameController.text);
    final password = passwordController.text;

    setState(() => isLoading = true);

    try {
      // STEP 3: the rule that needs the database - is the name taken?
      // We ask first so the user gets a clear message on the right field.
      final taken = await DatabaseHelper().usernameExists(username);
      if (!mounted) return;

      if (taken) {
        _showMessage('This username is already taken');
        return; // finally below still turns the spinner off
      }

      // STEP 4: insert. If two people registered the same name at the same
      // moment, the UNIQUE column still stops the second one - that is the
      // DatabaseException we catch below.
      await DatabaseHelper().addUser(username, password, fullName);
      if (!mounted) return;

      // STEP 5: close this screen and give the username back to login.
      Navigator.pop(context, username);
    } on DatabaseException catch (e) {
      if (!mounted) return;
      // isUniqueConstraintError() tells us the failure was a duplicate
      // username and not some other database problem.
      if (e.isUniqueConstraintError()) {
        _showMessage('This username is already taken');
      } else {
        _showMessage('Could not create the account. Please try again.');
      }
    } catch (e) {
      if (!mounted) return;
      _showMessage('Could not create the account. Please try again.');
    } finally {
      if (mounted) setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Create Account')),

      // Same gradient as the login screen so the two feel like one flow.
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [kPrimaryColor, kAccentColor],
          ),
        ),
        child: Form(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.all(24),
            children: [
              const SizedBox(height: 10),

              const CircleAvatar(
                radius: 40,
                backgroundColor: Colors.white,
                child: Icon(Icons.person_add, size: 42, color: kPrimaryColor),
              ),

              const SizedBox(height: 16),

              const Text(
                'Join us',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 6),
              const Text(
                'Create an account to track your money',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white70, fontSize: 14),
              ),

              const SizedBox(height: 24),

              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(kRadius),
                ),
                child: Column(
                  children: [
                    // ---- FULL NAME ----
                    TextFormField(
                      controller: fullNameController,
                      enabled: !isLoading,
                      textCapitalization: TextCapitalization.words,
                      textInputAction: TextInputAction.next,
                      decoration: const InputDecoration(
                        labelText: 'Full name',
                        prefixIcon: Icon(Icons.badge),
                      ),
                      validator: Validators.fullName,
                    ),

                    const SizedBox(height: 16),

                    // ---- USERNAME ----
                    TextFormField(
                      controller: usernameController,
                      enabled: !isLoading,
                      textInputAction: TextInputAction.next,
                      decoration: const InputDecoration(
                        labelText: 'Username',
                        prefixIcon: Icon(Icons.person),
                        helperText: 'Letters, numbers and _ only',
                      ),
                      validator: Validators.username,
                    ),

                    const SizedBox(height: 16),

                    // ---- PASSWORD ----
                    TextFormField(
                      controller: passwordController,
                      enabled: !isLoading,
                      obscureText: hidePassword,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        prefixIcon: const Icon(Icons.lock),
                        helperText: 'At least 6 characters, letters + numbers',
                        suffixIcon: IconButton(
                          icon: Icon(
                            hidePassword
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                          onPressed: () =>
                              setState(() => hidePassword = !hidePassword),
                        ),
                      ),
                      validator: Validators.password,
                    ),

                    const SizedBox(height: 16),

                    // ---- CONFIRM PASSWORD ----
                    TextFormField(
                      controller: confirmController,
                      enabled: !isLoading,
                      obscureText: hidePassword,
                      textInputAction: TextInputAction.done,
                      onFieldSubmitted: (_) => isLoading ? null : register(),
                      decoration: const InputDecoration(
                        labelText: 'Confirm password',
                        prefixIcon: Icon(Icons.lock_outline),
                      ),
                      // This rule needs a second value, so we wrap it in a
                      // small function that also passes the first password.
                      validator: (value) => Validators.confirmPassword(
                        value,
                        passwordController.text,
                      ),
                    ),

                    const SizedBox(height: 24),

                    ElevatedButton(
                      onPressed: isLoading ? null : register,
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
                              'CREATE ACCOUNT',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                    ),

                    const SizedBox(height: 8),

                    // Back to login. pop() removes this screen from the stack.
                    TextButton(
                      onPressed: isLoading
                          ? null
                          : () => Navigator.pop(context),
                      child: const Text('Already have an account? Login'),
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
