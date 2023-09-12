// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter_expenses/models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final void Function(String) onRemove;

  const TransactionList(this.transactions, this.onRemove, {super.key});

  @override
  Widget build(BuildContext context) {
    bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    return transactions.isEmpty
        ? LayoutBuilder(
            builder: (context, constraints) {
              return Column(
                children: [
                  SizedBox(height: 20),
                  Text(
                    'No Transaction Registered',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  SizedBox(height: 20),
                  Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                    height: constraints.maxHeight * (isLandscape ? 0.55 : 0.25),
                  )
                ],
              );
            },
          )
        : ListView.builder(
            itemCount: transactions.length,
            itemBuilder: (ctx, index) {
              final tr = transactions[index];
              return Card(
                elevation: 2,
                margin: EdgeInsets.symmetric(
                  horizontal: 5,
                  vertical: 4,
                ),
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    child: Padding(
                      padding: EdgeInsets.all(6),
                      child: FittedBox(
                        child: Text('R\$${tr.value}'),
                      ),
                    ),
                  ),
                  title: Text(
                    tr.title,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  subtitle: Text(
                    DateFormat('d MMM y').format(tr.date),
                  ),
                  trailing: MediaQuery.of(context).size.width > 500
                      ? TextButton.icon(
                          onPressed: () => onRemove(tr.id),
                          icon: Icon(Icons.delete),
                          label: Text('Delete'),
                          style: ButtonStyle(
                            foregroundColor: MaterialStateProperty.all<Color>(
                              Theme.of(context).colorScheme.error,
                            ),
                          ),
                        )
                      : IconButton(
                          onPressed: () => onRemove(tr.id),
                          icon: Icon(Icons.delete),
                          color: Theme.of(context).colorScheme.error,
                        ),
                ),
              );
            },
          );
  }
}
