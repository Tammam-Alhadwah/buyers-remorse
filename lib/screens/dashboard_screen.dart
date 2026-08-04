// ===========================================================================
// dashboard_screen.dart  -  the main screen after logging in.
//
// The specification asks this screen for five things:
//    - the current balance          (FR25)
//    - the total income
//    - the total expenses
//    - the biggest spending category
//    - the last 5 operations
//
// NOT ONE OF THEM IS A DATABASE QUERY HERE.
// ExpenseProvider and IncomeProvider already hold the two lists, and they
// calculate these numbers from what is in memory. This screen listens to both
// providers and draws whatever they currently say. Add an expense anywhere in
// the app and this screen has already updated by the time you come back - not
// because it reloaded, but because the provider told it to redraw.
//
// It is a StatefulWidget for two reasons: it must subscribe to the providers
// once, and the User can be replaced while the screen is open (after a
// password change).
// ===========================================================================

import 'package:flutter/material.dart';

import '../models/user.dart';
import '../models/expense.dart';
import '../models/income.dart';
import '../providers/expense_provider.dart';
import '../providers/income_provider.dart';
import '../utils/constants.dart';
import '../utils/formatters.dart';
import '../utils/category_style.dart';
import '../widgets/app_drawer.dart';
import '../widgets/dashboard_card.dart';
import '../expenses/expenses_list_screen.dart';
import '../expenses/add_expense_screen.dart';
import '../incomes/incomes_screen.dart';
import '../reports/reports_screen.dart';

class DashboardScreen extends StatefulWidget {
  // Receives the user sent from the login screen.
  final User user;

  const DashboardScreen({super.key, required this.user});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final ExpenseProvider expenseProvider = ExpenseProvider();
  final IncomeProvider incomeProvider = IncomeProvider();

  // A copy we are allowed to replace. widget.user itself is final.
  late User currentUser = widget.user;

  @override
  void initState() {
    super.initState();

    // The first screen after login: it fills both providers, so every other
    // screen opens with its data already there. Safe from initState - the
    // providers defer their first notification to a microtask.
    expenseProvider.loadExpenses();
    incomeProvider.loadIncomes();
  }

  Future<void> reloadAll() async {
    // Future.wait runs both loads together instead of one after the other.
    await Future.wait([
      expenseProvider.loadExpenses(),
      incomeProvider.loadIncomes(),
    ]);
  }

  void openScreen(Widget screen) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => screen));
  }

  // The five newest operations of both kinds, mixed and sorted.
  //
  // The two providers hold two different types, so the merged list is typed
  // as Object and every row asks "is this an Expense or an Income?". That is
  // simpler than inventing a third model class for a list of five rows, and
  // Dart checks the types for us.
  List<Object> recentOperations() {
    final items = <Object>[
      // Each list is already newest-first, so five from each side is more
      // than enough to find the five newest overall.
      ...expenseProvider.recent(5),
      ...incomeProvider.recent(5),
    ];

    items.sort((a, b) => dateOf(b).compareTo(dateOf(a))); // newest first
    return items.take(5).toList();
  }

  DateTime dateOf(Object item) {
    return item is Expense ? item.expenseDate : (item as Income).incomeDate;
  }

  // -------------------------------------------------------------------------
  // DRAWING
  // -------------------------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        actions: [
          IconButton(
            icon: const Icon(Icons.bar_chart),
            tooltip: 'Reports',
            onPressed: () => openScreen(ReportsScreen(user: currentUser)),
          ),
          const LogoutAction(),
        ],
      ),

      // The side menu with links to all modules. When the change-password
      // screen returns a new User, we store it and redraw.
      drawer: AppDrawer(
        user: currentUser,
        onUserChanged: (updated) => setState(() => currentUser = updated),
      ),

      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => openScreen(const AddExpenseScreen()),
        backgroundColor: kExpenseColor,
        foregroundColor: Colors.white,
        icon: const Icon(Icons.add),
        label: const Text('Add expense'),
      ),

      // This screen depends on TWO providers. Listenable.merge makes one
      // listenable out of both, so the body is rebuilt when either of them
      // changes.
      body: ListenableBuilder(
        listenable: Listenable.merge([expenseProvider, incomeProvider]),
        builder: (context, _) => buildBody(),
      ),
    );
  }

  Widget buildBody() {
    // Either list still loading -> one spinner for the whole screen. Showing
    // half the numbers while the other half is missing would be worse than
    // showing none.
    if (expenseProvider.isLoading || incomeProvider.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    final error = expenseProvider.errorMessage ?? incomeProvider.errorMessage;
    if (error != null) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(kPadding * 2),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error_outline, size: 64, color: Colors.grey),
              const SizedBox(height: 16),
              Text(
                error,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: 160,
                child: ElevatedButton(
                  onPressed: reloadAll,
                  child: const Text('Try again'),
                ),
              ),
            ],
          ),
        ),
      );
    }

    final totalIncome = incomeProvider.total;
    final totalExpenses = expenseProvider.total;
    final balance = totalIncome - totalExpenses; // FR25

    // RefreshIndicator = pull down to reload. It needs a scrolling child, and
    // ListView gives us that plus scrolling on small screens for free.
    return RefreshIndicator(
      onRefresh: reloadAll,
      child: ListView(
        padding: const EdgeInsets.fromLTRB(kPadding, kPadding, kPadding, 90),
        children: [
          Text(
            'Welcome, ${currentUser.displayName}',
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          const Text(
            'Here is where your money stands.',
            style: TextStyle(color: Colors.grey),
          ),
          const SizedBox(height: kPadding),

          // ---- FR25: the current balance ----
          // The colour carries the meaning: green while there is money left,
          // red once expenses passed income.
          DashboardCard(
            title: 'Current balance',
            value: formatAmount(balance),
            subtitle: balance >= 0
                ? 'Income minus expenses'
                : 'You have spent more than you earned',
            color: balance >= 0 ? kIncomeColor : kExpenseColor,
            icon: Icons.account_balance_wallet,
            large: true,
          ),
          const SizedBox(height: kPadding),

          // ---- Total in / total out, side by side ----
          // Each Expanded takes half of the row, so the two cards stay equal
          // whatever the screen width.
          //
          // WHY IntrinsicHeight IS NOT DECORATION
          // This Row is a direct child of a vertical ListView, so it is laid
          // out with UNBOUNDED height. CrossAxisAlignment.stretch then tries
          // to force both children to maxHeight - which is infinity - and
          // layout throws "BoxConstraints forces an infinite height", leaving
          // the whole body blank with only the AppBar drawn.
          // IntrinsicHeight measures the taller card first and hands the Row
          // a real number, so stretch has something finite to stretch to.
          IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: DashboardCard(
                    title: 'Total income',
                    value: formatAmount(totalIncome),
                    color: kIncomeColor,
                    icon: Icons.south_west,
                    onTap: () => openScreen(IncomesScreen(user: currentUser)),
                  ),
                ),
                const SizedBox(width: kPadding),
                Expanded(
                  child: DashboardCard(
                    title: 'Total expenses',
                    value: formatAmount(totalExpenses),
                    color: kExpenseColor,
                    icon: Icons.north_east,
                    onTap: () =>
                        openScreen(ExpensesListScreen(user: currentUser)),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: kPadding),

          buildTopCategory(totalExpenses),
          const SizedBox(height: kPadding),
          buildRecentSection(),
        ],
      ),
    );
  }

  // "Where most of your money goes": the top category, with a bar showing how
  // big its share of the total is. The grouping is done by the provider.
  Widget buildTopCategory(double totalExpenses) {
    final top = expenseProvider.topCategory();

    if (top == null) {
      return _panel(
        child: const Row(
          children: [
            Icon(Icons.pie_chart_outline, color: Colors.grey),
            SizedBox(width: 12),
            Expanded(
              child: Text(
                'No expenses yet, so there is nothing to rank.',
                style: TextStyle(color: Colors.grey),
              ),
            ),
          ],
        ),
      );
    }

    final color = categoryColor(top.color);
    final share = top.shareOf(totalExpenses);

    return _panel(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Top spending category',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              CircleAvatar(
                backgroundColor: color.withValues(alpha: 0.15),
                child: Icon(categoryIcon(top.icon), color: color),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      top.name,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    // A share of ALL expenses, so it is always 0 - 100%.
                    Text(
                      '${(share * 100).toStringAsFixed(0)}% of everything you spent',
                      style: const TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                  ],
                ),
              ),
              Text(
                formatAmount(top.total),
                style: TextStyle(fontWeight: FontWeight.bold, color: color),
              ),
            ],
          ),
          const SizedBox(height: 12),
          // A one-line bar chart: the filled part is the category's share.
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: LinearProgressIndicator(
              value: share,
              minHeight: 8,
              backgroundColor: Colors.grey.shade200,
              valueColor: AlwaysStoppedAnimation<Color>(color),
            ),
          ),
        ],
      ),
    );
  }

  // The five newest operations, expenses and incomes together.
  Widget buildRecentSection() {
    final recent = recentOperations();

    return _panel(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Expanded(
                child: Text(
                  'Recent activity',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              TextButton(
                onPressed: () =>
                    openScreen(ExpensesListScreen(user: currentUser)),
                child: const Text('See all'),
              ),
            ],
          ),

          if (recent.isEmpty)
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 12),
              child: Text(
                'Add your first expense or income to start tracking.',
                style: TextStyle(color: Colors.grey),
              ),
            )
          else
          // At most five rows, and already inside a ListView, so we build the
          // rows directly instead of nesting a second scrolling list (which
          // would fight the outer one for the user's finger).
            ...recent.map(buildOperationRow),
        ],
      ),
    );
  }

  Widget buildOperationRow(Object item) {
    // Expenses take money out, incomes bring it in. One check decides the
    // colour, the icon, the sign and the subtitle, so they cannot disagree.
    final isExpense = item is Expense;

    final String title;
    final double amount;
    final DateTime date;
    final Color color;
    final IconData icon;
    final String subtitle;

    if (item is Expense) {
      title = item.title;
      amount = item.amount;
      date = item.expenseDate;
      color = categoryColor(item.categoryColor);
      icon = categoryIcon(item.categoryIcon);
      subtitle = '${item.categoryName ?? 'Uncategorized'}  -  ${formatDate(date)}';
    } else {
      final income = item as Income;
      title = income.title;
      amount = income.amount;
      date = income.incomeDate;
      color = kIncomeColor;
      icon = Icons.savings;
      subtitle = 'Income  -  ${formatDate(date)}';
    }

    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: CircleAvatar(
        backgroundColor: color.withValues(alpha: 0.15),
        child: Icon(icon, color: color, size: 20),
      ),
      title: Text(
        // A row with an empty title should still be readable.
        title.trim().isEmpty ? '(no title)' : title,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: Text(subtitle, style: const TextStyle(fontSize: 12)),
      trailing: Text(
        '${isExpense ? '-' : '+'}${formatAmount(amount)}',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: isExpense ? kExpenseColor : kIncomeColor,
        ),
      ),
    );
  }

  // A white rounded box. Used by the two sections above so they share the
  // same padding, radius and border without repeating the decoration.
  Widget _panel({required Widget child}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(kPadding),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(kRadius),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: child,
    );
  }
}