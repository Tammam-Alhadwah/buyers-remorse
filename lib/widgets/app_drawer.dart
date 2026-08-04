// ===========================================================================
// app_drawer.dart  -  the side menu (Drawer) required by the specification:
// "a side menu containing links to every module of the system".
//
// It lives in widgets/ because EVERY main screen shows the same menu. Writing
// it once here means adding a new link later changes one file, not ten.
//
// It needs to know who is logged in (for the header and for the change
// password screen), and it reports back through onUserChanged when that user
// object changes, so the screen holding it stays in sync.
//
// The file also holds the two logout pieces, because the specification asks
// for logout in TWO places - in the side menu and in the app bar of every
// screen:
//     confirmLogout()   the question + the actual sign out
//     LogoutAction      the app bar icon that calls it
// Keeping them here means the confirmation can never differ between the two.
// ===========================================================================

import 'package:flutter/material.dart';

import '../models/user.dart';
import '../utils/constants.dart';
import '../utils/session.dart';
import '../providers/expense_provider.dart';
import '../providers/income_provider.dart';
import '../screens/login_screen.dart';
import '../screens/change_password_screen.dart';
import '../expenses/expenses_list_screen.dart';
import '../expenses/search_expenses_screen.dart';
import '../incomes/incomes_screen.dart';
import '../categories/categories_screen.dart';
import '../reports/reports_screen.dart';

// ---------------------------------------------------------------------------
// FR4: end the session. A top-level function rather than a method, so both
// the menu tile and the app bar icon of every screen call the same code.
//
// We ask for confirmation first: logging out by an accidental tap costs the
// user their password again for nothing.
// ---------------------------------------------------------------------------
Future<void> confirmLogout(BuildContext context) async {
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

  // showDialog returns null if the user tapped outside the dialog.
  if (confirmed != true) return;
  if (!context.mounted) return;

  // Forget who was logged in, and throw away the lists the providers are
  // holding in memory. The providers are singletons that outlive this screen,
  // so without clear() the next person to sign in could be shown the previous
  // person's rows out of the cache before the first reload finishes.
  Session.end();
  ExpenseProvider().clear();
  IncomeProvider().clear();

  // pushAndRemoveUntil throws away EVERY screen behind us, so the back button
  // cannot walk back into the logged-in part of the app.
  Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(builder: (_) => const LoginScreen()),
        (route) => false, // remove everything
  );
}

// The app bar icon required on every screen by the shared-design section of
// the specification. As a widget it costs one line per screen:
//     actions: const [LogoutAction()]
class LogoutAction extends StatelessWidget {
  const LogoutAction({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.logout),
      tooltip: 'Logout',
      onPressed: () => confirmLogout(context),
    );
  }
}

class AppDrawer extends StatelessWidget {
  final User user;

  // Called when the user object was replaced (after a password change).
  // Optional: a screen that does not care can simply not pass it.
  final ValueChanged<User>? onUserChanged;

  const AppDrawer({super.key, required this.user, this.onUserChanged});

  // ---------------------------------------------------------------------
  // Small helper: close the drawer, then open a screen.
  // Closing first matters - otherwise the menu stays open underneath and is
  // still there when the user comes back.
  // ---------------------------------------------------------------------
  Future<T?> _openScreen<T>(BuildContext context, Widget screen) {
    // We grab the navigator BEFORE closing the drawer. After pop() this
    // widget is being removed, and reading Navigator.of(context) from a
    // widget that is going away can throw.
    final navigator = Navigator.of(context);
    navigator.pop(); // close the drawer
    return navigator.push<T>(MaterialPageRoute(builder: (_) => screen));
  }

  // First letter of the name, used as a simple avatar. Never crashes on an
  // empty string.
  String _initial(String name) {
    return name.isEmpty ? '?' : name.substring(0, 1).toUpperCase();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero, // remove the default top gap
        children: [
          // -------- HEADER: who is logged in --------
          UserAccountsDrawerHeader(
            decoration: const BoxDecoration(color: kPrimaryColor),
            accountName: Text(
              user.displayName,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            accountEmail: Text('@${user.username}'),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: Text(
                _initial(user.displayName),
                style: const TextStyle(
                  color: kPrimaryColor,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          // -------- DASHBOARD --------
          ListTile(
            leading: const Icon(Icons.dashboard, color: kPrimaryColor),
            title: const Text('Dashboard'),
            onTap: () {
              final navigator = Navigator.of(context);
              navigator.pop(); // close the drawer
              // The dashboard is the first route after login, so popping back
              // to it works from any module screen.
              navigator.popUntil((route) => route.isFirst);
            },
          ),

          const Divider(height: 1),

          // -------- MODULE SCREENS --------
          ListTile(
            leading: const Icon(Icons.receipt_long, color: kExpenseColor),
            title: const Text('Expenses'),
            onTap: () => _openScreen(context, ExpensesListScreen(user: user)),
          ),
          ListTile(
            leading: const Icon(Icons.savings, color: kIncomeColor),
            title: const Text('Incomes'),
            onTap: () => _openScreen(context, IncomesScreen(user: user)),
          ),
          ListTile(
            leading: const Icon(Icons.category, color: kAccentColor),
            title: const Text('Categories'),
            onTap: () => _openScreen(context, CategoriesScreen(user: user)),
          ),

          // FR16 - FR20
          ListTile(
            leading: const Icon(Icons.search, color: kPrimaryColor),
            title: const Text('Search'),
            onTap: () => _openScreen(context, SearchExpensesScreen(user: user)),
          ),

          // FR21 - FR25
          ListTile(
            leading: const Icon(Icons.bar_chart, color: kAccentColor),
            title: const Text('Reports'),
            onTap: () => _openScreen(context, ReportsScreen(user: user)),
          ),

          const Divider(height: 1),

          // -------- ACCOUNT --------
          ListTile(
            leading: const Icon(Icons.password, color: kPrimaryColor),
            title: const Text('Change Password'),
            onTap: () async {
              // The screen returns the updated User when it succeeds.
              final updated = await _openScreen<User>(
                context,
                ChangePasswordScreen(user: user),
              );
              if (updated != null) {
                // Keep the session copy in step with the new password, so a
                // later screen never works from a stale User.
                Session.update(updated);
                onUserChanged?.call(updated);
              }
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout, color: kExpenseColor),
            title: const Text('Logout'),
            onTap: () => confirmLogout(context),
          ),
        ],
      ),
    );
  }
}