// ===========================================================================
// validators.dart  -  all the input rules of the app, kept in ONE place.
//
// WHY A SEPARATE FILE?
// A Flutter TextFormField asks a question: "is this text acceptable?".
// The answer must be:
//    null            -> the value is GOOD
//    "some message"  -> the value is BAD, show this message under the field
//
// If every screen wrote its own rules, the same rule would be copy-pasted
// (and would slowly drift apart). Here we write each rule once and reuse it:
//
//    TextFormField(validator: Validators.username)
//
// Every function below has the same shape: it takes String? and returns
// String? , because that is exactly the shape Flutter expects.
// ===========================================================================

class Validators {
  // -------------------------------------------------------------------------
  // SANITIZING (cleaning) INPUT
  // -------------------------------------------------------------------------
  // Users type messy text: leading spaces, double spaces, a newline pasted
  // from somewhere. We clean it BEFORE validating and BEFORE saving, so the
  // database never stores "  ali  " next to "ali".
  static String sanitize(String value) {
    return value
        .trim() // remove spaces at the start and the end
        .replaceAll(RegExp(r'\s+'), ' '); // collapse inner spaces into one
  }

  // -------------------------------------------------------------------------
  // USERNAME
  // -------------------------------------------------------------------------
  // Rules:
  //   - not empty
  //   - 3 to 20 characters (short names are easy to guess / clash)
  //   - letters, digits and underscore only  -> no spaces, no symbols
  // NOTE: "is this username already taken?" is NOT checked here, because that
  // question needs the database (an async call) and validators must answer
  // instantly. The register screen asks the database separately.
  static String? username(String? value) {
    final text = (value ?? '').trim();

    if (text.isEmpty) return 'Username is required';
    if (text.length < 3) return 'Username must be at least 3 characters';
    if (text.length > 20) return 'Username must be at most 20 characters';

    // ^ = start, $ = end, so the WHOLE text must match the allowed set.
    if (!RegExp(r'^[a-zA-Z0-9_]+$').hasMatch(text)) {
      return 'Use letters, numbers and _ only (no spaces)';
    }
    return null;
  }

  // -------------------------------------------------------------------------
  // PASSWORD
  // -------------------------------------------------------------------------
  // Rules:
  //   - not empty
  //   - at least 6 characters
  //   - contains at least one letter AND one digit
  // The two demo accounts created in database_helper.dart already follow
  // these rules, so old accounts keep working.
  static String? password(String? value) {
    final text = value ?? '';

    if (text.isEmpty) return 'Password is required';
    if (text.length < 6) return 'Password must be at least 6 characters';
    if (!RegExp(r'[A-Za-z]').hasMatch(text)) {
      return 'Password must contain at least one letter';
    }
    if (!RegExp(r'[0-9]').hasMatch(text)) {
      return 'Password must contain at least one number';
    }
    return null;
  }

  // -------------------------------------------------------------------------
  // PASSWORD USED ONLY TO LOG IN
  // -------------------------------------------------------------------------
  // On the LOGIN screen we must NOT apply the strength rules above: an old
  // account might have a weak password, and telling a stranger "your password
  // needs a digit" leaks information. Empty is the only invalid case here.
  static String? loginPassword(String? value) {
    if (value == null || value.isEmpty) return 'Password is required';
    return null;
  }

  // -------------------------------------------------------------------------
  // CONFIRM PASSWORD
  // -------------------------------------------------------------------------
  // Needs the first password to compare with, so it takes a second argument.
  // In the screen we call it inside a small closure:
  //    validator: (v) => Validators.confirmPassword(v, passwordController.text)
  static String? confirmPassword(String? value, String original) {
    if (value == null || value.isEmpty) return 'Please confirm the password';
    if (value != original) return 'Passwords do not match';
    return null;
  }

  // -------------------------------------------------------------------------
  // FULL NAME
  // -------------------------------------------------------------------------
  // Rules:
  //   - not empty
  //   - at least 3 characters
  //   - no digits (a name is not "Ali 123")
  // We deliberately do NOT restrict the alphabet, because the app must accept
  // Arabic names as well as English ones.
  static String? fullName(String? value) {
    final text = sanitize(value ?? '');

    if (text.isEmpty) return 'Full name is required';
    if (text.length < 3) return 'Full name must be at least 3 characters';
    if (RegExp(r'[0-9]').hasMatch(text)) {
      return 'Full name cannot contain numbers';
    }
    return null;
  }

  // -------------------------------------------------------------------------
  // TITLE  (expenses, incomes)
  // -------------------------------------------------------------------------
  // The specification requires NOT NULL columns to be filled in. A title is
  // what the user recognises the row by, so an empty one is useless.
  static String? title(String? value) {
    final text = sanitize(value ?? '');

    if (text.isEmpty) return 'Title is required';
    if (text.length < 2) return 'Title must be at least 2 characters';
    if (text.length > 60) return 'Title must be at most 60 characters';
    return null;
  }

  // -------------------------------------------------------------------------
  // AMOUNT  (money)
  // -------------------------------------------------------------------------
  // Rules from the specification: required, a real number, and POSITIVE
  // ("the value must be positive"). Zero is refused too - saving an expense
  // of 0 is always a mistake.
  static String? amount(String? value) {
    final text = (value ?? '').trim();

    if (text.isEmpty) return 'Amount is required';

    // tryParse returns null instead of throwing when the text is not a
    // number, which is exactly what a validator wants.
    final parsed = double.tryParse(text);
    if (parsed == null) return 'Enter a valid number';

    if (parsed <= 0) return 'The value must be positive';
    if (parsed > 1000000000) return 'This amount is too large';

    // 12.345 would be silently rounded when displayed, so refuse it here.
    final dot = text.indexOf('.');
    if (dot != -1 && text.length - dot - 1 > 2) {
      return 'Use at most 2 decimals';
    }
    return null;
  }

  // -------------------------------------------------------------------------
  // NOTES  (optional field)
  // -------------------------------------------------------------------------
  // Empty is valid here - that is the whole point of an optional field. We
  // only guard the length so one row cannot hold a whole essay.
  static String? notes(String? value) {
    final text = sanitize(value ?? '');
    if (text.length > 200) return 'Notes must be at most 200 characters';
    return null;
  }

  // -------------------------------------------------------------------------
  // DATE
  // -------------------------------------------------------------------------
  // The date picker already blocks impossible dates, but a validator is the
  // safety net if a screen ever sets the date in code.
  // A daily expense/income is something that HAPPENED, so the future is out.
  static String? pastOrToday(DateTime? value) {
    if (value == null) return 'Date is required';

    final today = DateTime.now();
    final endOfToday = DateTime(today.year, today.month, today.day, 23, 59, 59);

    if (value.isAfter(endOfToday)) return 'The date cannot be in the future';
    if (value.year < 2000) return 'The date is too far in the past';
    return null;
  }
  // -------------------------------------------------------------------------
  // CATEGORY NAME
  // -------------------------------------------------------------------------
  // The categories table declares  name TEXT NOT NULL , so empty is refused
  // here too. "Already exists" is NOT checked here: that question needs the
  // database, and a validator must answer instantly - the categories screen
  // asks separately.
  static String? categoryName(String? value) {
    final text = sanitize(value ?? '');

    if (text.isEmpty) return 'Name is required';
    if (text.length < 2) return 'Name must be at least 2 characters';
    if (text.length > 30) return 'Name must be at most 30 characters';

    // At least one letter or digit, so " -- " cannot become a category.
    if (!RegExp(r'[A-Za-z0-9\u0600-\u06FF]').hasMatch(text)) {
      return 'Name must contain letters or numbers';
    }
    return null;
  }
}
