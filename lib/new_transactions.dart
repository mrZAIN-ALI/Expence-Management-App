
import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  late Function addTx;
  NewTransaction(this.addTx);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitData(){
    final enteredTitle=titleController.text;
    double enteredAmount=0.0;
    if (!amountController.text.isEmpty) {
    enteredAmount=double.parse(amountController.text);      
    }

    if (enteredTitle.isEmpty||enteredAmount<=0) {
      return;
    }
    widget.addTx(
      enteredTitle, enteredAmount
    );
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitData(),
            ),
            ElevatedButton(
              onPressed: () {
                // print(title);
                // print(amount);
                // print(titleController.text);
                // print(amountController.text);
               submitData();
              },
              child: Text("Save Data"),
            )
          ],
        ),
      ),
    );
  }
}
