import 'package:flutter/material.dart';
import 'package:personal_expense_app/widgets/chart.dart';
import 'package:personal_expense_app/widgets/new_transactions.dart';

import 'models/transactions.dart';
import 'widgets/transaction_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PersonalExpenseApp',
      theme: ThemeData(primarySwatch: Colors.yellow, fontFamily: 'Quicksand'),
      home: MyHomePage(title: 'PersonalExpenseApp'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  String? title;
  MyHomePage({super.key, this.title});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Transactions> transactionList = [];

  List<Transactions> get _recentTransactions {
    return transactionList.where((element) {
      return element.date
          .isAfter(DateTime.now().subtract(const Duration(days: 7)));
    }).toList();
  }

  openBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => NewTransactions(onPressed: _addTransactions),
    );
  }

  _addTransactions(String title, double amount) {
    var transaction = Transactions('t1', title, amount, DateTime.now());
    setState(() {
      transactionList.add(transaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Personal Expense App',
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Chart(recentTransactions: _recentTransactions),
            TransactionList(transactionList: transactionList)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          openBottomSheet(context);
        },
        child: const Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
    );
  }
}
