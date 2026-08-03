// ===========================================================================
// change_password_screen.dart  -  FR3: change the password of the logged-in
// user.
//
// Three fields: current password, new password, confirm new password.
// The current password is checked against the database FIRST, so somebody who
// picks up an unlocked phone cannot silently take over the account.
//
// When it succeeds we pop and return the updated User, so the screen that
// opened us can keep its copy of the user in sync.
// ===========================================================================

import 'package:flutter/material.dart';

import '../models/user.dart';
import '../utils/constants.dart';
import '../utils/validators.dart';
import '../database/database_helper.dart';

class ChangePasswordScreen extends StatefulWidget {
  // The user whose password we are changing. Passed in from the drawer.
  final User user;

  const ChangePasswordScreen({super.key, required this.user});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final _formKey = GlobalKey<FormState>();

  final currentController = TextEditingController();
  final newController = TextEditingController();
  final confirmController = TextEditingController();

  bool hidePasswords = true;
  bool isLoading = false;

  @override
  void dispose() {
    currentController.dispose();
    newController.dispose();
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

  Future<void> save() async {
    if (!_formKey.currentState!.validate()) return;

    // A user id is required to update the row. It can only be null for a User
    // object that was never saved, which cannot happen after a real login,
    // but we check instead of using ! and risking a crash.
    final userId = widget.user.id;
    if (userId == null) {
      _showMessage('Session problem. Please log in again.');
      return;
    }

    final currentPassword = currentController.text;
    final newPassword = newController.text;

    setState(() => isLoading = true);

    try {
      // STEP 1: is the CURRENT password really correct?
      final ok = await DatabaseHelper().verifyPassword(userId, currentPassword);
      if (!mounted) return;

      if (!ok) {
        _showMessage('Your current password is not correct');
        return;
      }

      // STEP 2: write the new one. updatePassword returns the number of rows
      // it changed; 0 would mean the account no longer exists.
      final changed = await DatabaseHelper().updatePassword(
        userId,
        newPassword,
      );
      if (!mounted) return;

      if (changed == 0) {
        _showMessage('Account not found. Please log in again.');
        return;
      }

      // STEP 3: hand the refreshed user back to the screen that opened us,
      // so its copy does not keep the old password.
      final updatedUser = widget.user.copyWith(password: newPassword);
      Navigator.pop(context, updatedUser);
    } catch (e) {
      if (!mounted) return;
      _showMessage('Could not change the password. Please try again.');
    } finally {
      if (mounted) setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Change Password')),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(kPadding),
          children: [
            // A short explanation card, so the screen is self-explaining.
            Container(
              padding: const EdgeInsets.all(kPadding),
              decoration: BoxDecoration(
                color: kAccentColor.withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(kRadius),
              ),
              child: Row(
                children: [
                  const Icon(Icons.info_outline, color: kPrimaryColor),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      'Signed in as ${widget.user.username}. '
                      'Enter your current password to set a new one.',
                      style: const TextStyle(color: kPrimaryColor),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // ---- CURRENT PASSWORD ----
            TextFormField(
              controller: currentController,
              enabled: !isLoading,
              obscureText: hidePasswords,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                labelText: 'Current password',
                prefixIcon: const Icon(Icons.lock_clock),
                suffixIcon: IconButton(
                  icon: Icon(
                    hidePasswords ? Icons.visibility : Icons.visibility_off,
                  ),
                  onPressed: () =>
                      setState(() => hidePasswords = !hidePasswords),
                ),
              ),
              // Only "not empty" here: the old password follows the old rules.
              validator: Validators.loginPassword,
            ),

            const SizedBox(height: 16),

            // ---- NEW PASSWORD ----
            TextFormField(
              controller: newController,
              enabled: !isLoading,
              obscureText: hidePasswords,
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(
                labelText: 'New password',
                prefixIcon: Icon(Icons.lock),
                helperText: 'At least 6 characters, letters + numbers',
              ),
              validator: (value) {
                // First the normal strength rules...
                final strengthError = Validators.password(value);
                if (strengthError != null) return strengthError;
                // ...then one extra rule that only makes sense here.
                if (value == currentController.text) {
                  return 'The new password must be different';
                }
                return null;
              },
            ),

            const SizedBox(height: 16),

            // ---- CONFIRM NEW PASSWORD ----
            TextFormField(
              controller: confirmController,
              enabled: !isLoading,
              obscureText: hidePasswords,
              textInputAction: TextInputAction.done,
              onFieldSubmitted: (_) => isLoading ? null : save(),
              decoration: const InputDecoration(
                labelText: 'Confirm new password',
                prefixIcon: Icon(Icons.lock_outline),
              ),
              validator: (value) =>
                  Validators.confirmPassword(value, newController.text),
            ),

            const SizedBox(height: 28),

            ElevatedButton(
              onPressed: isLoading ? null : save,
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
                      'SAVE NEW PASSWORD',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
