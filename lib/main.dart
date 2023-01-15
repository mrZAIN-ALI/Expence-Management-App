import 'package:flutter/material.dart';
import 'Transaction.dart';
import 'package:intl/intl.dart';

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
  List<Transation> transationList = [
    Transation(
        id: "New",
        title: "Adding First item",
        amount: 36.5,
        date: DateTime.now()),
    Transation(
        id: "New2",
        title: "Adding secpmd item",
        amount: 55.54,
        date: DateTime.now())
  ];

  // late String title;
  // late String amount;

  final titleController=TextEditingController();
  final amountController=TextEditingController();
  
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
              Container(
                padding: EdgeInsets.all(10),
                child: Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      TextField(
                        decoration: InputDecoration(labelText: 'Title'),
                        // onChanged: (value) {
                        //   title=value;
                        // },

                        controller: titleController,
                      ),
                      TextField(
                        decoration: InputDecoration(labelText: 'Amount'),
                        // onChanged: (value) {
                        //   amount=value;
                        // },

                        controller: amountController,
                      ),
                      
                      ElevatedButton(
                        onPressed: () {
                          // print(title);
                          // print(amount);
                          print(titleController.text);
                          print(amountController.text);
                        },
                        child: Text("Save Data"),
                      )
                    ],
                  ),
                ),
              ),
              Column(
                children: transationList.map((trans) {
                  return Card(
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.all(10),
                          padding:
                              EdgeInsets.symmetric(horizontal: 3, vertical: 22),
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
            ],
          ),
        ));
  }
}
