// ===========================================================================
// database_helper.dart  -  the database file of the project.
//
// We use SQLite (a small database inside the phone) through the "sqflite"
// package. This is the ONLY file that writes SQL. Screens just call functions
// like login() or addUser().
// ===========================================================================

import 'package:path/path.dart'; // gives us join()
import 'package:sqflite/sqflite.dart'; // gives us the database

import '../models/user.dart';

class DatabaseHelper {
  // -------------------------------------------------------------------------
  // SINGLETON
  // These 3 lines make sure only ONE DatabaseHelper exists in the whole app.
  // Every time you write DatabaseHelper() you get the same object back.
  // Reason: opening the same database file twice causes errors.
  // -------------------------------------------------------------------------
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;
  DatabaseHelper._internal();

  // The open connection. null until we open it the first time.
  static Database? _db;

  // Use this in every function:  final db = await database;
  Future<Database> get database async {
    if (_db != null) return _db!; // already open -> return it
    _db = await _openDatabase(); // not open -> open it now
    return _db!;
  }

  // Opens the database file (creates it if it does not exist).
  Future<Database> _openDatabase() async {
    final path = join(await getDatabasesPath(), 'app.db');
    return openDatabase(
      path,
      version: 1, // increase this if you change the tables
      onCreate: _createTables, // runs ONLY when the file is first created
    );
  }

  // -------------------------------------------------------------------------
  // CREATING THE TABLES
  //
  // IMPORTANT: runs only ONE TIME, when the file is created. If you edit the
  // CREATE TABLE lines after running the app, nothing changes until you call
  // deleteEverything() (bottom of this file) or uninstall the app.
  // -------------------------------------------------------------------------
  Future<void> _createTables(Database db, int version) async {
    // ---- USERS table (used now, in Task 1) ----
    await db.execute('''
      CREATE TABLE users (
        id       INTEGER PRIMARY KEY AUTOINCREMENT,
        username TEXT UNIQUE,
        password TEXT,
        full_name TEXT
      )
    ''');

    // Test accounts so we can log in right away.
    await db.insert('users', {'username': 'Tammam', 'password': 'Tammam123456', 'full_name': 'Tammam Alhadwah'});
    await db.insert('users', {'username': 'Karam', 'password': 'Karam123', 'full_name': 'Karam Kanaan'});


     await db.execute('''
       CREATE TABLE expenses (
         id       INTEGER PRIMARY KEY AUTOINCREMENT,
         title    TEXT NOT NULL,
         amount   REAL NOT NULL,
         category TEXT NOT NULL,
         date     TEXT NOT NULL
       )
     ''');

     await db.execute('''
       CREATE TABLE incomes (
         id     INTEGER PRIMARY KEY AUTOINCREMENT,
         title  TEXT NOT NULL,
         amount REAL NOT NULL,
         source TEXT NOT NULL,
         date   TEXT NOT NULL
       )
     ''');

     await db.execute('''
       CREATE TABLE categories (
         id         INTEGER PRIMARY KEY AUTOINCREMENT,
         name       TEXT NOT NULL,
         iconCode   INTEGER NOT NULL,
         colorValue INTEGER NOT NULL
       )
     ''');
  }

  // =========================================================================
  // CREATE - add data
  // =========================================================================

  // Adds a new user. Returns the id of the new row.
  Future<int> addUser(String username, String password) async {
    final db = await database;
    return db.insert('users', {'username': username, 'password': password});
  }

  // =========================================================================
  // READ - get data
  // =========================================================================

  // Checks if username + password exist. Returns a User, or null if wrong.
  Future<User?> login(String username, String password) async {
    final db = await database;

    final rows = await db.query(
      'users',
      where: 'username = ? AND password = ?',
      whereArgs: [username, password],
      // The ? marks are replaced by whereArgs safely.
      // NEVER build the query by joining strings (SQL injection risk).
    );

    if (rows.isEmpty) return null; // no match -> wrong login
    return User.fromMap(rows.first); // match -> turn the row into a User
  }

  // Returns every user.
  Future<List<User>> getAllUsers() async {
    final db = await database;
    final rows = await db.query('users');
    // Turn each Map row into a User object.
    return rows.map((row) => User.fromMap(row)).toList();
  }

  // Checks if a username already exists (for the register screen later).
  Future<bool> usernameExists(String username) async {
    final db = await database;
    final rows = await db.query(
      'users',
      where: 'username = ?',
      whereArgs: [username],
    );
    return rows.isNotEmpty;
  }

  // =========================================================================
  // UPDATE - change data
  // =========================================================================

  Future<int> updatePassword(int id, String newPassword) async {
    final db = await database;
    return db.update(
      'users',
      {'password': newPassword},
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  // =========================================================================
  // DELETE - remove data
  // =========================================================================

  Future<int> deleteUser(int id) async {
    final db = await database;
    return db.delete('users', where: 'id = ?', whereArgs: [id]);
  }

  // =========================================================================
  // HELPER - development only
  // =========================================================================

  // Deletes the whole database file. Call once after changing CREATE TABLE,
  // then restart the app so the tables rebuild from zero.
  Future<void> deleteEverything() async {
    final path = join(await getDatabasesPath(), 'app.db');
    await deleteDatabase(path);
    _db = null;
  }
}
