// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';

class TransactionForm extends StatelessWidget {
  final titleController = TextEditingController();
  final valueController = TextEditingController();

  TransactionForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(children: [
          TextField(
            controller: titleController,
            decoration: InputDecoration(
              labelText: 'Title',
            ),
          ),
          TextField(
            controller: valueController,
            decoration: InputDecoration(
              labelText: 'Value',
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                child: Text('New Transaction'),
                onPressed: () => {
                  print(titleController.text),
                  print(valueController.text),
                },
              ),
            ],
          )
        ]),
      ),
    );
  }
}
