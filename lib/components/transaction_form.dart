// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter_expenses/components/adaptive_text_field.dart';
import 'package:intl/intl.dart';
import 'adaptive_date_picker.dart';
import 'adaptive_button.dart';

class TransactionForm extends StatefulWidget {
  final void Function(String, double, DateTime) onSubmit;

  TransactionForm(this.onSubmit, {super.key});

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final _titleController = TextEditingController();
  final _valueController = TextEditingController();
  DateTime _selectedDate = DateTime.now();

  _submitForm() {
    final title = _titleController.text;
    final value = double.tryParse(_valueController.text) ?? 0.0;

    if (title.isEmpty || value <= 0 || _selectedDate == null) return;

    widget.onSubmit(title, value, _selectedDate);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Padding(
          padding: EdgeInsets.only(
            bottom: 10 + MediaQuery.of(context).viewInsets.bottom,
            left: 10,
            right: 10,
            top: 10,
          ),
          child: Column(children: [
            AdaptiveTextField(
              label: 'Title',
              controller: _titleController,
              onSubmitted: (_) => _submitForm(),
            ),
            AdaptiveTextField(
              label: 'Value (R\$)',
              controller: _valueController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              onSubmitted: (_) => _submitForm(),
            ),
            AdaptiveDatePicker(
              selectedDate: _selectedDate,
              onDateChanged: (newDate) {
                setState(() {
                  _selectedDate = newDate;
                });
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                AdaptiveButton(
                  'New Transactiona',
                  _submitForm,
                ),
              ],
            )
          ]),
        ),
      ),
    );
  }
}
