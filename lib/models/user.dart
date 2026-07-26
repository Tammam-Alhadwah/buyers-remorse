// ===========================================================================
// user.dart  -  the User model.
//
// A "model" is a plain class that describes ONE thing in the app.
// The database speaks Maps; our screens speak objects. This class translates
// between the two using toMap() and fromMap().
// ===========================================================================

class User {
  final int? id; // null before saving; the database fills it in
  final String username;
  final String password;

  User({this.id, required this.username, required this.password});

  // Object  ->  Map   (used when SAVING to the database)
  Map<String, dynamic> toMap() {
    return {'id': id, 'username': username, 'password': password};
  }

  // Map  ->  Object   (used when READING from the database)
  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] as int?,
      username: map['username'] as String,
      password: map['password'] as String,
    );
  }
}
