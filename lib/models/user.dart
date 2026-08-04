// ===========================================================================
// user.dart  -  the User model.
//
// A "model" is a plain class that describes ONE thing in the app.
// The database speaks Maps; our screens speak objects. This class translates
// between the two using toMap() and fromMap().
//
// The users table is:
//    users(id, username, password, full_name)
// so the model must carry full_name too - the drawer and the dashboard greet
// the user by their real name, not by their login name.
// ===========================================================================

class User {
  final int? id; // null before saving; the database fills it in
  final String username;
  final String password;
  final String fullName;

  User({
    this.id,
    required this.username,
    required this.password,
    this.fullName = '',
  });

  // What the screens should print.
  //
  // Registration asks for a full name, but the two seeded test accounts and
  // any older row could still have it empty, so we fall back to the username
  // instead of showing a blank space where a name should be.
  String get displayName => fullName.trim().isEmpty ? username : fullName;

  // Object  ->  Map   (used when SAVING to the database)
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'username': username,
      'password': password,
      'full_name': fullName,
    };
  }

  // Map  ->  Object   (used when READING from the database)
  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] as int?,
      username: map['username'] as String,
      password: map['password'] as String,
      // full_name can be NULL for rows written before this column was used,
      // so we never cast it straight to String.
      fullName: (map['full_name'] as String?) ?? '',
    );
  }

  // Returns a copy with some fields changed. Used after a password change:
  // the screen gets a NEW User object instead of editing a final field.
  User copyWith({int? id, String? username, String? password, String? fullName}) {
    return User(
      id: id ?? this.id,
      username: username ?? this.username,
      password: password ?? this.password,
      fullName: fullName ?? this.fullName,
    );
  }
}