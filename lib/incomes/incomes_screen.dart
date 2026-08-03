// ===========================================================================
// incomes_screen.dart  -  the income module's home: the list of all incomes
// (READ) plus the entry points to add (FR10), edit (FR11) and delete (FR12).
//
// Same three-state structure as the expenses list: spinner while loading, an
// error view with "Try again", a friendly empty view, or the list itself.
//
// Delete lives here rather than on a details screen: the specification asks
// for add / edit / delete only, so income has no details screen.
// ===========================================================================

import 'package:flutter/material.dart';

import '../models/user.dart';
import '../models/income.dart';
import '../database/database_helper.dart';
import '../utils/constants.dart';
import '../utils/formatters.dart';
import '../widgets/app_drawer.dart';
import '../widgets/income_card.dart';
import 'add_income_screen.dart';
import 'edit_income_screen.dart';

class IncomesScreen extends StatefulWidget {
  // Needed only so this screen can show the same side menu as the dashboard.
  final User user;

  const IncomesScreen({super.key, required this.user});

  @override
  State<IncomesScreen> createState() => _IncomesScreenState();
}

class _IncomesScreenState extends State<IncomesScreen> {
  List<Income> incomes = [];
  bool isLoading = true;
  String? errorMessage;

  @override
  void initState() {
    super.initState();
    // initState cannot be async, so we start the work and let the spinner
    // stay on screen until it finishes.
    loadIncomes();
  }

  Future<void> loadIncomes() async {
    setState(() {
      isLoading = true;
      errorMessage = null;
    });

    try {
      final rows = await DatabaseHelper().getAllIncomes();
      if (!mounted) return;
      setState(() {
        incomes = rows;
        isLoading = false;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        errorMessage = 'Could not load your incomes.';
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

  // Opens a screen and reloads afterwards. Reading a local database again is
  // cheap and always correct - much safer than patching the list by hand.
  Future<void> openAndReload(Widget screen) async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => screen),
    );
    if (!mounted) return;
    await loadIncomes();
  }

  // FR12: delete, but never without asking first.
  Future<void> confirmAndDelete(Income income) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Delete income'),
        // Naming the row in the question prevents "wrong row" accidents.
        content: Text(
          'Delete "${income.title}" (${formatAmount(income.amount)})?\n'
          'This cannot be undone.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext, false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(dialogContext, true),
            style: TextButton.styleFrom(foregroundColor: kExpenseColor),
            child: const Text('Delete'),
          ),
        ],
      ),
    );

    // null = the dialog was dismissed by tapping outside it.
    if (confirmed != true || !mounted) return;

    try {
      await DatabaseHelper().deleteIncome(income.id!);
      if (!mounted) return;
      _showMessage('Income deleted', isError: false);
      await loadIncomes();
    } catch (e) {
      if (!mounted) return;
      _showMessage('Could not delete the income. Please try again.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Incomes')),
      drawer: AppDrawer(user: widget.user),

      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => openAndReload(const AddIncomeScreen()),
        backgroundColor: kIncomeColor,
        foregroundColor: Colors.white,
        icon: const Icon(Icons.add),
        label: const Text('Add'),
      ),

      body: buildBody(),
    );
  }

  // Keeping the body in its own method means one look at build() tells you
  // the whole screen; the four states are separated here.
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
                  onPressed: loadIncomes,
                  child: const Text('Try again'),
                ),
              ),
            ],
          ),
        ),
      );
    }

    if (incomes.isEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(kPadding * 2),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.savings, size: 72, color: Colors.grey),
              SizedBox(height: 16),
              Text(
                'No income recorded yet',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                'Tap "Add" to record your salary or any other income.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            ],
          ),
        ),
      );
    }

    // RefreshIndicator = pull the list down to reload it.
    return RefreshIndicator(
      onRefresh: loadIncomes,
      child: ListView.builder(
        // .builder only builds the visible rows, so a long list stays smooth.
        padding: const EdgeInsets.fromLTRB(kPadding, kPadding, kPadding, 90),
        itemCount: incomes.length,
        itemBuilder: (context, index) {
          final income = incomes[index];
          return IncomeCard(
            income: income,
            // Tapping the row and choosing "Edit" do the same thing, so the
            // action is easy to reach either way.
            onTap: () => openAndReload(EditIncomeScreen(income: income)),
            onEdit: () => openAndReload(EditIncomeScreen(income: income)),
            onDelete: () => confirmAndDelete(income),
          );
        },
      ),
    );
  }
}
