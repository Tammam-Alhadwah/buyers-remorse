// ===========================================================================
// category_form_sheet.dart  -  the "Add category" / "Edit category" form.
//
// A category has only three values (name, icon, colour), so a whole screen
// would be heavy. It is shown as a modal bottom sheet instead: it slides up
// over the list, and the list stays visible behind it.
//
// Like the expense and income forms, ONE form serves both add and edit; the
// screen decides what saving means by passing onSave.
//
// onSave returns String? :
//    null      -> saved, close the sheet
//    a message -> refused (for example "This category already exists"), show
//                 the message inside the sheet and keep it open
// Returning the error instead of throwing keeps the "already exists" rule in
// the screen (where the database lives) while the message appears right under
// the field the user must fix.
// ===========================================================================

import 'package:flutter/material.dart';

import '../models/category.dart';
import '../utils/constants.dart';
import '../utils/validators.dart';
import '../utils/category_style.dart';

// The public entry point. The screen just calls:
//     await showCategoryFormSheet(context, onSave: ...);
Future<void> showCategoryFormSheet(
  BuildContext context, {
  Category? initial,
  required Future<String?> Function(Category category) onSave,
}) {
  return showModalBottomSheet<void>(
    context: context,
    // isScrollControlled lets the sheet grow taller than half the screen,
    // which it needs when the keyboard is open.
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(kRadius)),
    ),
    builder: (_) => _CategoryFormSheet(initial: initial, onSave: onSave),
  );
}

class _CategoryFormSheet extends StatefulWidget {
  final Category? initial;
  final Future<String?> Function(Category category) onSave;

  const _CategoryFormSheet({this.initial, required this.onSave});

  @override
  State<_CategoryFormSheet> createState() => _CategoryFormSheetState();
}

class _CategoryFormSheetState extends State<_CategoryFormSheet> {
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController nameController;
  late String selectedIcon;
  late String selectedColor;

  bool isSaving = false;
  String? errorMessage; // the message onSave sent back, if any

  @override
  void initState() {
    super.initState();
    final initial = widget.initial;

    nameController = TextEditingController(text: initial?.name ?? '');
    selectedIcon = initial?.icon ?? kCategoryIconKeys.first;
    selectedColor = initial?.color ?? kCategoryColorOptions.first;
  }

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  Future<void> save() async {
    if (!_formKey.currentState!.validate()) return;

    final category = Category(
      id: widget.initial?.id, // null when adding, real id when editing
      name: Validators.sanitize(nameController.text),
      icon: selectedIcon,
      color: selectedColor,
    );

    setState(() {
      isSaving = true;
      errorMessage = null;
    });

    try {
      final problem = await widget.onSave(category);
      if (!mounted) return;

      if (problem != null) {
        // Refused: keep the sheet open and explain why.
        setState(() {
          errorMessage = problem;
          isSaving = false;
        });
        return;
      }

      Navigator.pop(context); // saved
    } catch (e) {
      if (!mounted) return;
      setState(() {
        errorMessage = 'Could not save. Please try again.';
        isSaving = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final isEditing = widget.initial != null;
    final previewColor = categoryColor(selectedColor);

    return Padding(
      // viewInsets.bottom is the height of the keyboard. Adding it as padding
      // lifts the sheet so the Save button is never hidden behind the keys.
      padding: EdgeInsets.only(
        left: kPadding,
        right: kPadding,
        top: kPadding,
        bottom: MediaQuery.of(context).viewInsets.bottom + kPadding,
      ),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min, // only as tall as its content
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ---- TITLE + LIVE PREVIEW ----
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: previewColor.withValues(alpha: 0.15),
                  child: Icon(categoryIcon(selectedIcon), color: previewColor),
                ),
                const SizedBox(width: 12),
                Text(
                  isEditing ? 'Edit category' : 'New category',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // ---- NAME (FR14 edits exactly this) ----
            TextFormField(
              controller: nameController,
              enabled: !isSaving,
              autofocus: true,
              textCapitalization: TextCapitalization.words,
              decoration: const InputDecoration(
                labelText: 'Name',
                prefixIcon: Icon(Icons.label),
                hintText: 'Food, Transport, Bills...',
              ),
              validator: Validators.categoryName,
              // Typing again clears an old "already exists" message, so a
              // stale error never sits under a field the user just fixed.
              onChanged: (_) {
                if (errorMessage != null) setState(() => errorMessage = null);
              },
            ),

            if (errorMessage != null) ...[
              const SizedBox(height: 10),
              Row(
                children: [
                  const Icon(Icons.error_outline,
                      color: kExpenseColor, size: 20),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      errorMessage!,
                      style: const TextStyle(color: kExpenseColor),
                    ),
                  ),
                ],
              ),
            ],

            const SizedBox(height: 20),

            const Text('Icon', style: TextStyle(color: Colors.grey)),
            const SizedBox(height: 8),

            // ---- ICON CHOICES ----
            // Wrap lays the choices out in rows and moves to the next line
            // automatically, whatever the screen width is.
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: kCategoryIconKeys.map((key) {
                final isSelected = key == selectedIcon;
                return InkWell(
                  onTap: isSaving
                      ? null
                      : () => setState(() => selectedIcon = key),
                  borderRadius: BorderRadius.circular(30),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: isSelected
                          ? previewColor.withValues(alpha: 0.15)
                          : Colors.grey.withValues(alpha: 0.12),
                      border: Border.all(
                        color: isSelected ? previewColor : Colors.transparent,
                        width: 2,
                      ),
                    ),
                    child: Icon(
                      categoryIcon(key),
                      color: isSelected ? previewColor : Colors.grey,
                    ),
                  ),
                );
              }).toList(),
            ),

            const SizedBox(height: 20),

            const Text('Colour', style: TextStyle(color: Colors.grey)),
            const SizedBox(height: 8),

            // ---- COLOUR CHOICES ----
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: kCategoryColorOptions.map((hex) {
                final isSelected = hex == selectedColor;
                final color = categoryColor(hex);
                return InkWell(
                  onTap: isSaving
                      ? null
                      : () => setState(() => selectedColor = hex),
                  borderRadius: BorderRadius.circular(30),
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: color,
                      border: Border.all(
                        color: isSelected ? Colors.black87 : Colors.transparent,
                        width: 2,
                      ),
                    ),
                    // A tick is clearer than a border alone on dark colours.
                    child: isSelected
                        ? const Icon(Icons.check, color: Colors.white, size: 20)
                        : null,
                  ),
                );
              }).toList(),
            ),

            const SizedBox(height: 24),

            ElevatedButton(
              onPressed: isSaving ? null : save,
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
                      isEditing ? 'SAVE CHANGES' : 'ADD CATEGORY',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
            ),

            const SizedBox(height: 8),

            TextButton(
              onPressed: isSaving ? null : () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
          ],
        ),
      ),
    );
  }
}
