// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import '../components/chart.dart';
import 'dart:math';

import './components/transaction_form.dart';
import './components/transaction_list.dart';
import '../models/transaction.dart';

void main() => runApp(const ExpensesApp());

class ExpensesApp extends StatelessWidget {
  const ExpensesApp({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData myTheme = ThemeData();

    return MaterialApp(
      home: MyHomePage(),
      theme: myTheme.copyWith(
        colorScheme: myTheme.colorScheme.copyWith(
          primary: Colors.purple,
          secondary: Colors.amber,
        ),
        textTheme: myTheme.textTheme.copyWith(
          titleMedium: TextStyle(
            fontFamily: 'OpenSans',
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        appBarTheme: AppBarTheme(
          titleTextStyle: TextStyle(
            fontFamily: 'OpenSans',
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _transactions = [
    Transaction(
      id: '1',
      title: 'title 1',
      value: 99.00,
      date: DateTime.now(),
    ),
    Transaction(
      id: '2',
      title: 'title 2',
      value: 99.00,
      date: DateTime.now(),
    ),
    Transaction(
      id: '3',
      title: 'title 3',
      value: 99.00,
      date: DateTime.now(),
    ),
    Transaction(
      id: '4',
      title: 'title 4',
      value: 99.00,
      date: DateTime.now(),
    ),
    Transaction(
      id: '5',
      title: 'title 5',
      value: 99.00,
      date: DateTime.now(),
    ),
    Transaction(
      id: '6',
      title: 'title 6',
      value: 99.00,
      date: DateTime.now(),
    ),
    Transaction(
      id: '7',
      title: 'title 7',
      value: 99.00,
      date: DateTime.now(),
    ),
    Transaction(
      id: '8',
      title: 'title 8',
      value: 99.00,
      date: DateTime.now(),
    ),
    Transaction(
      id: '9',
      title: 'title 9',
      value: 99.00,
      date: DateTime.now(),
    ),
    Transaction(
      id: '10',
      title: 'title 10',
      value: 99.00,
      date: DateTime.now(),
    ),
  ];

  List<Transaction> get _recentTransactions {
    return _transactions.where((tr) {
      return tr.date.isAfter(DateTime.now().subtract(
        Duration(days: 7),
      ));
    }).toList();
  }

  _addTransaction(String title, double value, DateTime date) {
    final newTransaction = Transaction(
      id: Random().nextDouble().toString(),
      title: title,
      value: value,
      date: date,
    );

    setState(() {
      _transactions.add(newTransaction);
    });

    //close modal
    Navigator.of(context).pop();
  }

  _removeTransaction(String id) {
    setState(() {
      _transactions.removeWhere((tr) => tr.id == id);
    });
  }

  _openTransactionFormModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return TransactionForm(_addTransaction);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      title: Text(
        'Personal Expenses',
        // style: TextStyle(
        //   fontSize: 20 * MediaQuery.of(context).textScaleFactor,
        // ),
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.add),
          onPressed: () => _openTransactionFormModal(context),
        ),
      ],
    );

    final availableHeight = MediaQuery.of(context).size.height -
        appBar.preferredSize.height -
        MediaQuery.of(context).padding.top;

    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch, //ocupa todo espaco
          children: [
            Container(
              height: availableHeight * 0.3,
              child: Chart(_recentTransactions),
            ),
            Container(
              height: availableHeight * 0.7,
              child: TransactionList(_transactions, _removeTransaction),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _openTransactionFormModal(context),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
