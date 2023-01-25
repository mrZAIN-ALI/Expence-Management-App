import 'dart:ui';

import 'package:flutter/material.dart';
import 'transactionList.dart';
import 'new_transactions.dart';
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
<<<<<<< HEAD
=======
        fontFamily: "OpenSans",
        textTheme: ThemeData.light().textTheme.copyWith(
          headline6: TextStyle(
            fontFamily: "OpenSans",
            fontSize: 15,
            fontWeight: FontWeight.bold,
          )
        ),
        appBarTheme: AppBarTheme(
            titleTextStyle: TextStyle(
              fontFamily: "Quicksand",
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ) 
          
        ),
>>>>>>> bf7c1b2bd60372d7c0d909cf30b1b4f66eebc04a
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
<<<<<<< HEAD
    Transation(
      id: "New",
      title: "Adding First item",
      amount: 36.5,
      date: DateTime.now(),
    ),
    Transation(
      id: "New2",
      title: "Adding secpmd item",
      amount: 55.54,
      date: DateTime.now(),
    )
=======
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
>>>>>>> bf7c1b2bd60372d7c0d909cf30b1b4f66eebc04a
  ];

  void _addNewTransaction(String txTitle, double txAmount) {
    final newTx = Transation(
      id: DateTime.now().toString(),
      title: txTitle,
      amount: txAmount,
      date: DateTime.now(),
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
            onTap: (() {
              
            }),
<<<<<<< HEAD
            behavior: HitTestBehavior.opaque,
=======
            behavior: HitTestBehavior.opaque, 
>>>>>>> bf7c1b2bd60372d7c0d909cf30b1b4f66eebc04a
            child: NewTransaction(_addNewTransaction));
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
            Card(
              elevation: 8,
              child: Container(
                color: Theme.of(context).primaryColor,
                width: double.infinity,
                child: Text("how much spent last week",
                    textAlign: TextAlign.center),
              ),
            ),
            TransactionList(_userTransaction),
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
