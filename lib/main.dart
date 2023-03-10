import 'package:flutter/material.dart';
import 'package:module_four_apk/Widgets/chart.dart';
import 'Widgets/transactionList.dart';
import 'Widgets/new_transactions.dart';
import 'models/Transaction.dart';
import 'package:intl/intl.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expenses',
      theme: ThemeData(
        primarySwatch: Colors.red,
        accentColor: Colors.black,
        fontFamily: "OpenSans",
        textTheme: ThemeData.light().textTheme.copyWith(
              headline6: TextStyle(
              fontFamily: "OpenSans",
              fontSize: 15,
              fontWeight: FontWeight.bold,
              ),

              button : TextStyle(
                color: Colors.white,
              )

        ),
        appBarTheme: AppBarTheme(
            titleTextStyle: TextStyle(
          fontFamily: "Quicksand",
          fontWeight: FontWeight.bold,
          fontSize: 30,
        )),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transation> _userTransaction = [
    // Transation(
    //   id: "New",
    //   title: "Adding First item",
    //   amount: 36.5,
    //   date: DateTime.now(),
    // ),
    // Transation(
    //   id: "New2",
    //   title: "Adding secpmd item",
    //   amount: 55.54,
    //   date: DateTime.now(),
    // )
  ];

  List<Transation> get _recentTransactions {
    return _userTransaction.where((tx) {
      return tx.date.isAfter(
        DateTime.now().subtract(
          Duration(days: 7),
        ),
      );
    }).toList();
  }

  void _addNewTransaction(String txTitle, double txAmount,DateTime submittedDate) {
    final newTx = Transation(
      id: DateTime.now().toString(),
      title: txTitle,
      amount: txAmount,
      date: submittedDate,
    );

    setState(() {
      _userTransaction.add(newTx);
    });
  }

  void _showAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return GestureDetector(
              onTap: (() {}),
              behavior: HitTestBehavior.opaque,
              child: NewTransaction(_addNewTransaction));
        });
  }

  void _deleteTransaction(String id){

    setState(() {
      _userTransaction.removeWhere((element) => element.id==id);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App'),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              _showAddNewTransaction(context);
            },
            icon: Icon(Icons.add),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Chart(_recentTransactions),
            TransactionList(_userTransaction,_deleteTransaction),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddNewTransaction(context);
        },
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
