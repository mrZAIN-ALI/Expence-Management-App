import 'package:flutter/material.dart';
import 'user_Trnsaction.dart';

class NewTransaction extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  late Function addTx;
  NewTransaction(this.addTx);
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
            ),
            ElevatedButton(
              onPressed: () {
                // print(title);
                // print(amount);
                // print(titleController.text);
                // print(amountController.text);
                addTx(
                    titleController.text, double.parse(amountController.text));
              },
              child: Text("Save Data"),
            )
          ],
        ),
      ),
    );
  }
}
