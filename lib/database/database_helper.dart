// ===========================================================================
// database_helper.dart  -  the database file of the project.
//
// We use SQLite (a small database inside the phone) through the "sqflite"
// package. This is the ONLY file that writes SQL. Screens just call functions
// like login() or addExpense().
// ===========================================================================

import 'package:path/path.dart'; // gives us join()
import 'package:sqflite/sqflite.dart'; // gives us the database

import '../models/user.dart';
import '../models/category.dart';
import '../models/expense.dart';
import '../models/income.dart';
import '../utils/date_ranges.dart';
import '../utils/formatters.dart';

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
      version: 2, // increase this if you change the tables
      onConfigure: _onConfigure, // runs EVERY time the file is opened
      onCreate: _createTables, // runs ONLY when the file is first created
      onUpgrade: _upgradeTables, // runs when version is higher than the file's
    );
  }

  // Runs on every open, before anything else.
  // SQLite ignores FOREIGN KEY rules unless you switch them on per connection.
  // We switch them on so an expense can never point at a category that does
  // not exist.
  Future<void> _onConfigure(Database db) async {
    await db.execute('PRAGMA foreign_keys = ON');
  }

  // -------------------------------------------------------------------------
  // CREATING THE TABLES
  // -------------------------------------------------------------------------
  Future<void> _createTables(Database db, int version) async {
    // ---- USERS table ----
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
       CREATE TABLE categories (
         id         INTEGER PRIMARY KEY AUTOINCREMENT,
         name       TEXT NOT NULL,
         icon       TEXT,
         color      TEXT
       )
     ''');


    await db.execute('''
       CREATE TABLE incomes (
         id          INTEGER PRIMARY KEY AUTOINCREMENT,
         title       TEXT,
         amount      REAL,
         income_date DATE,
         notes       TEXT
       )
     ''');


    await db.execute('''
       CREATE TABLE expenses (
         id           INTEGER PRIMARY KEY AUTOINCREMENT,
         title        TEXT,
         amount       REAL,
         expense_date DATE,
         category_id  INTEGER,
         notes        TEXT,
         FOREIGN KEY(category_id)
         REFERENCES categories(id)
       )
     ''');

    // An expense cannot be saved without a category, so the app must never
    // start with an empty categories table.
    await _seedDefaultCategories(db);
  }

  // -------------------------------------------------------------------------
  // UPGRADING AN EXISTING FILE
  // -------------------------------------------------------------------------
  // onCreate only runs on a phone that has never installed the app. Everyone
  // who already ran version 1 has the tables but NO categories, so we add
  // them here instead of asking people to delete the database.
  //
  // Rule for the rest of the project: never edit a released CREATE TABLE -
  // raise `version` and add a step here.
  Future<void> _upgradeTables(Database db, int oldVersion, int newVersion) async {
    if (oldVersion < 2) {
      await _seedDefaultCategories(db);
    }
  }

  // Inserts the starter categories, but only if the table is empty, so it can
  // never duplicate them or overwrite categories the user created.
  Future<void> _seedDefaultCategories(DatabaseExecutor db) async {
    final existing = await db.query('categories', limit: 1);
    if (existing.isNotEmpty) return;

    // The icon values are keys from utils/category_style.dart.
    const defaults = [
      {'name': 'Food', 'icon': 'food', 'color': '#E4572E'},
      {'name': 'Transport', 'icon': 'transport', 'color': '#1E5F8C'},
      {'name': 'Bills', 'icon': 'bills', 'color': '#6C5B7B'},
      {'name': 'Entertainment', 'icon': 'entertainment', 'color': '#F2A65A'},
      {'name': 'Health', 'icon': 'health', 'color': '#3BA776'},
      {'name': 'Education', 'icon': 'education', 'color': '#4FA3C4'},
      {'name': 'Other', 'icon': 'other', 'color': '#7A8B99'},
    ];

    // A batch sends all the inserts in one go instead of seven round trips.
    final batch = db.batch();
    for (final category in defaults) {
      batch.insert('categories', category);
    }
    await batch.commit(noResult: true);
  }

  // =========================================================================
  // USERS
  // =========================================================================

  // Adds a new user. Returns the id of the new row.
  //
  // Throws a DatabaseException if the username is already taken, because the
  // users table declares  username TEXT UNIQUE . The register screen checks
  // usernameExists() first for a friendly message, but we keep the database
  // rule as the LAST line of defence (two people could register at the same
  // moment, and only the database can settle that race).
  Future<int> addUser(String username, String password, String fullName) async {
    final db = await database;
    return db.insert(
      'users',
      {'username': username, 'password': password, 'full_name': fullName},
      conflictAlgorithm: ConflictAlgorithm.abort, // duplicate -> throw, never overwrite
    );
  }

  // Checks if username + password exist. Returns a User, or null if wrong.
  Future<User?> login(String username, String password) async {
    final db = await database;

    final rows = await db.query(
      'users',
      // LOWER() on both sides makes the username case-insensitive, so
      // "tammam" and "Tammam" are the same account (passwords stay exact).
      where: 'LOWER(username) = ? AND password = ?',
      whereArgs: [username.toLowerCase(), password],
      limit: 1,
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

  // Returns one user by id, or null if that id is gone.
  Future<User?> getUserById(int id) async {
    final db = await database;
    final rows = await db.query(
      'users',
      where: 'id = ?',
      whereArgs: [id],
      limit: 1,
    );
    if (rows.isEmpty) return null;
    return User.fromMap(rows.first);
  }

  // Checks if a username already exists (register screen + future edits).
  // Comparison is case-insensitive, so "Ali" cannot be registered twice as
  // "ali". excludeId lets a user keep their own name when editing a profile.
  Future<bool> usernameExists(String username, {int? excludeId}) async {
    final db = await database;
    final rows = await db.query(
      'users',
      where: excludeId == null
          ? 'LOWER(username) = ?'
          : 'LOWER(username) = ? AND id != ?',
      whereArgs: excludeId == null
          ? [username.toLowerCase()]
          : [username.toLowerCase(), excludeId],
      limit: 1,
    );
    return rows.isNotEmpty;
  }

  // Is this the password of user #id ? Used by the change-password screen to
  // confirm the CURRENT password before allowing a new one.
  Future<bool> verifyPassword(int id, String password) async {
    final db = await database;
    final rows = await db.query(
      'users',
      where: 'id = ? AND password = ?',
      whereArgs: [id, password],
      limit: 1,
    );
    return rows.isNotEmpty;
  }

  // Returns how many rows changed: 1 = success, 0 = no user with that id.
  Future<int> updatePassword(int id, String newPassword) async {
    final db = await database;
    return db.update(
      'users',
      {'password': newPassword},
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<int> deleteUser(int id) async {
    final db = await database;
    return db.delete('users', where: 'id = ?', whereArgs: [id]);
  }

  // =========================================================================
  // CATEGORIES
  // =========================================================================

  // Every category, A -> Z. Used by the expense form's dropdown.
  Future<List<Category>> getAllCategories() async {
    final db = await database;
    final rows = await db.query('categories', orderBy: 'name COLLATE NOCASE ASC');
    return rows.map((row) => Category.fromMap(row)).toList();
  }

  // One category, or null if it was deleted.
  Future<Category?> getCategoryById(int id) async {
    final db = await database;
    final rows = await db.query(
      'categories',
      where: 'id = ?',
      whereArgs: [id],
      limit: 1,
    );
    if (rows.isEmpty) return null;
    return Category.fromMap(rows.first);
  }

  // Is this category name already used? Case-insensitive, so "Food" and
  // "food" count as the same category. excludeId lets a category keep its own
  // name while being edited.
  Future<bool> categoryNameExists(String name, {int? excludeId}) async {
    final db = await database;
    final rows = await db.query(
      'categories',
      where: excludeId == null
          ? 'LOWER(name) = ?'
          : 'LOWER(name) = ? AND id != ?',
      whereArgs: excludeId == null
          ? [name.toLowerCase()]
          : [name.toLowerCase(), excludeId],
      limit: 1,
    );
    return rows.isNotEmpty;
  }

  // How many expenses use each category, as {categoryId: count}.
  //
  // ONE query with GROUP BY instead of one query per category. With ten
  // categories that is 1 round trip instead of 10 - the same "N+1 queries"
  // trap the expenses JOIN avoids.
  Future<Map<int, int>> getExpenseCountByCategory() async {
    final db = await database;
    final rows = await db.rawQuery('''
      SELECT category_id, COUNT(*) AS total
      FROM expenses
      WHERE category_id IS NOT NULL
      GROUP BY category_id
    ''');

    return {
      for (final row in rows)
        (row['category_id'] as int): (row['total'] as int),
    };
  }

  // CREATE - returns the id of the new row.
  Future<int> addCategory(Category category) async {
    final db = await database;

    final values = category.toMap();
    values.remove('id'); // let SQLite generate the id

    return db.insert('categories', values);
  }

  // UPDATE - returns the number of rows changed (1 = success, 0 = not found).
  Future<int> updateCategory(Category category) async {
    final db = await database;

    final id = category.id;
    if (id == null) {
      throw ArgumentError('Cannot update a category that has no id');
    }

    final values = category.toMap();
    values.remove('id'); // never overwrite the primary key

    return db.update('categories', values, where: 'id = ?', whereArgs: [id]);
  }

  // DELETE.
  //
  // expenses.category_id REFERENCES categories(id), and we switched foreign
  // keys ON, so SQLite REFUSES to delete a category that expenses still point
  // at. That is the database protecting the data - not a bug to work around.
  //
  // detachExpenses: true means the user chose "delete it anyway". We then set
  // those expenses' category_id to NULL first, so no expense is lost and none
  // is left pointing at a row that no longer exists.
  //
  // Both statements run inside a transaction: either BOTH happen or NEITHER
  // does. Without it, a crash between the two would leave the data broken.
  Future<int> deleteCategory(int id, {bool detachExpenses = false}) async {
    final db = await database;

    return db.transaction((txn) async {
      if (detachExpenses) {
        await txn.update(
          'expenses',
          {'category_id': null},
          where: 'category_id = ?',
          whereArgs: [id],
        );
      }
      return txn.delete('categories', where: 'id = ?', whereArgs: [id]);
    });
  }

  // =========================================================================
  // EXPENSES
  // =========================================================================

  // The SELECT used by every "read expenses" function.
  //
  // LEFT JOIN (not a plain JOIN): if the category was deleted, a plain JOIN
  // would make the expense disappear from the list. With LEFT JOIN the
  // expense still comes back, just with null category columns.
  //
  // The "AS category_name" aliases are what Expense.fromMap() reads.
  static const String _expenseSelect = '''
    SELECT
      e.id, e.title, e.amount, e.expense_date, e.category_id, e.notes,
      c.name  AS category_name,
      c.icon  AS category_icon,
      c.color AS category_color
    FROM expenses e
    LEFT JOIN categories c ON c.id = e.category_id
  ''';

  // CREATE - returns the id of the new row.
  Future<int> addExpense(Expense expense) async {
    final db = await database;

    final values = expense.toMap();
    values.remove('id'); // let SQLite generate the id

    return db.insert('expenses', values);
  }

  // READ - newest first. Two sort keys, because several expenses can share a
  // date; the id then keeps the order stable (last added on top).
  Future<List<Expense>> getAllExpenses() async {
    final db = await database;
    final rows = await db.rawQuery(
      '$_expenseSelect ORDER BY e.expense_date DESC, e.id DESC',
    );
    return rows.map((row) => Expense.fromMap(row)).toList();
  }

  // READ one - used by the details screen after an edit, so it always shows
  // fresh data. Returns null if the row was deleted meanwhile.
  Future<Expense?> getExpenseById(int id) async {
    final db = await database;
    final rows = await db.rawQuery('$_expenseSelect WHERE e.id = ?', [id]);
    if (rows.isEmpty) return null;
    return Expense.fromMap(rows.first);
  }

  // UPDATE - returns the number of rows changed (1 = success, 0 = not found).
  Future<int> updateExpense(Expense expense) async {
    final db = await database;

    final id = expense.id;
    if (id == null) {
      // Programming mistake, not a user mistake: an unsaved expense has no
      // row to update. Failing loudly here is better than silently doing
      // nothing and leaving the user thinking their edit was saved.
      throw ArgumentError('Cannot update an expense that has no id');
    }

    final values = expense.toMap();
    values.remove('id'); // never overwrite the primary key

    return db.update('expenses', values, where: 'id = ?', whereArgs: [id]);
  }

  // DELETE - returns the number of rows removed.
  Future<int> deleteExpense(int id) async {
    final db = await database;
    return db.delete('expenses', where: 'id = ?', whereArgs: [id]);
  }

  // =========================================================================
  // SEARCH AND FILTER   (FR16 - FR20)
  // =========================================================================

  // ONE function answers all five requirements, because they are the same
  // question with different pieces filled in:
  //
  //   FR16 search by name      -> text
  //   FR17 search by date      -> range   (a day, a month, anything)
  //   FR18 search by category  -> categoryId
  //   FR19 search by amount    -> minAmount / maxAmount ("more than", "less than")
  //   FR20 combined search     -> pass several at once; they are AND-ed
  //
  // Every parameter is optional (null = "do not filter on this"), so the
  // search screen can send only the fields the user actually filled in.
  // Passing nothing at all returns the whole list, exactly like
  // getAllExpenses().
  //
  // HOW THE QUERY IS BUILT
  // We collect the conditions in a list and join them with AND. The VALUES
  // are never glued into the SQL text - they go into `args` and SQLite puts
  // them in the ? holes itself. That is what makes SQL injection impossible:
  // a user typing  ' OR 1=1 --  into the search box searches for that text,
  // it does not become part of the query.
  Future<List<Expense>> searchExpenses({
    String? text,
    DateRange? range,
    int? categoryId,
    double? minAmount,
    double? maxAmount,
  }) async {
    final db = await database;

    final conditions = <String>[];
    final args = <Object?>[];

    // ---- FR16: by name ----
    // LIKE '%word%' means "contains word". SQLite's LIKE ignores upper/lower
    // case for plain letters, so "taxi" also finds "Taxi".
    final trimmed = text?.trim() ?? '';
    if (trimmed.isNotEmpty) {
      conditions.add('e.title LIKE ?');
      args.add('%$trimmed%');
    }

    // ---- FR17: by date ----
    // Dates are stored as 'yyyy-MM-dd' text, and BETWEEN compares that text.
    // It gives the right answer only because that format sorts correctly -
    // this is exactly why formatters.dart forbids saving any other format.
    if (range != null) {
      conditions.add('e.expense_date BETWEEN ? AND ?');
      args.add(toDbDate(range.start));
      args.add(toDbDate(range.end));
    }

    // ---- FR18: by category ----
    if (categoryId != null) {
      conditions.add('e.category_id = ?');
      args.add(categoryId);
    }

    // ---- FR19: by amount ----
    // Sent separately so the user can ask for only one side ("more than 500")
    // or both ("between 100 and 500").
    if (minAmount != null) {
      conditions.add('e.amount >= ?');
      args.add(minAmount);
    }
    if (maxAmount != null) {
      conditions.add('e.amount <= ?');
      args.add(maxAmount);
    }

    // ---- FR20: everything above is combined with AND ----
    final where = conditions.isEmpty ? '' : 'WHERE ${conditions.join(' AND ')}';

    final rows = await db.rawQuery(
      '$_expenseSelect $where ORDER BY e.expense_date DESC, e.id DESC',
      args,
    );
    return rows.map((row) => Expense.fromMap(row)).toList();
  }

  // =========================================================================
  // INCOMES
  // =========================================================================
  //
  // Simpler than expenses: no category, so no JOIN is needed and the plain
  // query/insert/update/delete helpers of sqflite are enough.

  // CREATE - returns the id of the new row.
  Future<int> addIncome(Income income) async {
    final db = await database;

    final values = income.toMap();
    values.remove('id'); // let SQLite generate the id

    return db.insert('incomes', values);
  }

  // READ - newest first. The id is the second sort key so incomes added on
  // the same day keep a stable order (last added on top).
  Future<List<Income>> getAllIncomes() async {
    final db = await database;
    final rows = await db.query(
      'incomes',
      orderBy: 'income_date DESC, id DESC',
    );
    return rows.map((row) => Income.fromMap(row)).toList();
  }

  // READ one - returns null if the row was deleted meanwhile.
  Future<Income?> getIncomeById(int id) async {
    final db = await database;
    final rows = await db.query(
      'incomes',
      where: 'id = ?',
      whereArgs: [id],
      limit: 1,
    );
    if (rows.isEmpty) return null;
    return Income.fromMap(rows.first);
  }

  // UPDATE - returns the number of rows changed (1 = success, 0 = not found).
  Future<int> updateIncome(Income income) async {
    final db = await database;

    final id = income.id;
    if (id == null) {
      // Programming mistake, not a user mistake: an unsaved income has no row
      // to update. Failing loudly beats silently saving nothing.
      throw ArgumentError('Cannot update an income that has no id');
    }

    final values = income.toMap();
    values.remove('id'); // never overwrite the primary key

    return db.update('incomes', values, where: 'id = ?', whereArgs: [id]);
  }

  // DELETE - returns the number of rows removed.
  Future<int> deleteIncome(int id) async {
    final db = await database;
    return db.delete('incomes', where: 'id = ?', whereArgs: [id]);
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