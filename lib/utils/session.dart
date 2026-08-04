// ===========================================================================
// session.dart  -  remembers WHO is logged in, for the whole app.
//
// WHY THIS FILE EXISTS
// Expenses and incomes now belong to a user, so almost every database call
// needs the logged-in user's id. That id is discovered in one place (the
// login screen) and needed in many (both providers, the categories screen).
//
// Passing it down through every screen constructor would mean adding a
// parameter to a dozen widgets that do not care about it. Instead the app
// keeps one small box: login puts the user in, logout takes them out, and
// anyone who needs the id asks here.
//
// It is deliberately tiny and dependency-free (it imports only the User
// model), so nothing else in the app has to import a screen or a provider to
// find out who is signed in.
//
// NOTE: this is in-memory only. Closing the app ends the session, which is
// what we want - there is no "stay logged in" requirement, and storing a
// session on disk would mean storing credentials.
// ===========================================================================

import '../models/user.dart';

class Session {
  // A private constructor: Session is a box of static values, never an object
  // you create. Writing Session() is now a compile error instead of a bug.
  Session._();

  static User? _currentUser;

  // ---- reading ----

  static User? get currentUser => _currentUser;

  // null when nobody is logged in. Use this when "not logged in" is a normal
  // situation you want to handle yourself.
  static int? get userId => _currentUser?.id;

  static bool get isLoggedIn => _currentUser?.id != null;

  // Use this inside the app's logged-in half, where being signed in is
  // guaranteed. If it ever is not, this throws immediately with a clear
  // message - far easier to find than a screen quietly showing an empty list
  // or, worse, saving a row with no owner.
  static int requireUserId() {
    final id = _currentUser?.id;
    if (id == null) {
      throw StateError('No user is logged in - Session.start() was not called');
    }
    return id;
  }

  // ---- writing ----

  // Called by the login screen after the database confirmed the password.
  static void start(User user) {
    _currentUser = user;
  }

  // Called after the password changed, so the copy we keep is not stale.
  static void update(User user) {
    _currentUser = user;
  }

  // Called on logout.
  static void end() {
    _currentUser = null;
  }
}
