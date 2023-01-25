import 'package:flutter/material.dart';
import 'models/Transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  late List<Transation> transations;
  TransactionList(this.transations);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: SingleChildScrollView(
        child: ListView(
          children: transations.map((trans) {
            return Card(
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.symmetric(horizontal: 3, vertical: 22),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.blue, width: 3),
                    ),
                    child: Text(
                      "\$${trans.amount}",
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                      // trans.amount.toString(),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.blue),
                        ),
                        child: Text(
                          style: TextStyle(
                              color: Colors.blue,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                          trans.title.toString(),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.blue),
                        ),
                        child: Text(
                          // trans.date.toString(),
                          DateFormat.yMd().add_jm().format(trans.date),
                          style: TextStyle(
                              color: Color.fromARGB(255, 55, 130, 204)),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
