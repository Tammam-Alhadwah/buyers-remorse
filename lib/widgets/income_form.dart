// ===========================================================================
// income_form.dart  -  the input form used by BOTH "Add income" and
// "Edit income".
//
// Same pattern as widgets/expense_form.dart: the fields and the rules live
// here once, and each screen only decides what "Save" does.
//
//   Add screen  -> IncomeForm(onSave: (i) => addIncome(i))
//   Edit screen -> IncomeForm(initial: income, onSave: (i) => updateIncome(i))
//
// It is simpler than the expense form because income has no category, so
// there is nothing to load from the database before the form can be shown.
// ===========================================================================

import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // input formatters

import '../models/income.dart';
import '../utils/constants.dart';
import '../utils/formatters.dart';
import '../utils/validators.dart';

class IncomeForm extends StatefulWidget {
  // null -> creating a new income; not null -> editing this one.
  final Income? initial;

  final Future<void> Function(Income income) onSave;

  final String submitLabel;

  const IncomeForm({
    super.key,
    this.initial,
    required this.onSave,
    this.submitLabel = 'SAVE',
  });

  @override
  State<IncomeForm> createState() => _IncomeFormState();
}

class _IncomeFormState extends State<IncomeForm> {
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController titleController;
  late final TextEditingController amountController;
  late final TextEditingController notesController;

  // The date is picked, not typed, so it is plain state.
  late DateTime selectedDate;

  bool isSaving = false;

  @override
  void initState() {
    super.initState();

    final initial = widget.initial;

    titleController = TextEditingController(text: initial?.title ?? '');
    amountController = TextEditingController(
      // 3000 shows as "3000.00", which is what a money field should look like.
      text: initial == null ? '' : initial.amount.toStringAsFixed(2),
    );
    notesController = TextEditingController(text: initial?.notes ?? '');

    selectedDate = initial?.incomeDate ?? dateOnly(DateTime.now());
  }

  @override
  void dispose() {
    titleController.dispose();
    amountController.dispose();
    notesController.dispose();
    super.dispose();
  }

  void _showMessage(String message, {bool isError = true}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: isError ? kExpenseColor : kIncomeColor,
      ),
    );
  }

  // firstDate/lastDate make an impossible date impossible to tap - the
  // friendliest kind of validation.
  Future<void> pickDate() async {
    final today = dateOnly(DateTime.now());

    final picked = await showDatePicker(
      context: context,
      initialDate: selectedDate.isAfter(today) ? today : selectedDate,
      firstDate: DateTime(2000),
      lastDate: today, // income you have not received yet is not income
    );

    if (picked == null) return; // the user pressed Cancel
    setState(() => selectedDate = dateOnly(picked));
  }

  Future<void> save() async {
    // 1. the typed fields
    if (!_formKey.currentState!.validate()) return;

    // 2. the date, which a Form cannot check by itself
    final dateError = Validators.pastOrToday(selectedDate);
    if (dateError != null) {
      _showMessage(dateError);
      return;
    }

    // 3. build the object, cleaning the text on the way in
    final income = Income(
      id: widget.initial?.id, // null when adding, real id when editing
      title: Validators.sanitize(titleController.text),
      amount: double.parse(amountController.text.trim()),
      incomeDate: selectedDate,
      notes: Validators.sanitize(notesController.text),
    );

    setState(() => isSaving = true);
    try {
      await widget.onSave(income); // the screen decides: insert or update
    } catch (e) {
      if (!mounted) return;
      _showMessage('Could not save. Please try again.');
    } finally {
      // The screen normally closes itself on success, so this mostly matters
      // when something went wrong.
      if (mounted) setState(() => isSaving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: ListView(
        padding: const EdgeInsets.all(kPadding),
        children: [
          // ---- TITLE ----
          TextFormField(
            controller: titleController,
            enabled: !isSaving,
            textCapitalization: TextCapitalization.sentences,
            textInputAction: TextInputAction.next,
            decoration: const InputDecoration(
              labelText: 'Title',
              prefixIcon: Icon(Icons.title),
              hintText: 'Salary, freelance work, gift...',
            ),
            validator: Validators.title,
          ),

          const SizedBox(height: 16),

          // ---- AMOUNT ----
          TextFormField(
            controller: amountController,
            enabled: !isSaving,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            // Blocks letters and the minus sign while typing, so a negative
            // income can never even be entered.
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'[0-9.]')),
            ],
            textInputAction: TextInputAction.next,
            decoration: const InputDecoration(
              labelText: 'Amount',
              prefixIcon: Icon(Icons.payments),
              hintText: '0.00',
            ),
            validator: Validators.amount,
          ),

          const SizedBox(height: 16),

          // ---- DATE ----
          // Read-only tile + calendar: the user cannot type "32/13/2026".
          InkWell(
            onTap: isSaving ? null : pickDate,
            borderRadius: BorderRadius.circular(4),
            child: InputDecorator(
              decoration: const InputDecoration(
                labelText: 'Date',
                prefixIcon: Icon(Icons.calendar_today),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(formatDate(selectedDate)),
                  const Icon(Icons.arrow_drop_down, color: Colors.grey),
                ],
              ),
            ),
          ),

          const SizedBox(height: 16),

          // ---- NOTES (optional) ----
          TextFormField(
            controller: notesController,
            enabled: !isSaving,
            maxLines: 3,
            maxLength: 200,
            textCapitalization: TextCapitalization.sentences,
            decoration: const InputDecoration(
              labelText: 'Notes (optional)',
              alignLabelWithHint: true,
            ),
            validator: Validators.notes,
          ),

          const SizedBox(height: 16),

          ElevatedButton(
            onPressed: isSaving ? null : save,
            style: ElevatedButton.styleFrom(backgroundColor: kIncomeColor),
            child: isSaving
                ? const SizedBox(
                    height: 22,
                    width: 22,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: Colors.white,
                    ),
                  )
                : Text(
                    widget.submitLabel,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
