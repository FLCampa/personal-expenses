// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter_expenses/components/transaction_user.dart';

void main() => runApp(const ExpensesApp());

class ExpensesApp extends StatelessWidget {
  const ExpensesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Personal Expenses'),
      ),
      body: SingleChildScrollView(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.spaceAround,
          //crossAxisAlignment: CrossAxisAlignment.stretch, //ocupa todo espaco
          children: [
            Container(
              child: const Card(
                elevation: 5,
                child: Text('Chart'),
              ),
            ),
            TransactionUser(),
          ],
        ),
      ),
    );
  }
}
