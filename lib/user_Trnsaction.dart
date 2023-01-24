import 'package:flutter/material.dart';
import 'new_transactions.dart';
import 'transactionList.dart';
import 'models/Transaction.dart';

class UserTransaction extends StatefulWidget {
  @override
  State<UserTransaction> createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
  final List<Transation> _userTransaction = [
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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        NewTransaction(_addNewTransaction),
        TransactionList(_userTransaction),
      ],
    );
  }
}
