import 'package:flutter/material.dart';
import 'models/Transaction.dart';
import 'package:intl/intl.dart';
import 'user_Trnsaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  List<Transation> transationList = [];

  // late String title;
  // late String amount;

  final titleController = TextEditingController();
  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Flutter App'),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Card(
                elevation: 8,
                child: Container(
                  color: Colors.blue,
                  width: double.infinity,
                  child: Text("how much spent last week",
                      textAlign: TextAlign.center),
                ),
              ),
              UserTransaction(),
            ],
          ),
        ));
  }
}
