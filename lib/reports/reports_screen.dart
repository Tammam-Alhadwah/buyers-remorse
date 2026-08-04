// ===========================================================================
// reports_screen.dart  -  the statistics module (FR21 - FR25).
//
//    FR21 daily report    FR22 weekly report    FR23 monthly report
//    FR24 yearly report   FR25 current balance
//
// THE IDEA THAT KEEPS THIS SCREEN SHORT
// Those four reports are not four different screens. They are the SAME
// report over four different date ranges. So the screen holds two pieces of
// state - which period is selected, and which date we are looking at - turns
// them into one DateRange, and asks the providers for the totals of that
// range. Adding a fifth period later would be one more entry in the enum.
//
// AND WHY IT HAS NO LOADING CODE
// The providers already hold every expense and income, and they calculate
// totals, category groups and chart series from that list. Changing the
// period does not touch the database: it only changes which range is passed
// to them. That is the payoff of the provider architecture - the report is
// instant, and it updates itself when an expense is added anywhere else.
// ===========================================================================

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/user.dart';
import '../providers/expense_provider.dart';
import '../providers/income_provider.dart';
import '../utils/constants.dart';
import '../utils/formatters.dart';
import '../utils/date_ranges.dart';
import '../utils/category_style.dart';
import '../widgets/app_drawer.dart';
import '../widgets/dashboard_card.dart';
import '../widgets/charts.dart';

// The four reports the specification asks for.
enum ReportPeriod { day, week, month, year }

class ReportsScreen extends StatefulWidget {
  // Needed only so this screen can show the same side menu as the others.
  final User user;

  const ReportsScreen({super.key, required this.user});

  @override
  State<ReportsScreen> createState() => _ReportsScreenState();
}

class _ReportsScreenState extends State<ReportsScreen> {
  final ExpenseProvider expenseProvider = ExpenseProvider();
  final IncomeProvider incomeProvider = IncomeProvider();

  ReportPeriod period = ReportPeriod.month; // the most useful default
  DateTime anchor = DateTime.now(); // the day the range is built around

  @override
  void initState() {
    super.initState();
    // ensureLoaded, not load: coming from the dashboard the data is already
    // in memory, and reloading it would blink a spinner over a report that
    // could have been drawn immediately. If the providers are still empty -
    // this screen was opened first, or a hot reload skipped the dashboard's
    // initState - it loads them now, so the report is never blank because
    // nobody fetched anything.
    expenseProvider.ensureLoaded();
    incomeProvider.ensureLoaded();
  }

  // The range currently on screen. Written as a getter so it is impossible
  // for the title, the totals and the chart to disagree about it.
  DateRange get range {
    switch (period) {
      case ReportPeriod.day:
        return DateRange.day(anchor);
      case ReportPeriod.week:
        return DateRange.week(anchor);
      case ReportPeriod.month:
        return DateRange.month(anchor);
      case ReportPeriod.year:
        return DateRange.year(anchor);
    }
  }

  // -------------------------------------------------------------------------
  // MOVING THROUGH TIME
  // -------------------------------------------------------------------------
  // direction is -1 for the previous period, +1 for the next one. Each case
  // moves by its own unit, which is why one shared "add N days" would be
  // wrong: months are not all the same length.
  void shift(int direction) {
    setState(() {
      switch (period) {
        case ReportPeriod.day:
          anchor = DateTime(anchor.year, anchor.month, anchor.day + direction);
          break;
        case ReportPeriod.week:
          anchor = DateTime(
            anchor.year,
            anchor.month,
            anchor.day + (7 * direction),
          );
          break;
        case ReportPeriod.month:
        // Day 1 avoids the classic bug: moving from 31 March back one month
        // would ask for 31 February.
          anchor = DateTime(anchor.year, anchor.month + direction, 1);
          break;
        case ReportPeriod.year:
          anchor = DateTime(anchor.year + direction, 1, 1);
          break;
      }
    });
  }

  // There is no data in the future, so the "next" arrow stops at the period
  // that contains today.
  bool get canGoForward => range.end.isBefore(dateOnly(DateTime.now()));

  // Jump straight to any day; the report follows it.
  Future<void> pickDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: anchor,
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
      helpText: 'Show the report around',
    );
    if (picked == null || !mounted) return;
    setState(() => anchor = picked);
  }

  // -------------------------------------------------------------------------
  // THE CHART SERIES
  // -------------------------------------------------------------------------
  // What one bar means depends on the period:
  //   year          -> 12 bars, one per month
  //   month / week  -> one bar per day of the range
  //   day           -> the last 7 days, so a single day is not a lonely bar
  //                    with nothing to compare it to
  List<ChartValue> buildSeries() {
    const monthLetters = [
      'J', 'F', 'M', 'A', 'M', 'J', 'J', 'A', 'S', 'O', 'N', 'D',
    ];

    if (period == ReportPeriod.year) {
      final months = expenseProvider.monthlyTotals(anchor.year);
      final now = DateTime.now();
      return List.generate(12, (index) {
        return ChartValue(
          label: monthLetters[index],
          value: months[index],
          // The month we are inside gets the darker colour, so "now" is easy
          // to find in the chart.
          color: (anchor.year == now.year && index + 1 == now.month)
              ? kPrimaryColor
              : kExpenseColor,
        );
      });
    }

    // For a single day we widen the chart to the 7 days ending on it.
    final chartRange = period == ReportPeriod.day
        ? DateRange(
      DateTime(anchor.year, anchor.month, anchor.day - 6),
      dateOnly(anchor),
    )
        : range;

    // {'2026-08-03': 12500.0, ...}. Days with no expenses are absent from the
    // map and become zero below.
    final totals = expenseProvider.dailyTotals(chartRange);
    final today = dateOnly(DateTime.now());
    final values = <ChartValue>[];

    for (var i = 0; i < chartRange.days; i++) {
      final day = DateTime(
        chartRange.start.year,
        chartRange.start.month,
        chartRange.start.day + i,
      );

      // A week has 7 bars, so a short weekday name fits. A month has up to
      // 31, so only every fifth day is labelled - otherwise the numbers
      // overlap into an unreadable smudge.
      final String label;
      if (chartRange.days <= 7) {
        label = DateFormat('EEE').format(day); // Mon, Tue, ...
      } else if (day.day == 1 || day.day % 5 == 0) {
        label = day.day.toString();
      } else {
        label = '';
      }

      values.add(ChartValue(
        label: label,
        value: totals[toDbDate(day)] ?? 0.0,
        color: day == today ? kPrimaryColor : kExpenseColor,
      ));
    }

    return values;
  }

  // -------------------------------------------------------------------------
  // DRAWING
  // -------------------------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reports'),
        actions: [
          IconButton(
            icon: const Icon(Icons.event),
            tooltip: 'Jump to a date',
            onPressed: pickDate,
          ),
          const LogoutAction(),
        ],
      ),
      drawer: AppDrawer(user: widget.user),
      body: Column(
        children: [
          buildPeriodPicker(),
          buildRangeBar(),
          const Divider(height: 1),
          // Both providers feed this report, so we listen to both.
          Expanded(
            child: ListenableBuilder(
              listenable: Listenable.merge([expenseProvider, incomeProvider]),
              builder: (context, _) => buildBody(),
            ),
          ),
        ],
      ),
    );
  }

  // FR21 - FR24: the four reports, as four buttons.
  Widget buildPeriodPicker() {
    const labels = {
      ReportPeriod.day: 'Day',
      ReportPeriod.week: 'Week',
      ReportPeriod.month: 'Month',
      ReportPeriod.year: 'Year',
    };

    return Padding(
      padding: const EdgeInsets.fromLTRB(kPadding, kPadding, kPadding, 8),
      child: Row(
        children: ReportPeriod.values.map((value) {
          final selected = value == period;
          return Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 3),
              child: ChoiceChip(
                label: SizedBox(
                  width: double.infinity,
                  child: Text(labels[value]!, textAlign: TextAlign.center),
                ),
                selected: selected,
                onSelected: (_) => setState(() => period = value),
                showCheckmark: false,
                selectedColor: kPrimaryColor,
                labelStyle: TextStyle(
                  color: selected ? Colors.white : Colors.black87,
                  fontWeight: selected ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  // "< August 2026 >"
  Widget buildRangeBar() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.chevron_left),
            tooltip: 'Previous',
            onPressed: () => shift(-1),
          ),
          Expanded(
            child: Text(
              range.label,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.chevron_right),
            tooltip: 'Next',
            // A null onPressed is what greys a button out in Flutter.
            onPressed: canGoForward ? () => shift(1) : null,
          ),
        ],
      ),
    );
  }

  Widget buildBody() {
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
                  onPressed: () {
                    expenseProvider.loadExpenses();
                    incomeProvider.loadIncomes();
                  },
                  child: const Text('Try again'),
                ),
              ),
            ],
          ),
        ),
      );
    }

    final current = range;

    // Everything below is read straight from the providers - no query, no
    // await, no local copy that could go stale.
    final income = incomeProvider.totalIn(current); // FR21-24, income side
    final expenses = expenseProvider.totalIn(current); // FR21-24, expense side
    final balance = income - expenses;
    final allTimeBalance = incomeProvider.total - expenseProvider.total; // FR25
    final byCategory = expenseProvider.byCategory(range: current);

    return RefreshIndicator(
      onRefresh: () async {
        await Future.wait([
          expenseProvider.loadExpenses(),
          incomeProvider.loadIncomes(),
        ]);
      },
      child: ListView(
        padding: const EdgeInsets.all(kPadding),
        children: [
          // ---- The two totals of the selected range ----
          //
          // IntrinsicHeight is required, not cosmetic: this Row sits directly
          // in a vertical ListView, so its height is unbounded, and
          // CrossAxisAlignment.stretch would ask both cards to be infinitely
          // tall. That throws during layout and the whole report body is
          // replaced by empty space under the AppBar. IntrinsicHeight measures
          // the taller card first, so stretch gets a finite height to use.
          IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: DashboardCard(
                    title: 'Income',
                    value: formatAmount(income),
                    color: kIncomeColor,
                    icon: Icons.south_west,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: DashboardCard(
                    title: 'Expenses',
                    value: formatAmount(expenses),
                    color: kExpenseColor,
                    icon: Icons.north_east,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),

          DashboardCard(
            title: 'Result for ${current.label}',
            value: formatAmount(balance),
            subtitle: balance >= 0 ? 'You saved money' : 'You overspent',
            color: balance >= 0 ? kIncomeColor : kExpenseColor,
            icon: Icons.calculate,
          ),
          const SizedBox(height: 12),

          // ---- FR25: the balance of the whole account, always visible ----
          // Kept apart from the range totals on purpose: it answers "how much
          // do I have?", not "how did this month go?".
          DashboardCard(
            title: 'Current balance (all time)',
            value: formatAmount(allTimeBalance),
            subtitle: 'Total income minus total expenses',
            color: kPrimaryColor,
            icon: Icons.account_balance_wallet,
          ),
          const SizedBox(height: kPadding),

          // ---- The bar chart ----
          _panel(
            title: chartTitle,
            child: Builder(builder: (context) {
              final series = buildSeries();
              return SimpleBarChart(
                values: series,
                // With few bars there is room to print the number on top.
                showValues: series.length <= 12,
              );
            }),
          ),
          const SizedBox(height: kPadding),

          // ---- The donut: expenses per category ----
          _panel(
            title: 'Spending by category',
            child: buildCategorySection(byCategory, expenses),
          ),
        ],
      ),
    );
  }

  String get chartTitle {
    switch (period) {
      case ReportPeriod.day:
        return 'Expenses over the last 7 days';
      case ReportPeriod.week:
        return 'Expenses per day this week';
      case ReportPeriod.month:
        return 'Expenses per day this month';
      case ReportPeriod.year:
        return 'Expenses per month in ${anchor.year}';
    }
  }

  Widget buildCategorySection(List<CategoryTotal> totals, double grandTotal) {
    if (totals.isEmpty) {
      return const Padding(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Text(
          'No expenses in this period.',
          style: TextStyle(color: Colors.grey),
        ),
      );
    }

    // Turn the provider's rows into what the chart understands. The chart
    // knows nothing about categories - it wants a label, a number, a colour.
    final slices = totals
        .map((item) => ChartValue(
      label: item.name,
      value: item.total,
      color: categoryColor(item.color),
    ))
        .toList();

    return Column(
      children: [
        Center(
          child: DonutChart(
            values: slices,
            centerTitle: 'Total spent',
            centerValue: formatAmount(grandTotal),
          ),
        ),
        const SizedBox(height: kPadding),
        ChartLegend(values: slices, formatValue: formatAmount),
        const SizedBox(height: 8),
        const Divider(),

        // The same numbers as a list, with each category's icon. The chart
        // shows the shape; this shows the detail.
        ...totals.map((item) {
          final color = categoryColor(item.color);
          return ListTile(
            contentPadding: EdgeInsets.zero,
            dense: true,
            leading: CircleAvatar(
              radius: 18,
              backgroundColor: color.withValues(alpha: 0.15),
              child: Icon(categoryIcon(item.icon), color: color, size: 18),
            ),
            title: Text(item.name),
            trailing: Text(
              formatAmount(item.total),
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          );
        }),
      ],
    );
  }

  // A white rounded box with a heading, reused by both chart sections.
  Widget _panel({required String title, required Widget child}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(kPadding),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(kRadius),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: kPadding),
          child,
        ],
      ),
    );
  }
}