// ===========================================================================
// categories_screen.dart  -  the category module: add (FR13), edit (FR14)
// and delete (FR15) the categories that expenses are grouped by.
//
// The form itself lives in widgets/category_form_sheet.dart; this screen owns
// the list, the database calls and the rules that need the database:
//   - a category name cannot be used twice
//   - a category still used by expenses cannot just disappear
// ===========================================================================

import 'package:flutter/material.dart';

import '../models/user.dart';
import '../models/category.dart';
import '../database/database_helper.dart';
import '../utils/constants.dart';
import '../utils/category_style.dart';
import '../widgets/app_drawer.dart';
import '../widgets/category_form_sheet.dart';

class CategoriesScreen extends StatefulWidget {
  // Needed only so this screen can show the same side menu as the dashboard.
  final User user;

  const CategoriesScreen({super.key, required this.user});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  List<Category> categories = [];

  // {categoryId: how many expenses use it}. Loaded in ONE query next to the
  // categories, so the list can show "3 expenses" without a query per row.
  Map<int, int> expenseCounts = {};

  bool isLoading = true;
  String? errorMessage;

  @override
  void initState() {
    super.initState();
    loadCategories();
  }

  Future<void> loadCategories() async {
    setState(() {
      isLoading = true;
      errorMessage = null;
    });

    try {
      final db = DatabaseHelper();
      final rows = await db.getAllCategories();
      final counts = await db.getExpenseCountByCategory();
      if (!mounted) return;

      setState(() {
        categories = rows;
        expenseCounts = counts;
        isLoading = false;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        errorMessage = 'Could not load your categories.';
        isLoading = false;
      });
    }
  }

  void _showMessage(String message, {bool isError = true}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: isError ? kExpenseColor : kIncomeColor,
      ),
    );
  }

  // -------------------------------------------------------------------------
  // FR13 / FR14 - add and edit share one form and one save function.
  // `initial` null means "add", otherwise "edit".
  // -------------------------------------------------------------------------
  Future<void> openForm({Category? initial}) async {
    await showCategoryFormSheet(
      context,
      initial: initial,
      onSave: (category) async {
        // The rule that needs the database. excludeId lets a category keep
        // its own name while being edited (without it, saving "Food" as
        // "Food" would report a duplicate of itself).
        final taken = await DatabaseHelper().categoryNameExists(
          category.name,
          excludeId: category.id,
        );
        if (taken) return 'A category with this name already exists';

        if (category.id == null) {
          await DatabaseHelper().addCategory(category);
        } else {
          final changed = await DatabaseHelper().updateCategory(category);
          if (changed == 0) return 'This category no longer exists';
        }

        return null; // null = saved, the sheet closes itself
      },
    );

    if (!mounted) return;
    await loadCategories(); // reload whether it was saved or cancelled
  }

  // -------------------------------------------------------------------------
  // FR15 - delete, with two different questions.
  // -------------------------------------------------------------------------
  Future<void> confirmAndDelete(Category category) async {
    final used = expenseCounts[category.id] ?? 0;

    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Delete category'),
        content: Text(
          used == 0
              // Nothing depends on it: a plain confirmation.
              ? 'Delete "${category.name}"?\nThis cannot be undone.'
              // Something depends on it: say exactly what will happen to it.
              // Deleting the expenses too would destroy the user's records,
              // so we only remove the link - the expenses stay, without a
              // category, and can be edited to a new one later.
              : '"${category.name}" is used by $used '
                  '${used == 1 ? 'expense' : 'expenses'}.\n\n'
                  'Those expenses will be kept but will have no category.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext, false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(dialogContext, true),
            style: TextButton.styleFrom(foregroundColor: kExpenseColor),
            child: Text(used == 0 ? 'Delete' : 'Delete anyway'),
          ),
        ],
      ),
    );

    if (confirmed != true || !mounted) return;

    try {
      await DatabaseHelper().deleteCategory(
        category.id!,
        // Only pass true when it is really needed, so the foreign key still
        // guards every other case.
        detachExpenses: used > 0,
      );
      if (!mounted) return;
      _showMessage('Category deleted', isError: false);
      await loadCategories();
    } catch (e) {
      if (!mounted) return;
      _showMessage('Could not delete the category. Please try again.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Categories')),
      drawer: AppDrawer(user: widget.user),

      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => openForm(),
        icon: const Icon(Icons.add),
        label: const Text('Add'),
      ),

      body: buildBody(),
    );
  }

  Widget buildBody() {
    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (errorMessage != null) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(kPadding * 2),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error_outline, size: 64, color: Colors.grey),
              const SizedBox(height: 16),
              Text(
                errorMessage!,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: 160,
                child: ElevatedButton(
                  onPressed: loadCategories,
                  child: const Text('Try again'),
                ),
              ),
            ],
          ),
        ),
      );
    }

    if (categories.isEmpty) {
      // Expenses cannot be saved without a category, so this screen explains
      // the consequence instead of just saying "empty".
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(kPadding * 2),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.category_outlined, size: 72, color: Colors.grey),
              SizedBox(height: 16),
              Text(
                'No categories',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                'Add at least one category - an expense cannot be saved '
                'without one.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            ],
          ),
        ),
      );
    }

    return RefreshIndicator(
      onRefresh: loadCategories,
      child: ListView.builder(
        padding: const EdgeInsets.fromLTRB(kPadding, kPadding, kPadding, 90),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          final color = categoryColor(category.color);
          final used = expenseCounts[category.id] ?? 0;

          return Card(
            margin: const EdgeInsets.symmetric(vertical: 6),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(kRadius),
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.only(left: kPadding, right: 4),
              leading: CircleAvatar(
                backgroundColor: color.withValues(alpha: 0.15),
                child: Icon(categoryIcon(category.icon), color: color),
              ),
              title: Text(
                category.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                used == 0
                    ? 'Not used yet'
                    : '$used ${used == 1 ? 'expense' : 'expenses'}',
              ),
              trailing: PopupMenuButton<String>(
                tooltip: 'Actions',
                onSelected: (value) {
                  if (value == 'edit') openForm(initial: category);
                  if (value == 'delete') confirmAndDelete(category);
                },
                itemBuilder: (context) => const [
                  PopupMenuItem(
                    value: 'edit',
                    child: ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: Icon(Icons.edit, color: kPrimaryColor),
                      title: Text('Edit'),
                    ),
                  ),
                  PopupMenuItem(
                    value: 'delete',
                    child: ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: Icon(Icons.delete, color: kExpenseColor),
                      title: Text('Delete'),
                    ),
                  ),
                ],
              ),
              // Tapping the row opens the same edit form as the menu.
              onTap: () => openForm(initial: category),
            ),
          );
        },
      ),
    );
  }
}
