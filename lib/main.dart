import 'package:flutter/material.dart';

import './widgets/newTransaction.dart';
import './models/transaction.dart';
import './widgets/transaction_list.dart';
import './widgets/chart.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
      theme: ThemeData(
          primarySwatch: Colors.teal,
          accentColor: Colors.brown,
          textTheme: ThemeData.light().textTheme.copyWith(
              headline4: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.bold)),
          appBarTheme: AppBarTheme(
              textTheme: ThemeData.light().textTheme.copyWith(
                  headline6:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.bold)))),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _userTransactions = [
    // Transaction(
    //   id: 't1',
    //   amount: 200.00,
    //   title: 'New Shirt',
    //   date: DateTime.now(),
    // ),
    // Transaction(
    //   id: 't2',
    //   amount: 800.00,
    //   title: 'New Shoe',
    //   date: DateTime.now(),
    // ),
    // Transaction(
    //   id: 't3',
    //   amount: 800.00,
    //   title: 'New Shoe',
    //   date: DateTime.now(),
    // ),
    // Transaction(
    //   id: 't4',
    //   amount: 800.00,
    //   title: 'New Shoe',
    //   date: DateTime.now(),
    // ),
    // Transaction(
    //   id: 't5',
    //   amount: 800.00,
    //   title: 'New Shoe',
    //   date: DateTime.now(),
    // ),
    // Transaction(
    //   id: 't6',
    //   amount: 800.00,
    //   title: 'New Shoe',
    //   date: DateTime.now(),
    // ),
    // Transaction(
    //   id: 't7',
    //   amount: 800.00,
    //   title: 'New Shoe',
    //   date: DateTime.now(),
    // ),
  ];

  void _addNewTransaction(String titleInput, double amountInput) {
    final newTx = new Transaction(
        id: DateTime.now().toString(),
        title: titleInput,
        date: DateTime.now(),
        amount: amountInput);

    setState(() {
      print('setstate');
      _userTransactions.add(newTx);
    });
  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return GestureDetector(
            onTap: () {},
            child: NewTransaction(_addNewTransaction),
            behavior: HitTestBehavior.opaque,
          );
        });
  }

  List<Transaction> get _recentTransactions {
    return _userTransactions.where((tx) {
      return tx.date.isAfter(DateTime.now().subtract(
        Duration(days: 7),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColorDark,
        title: Text('Expense Planner'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _startAddNewTransaction(context),
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Chart(_recentTransactions),
          //new transaction
          TransactionList(_userTransactions)
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _startAddNewTransaction(context),
      ),
    );
  }
}
