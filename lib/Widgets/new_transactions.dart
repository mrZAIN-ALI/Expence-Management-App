import 'package:intl/intl.dart';
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
  DateTime? _pickedDate = null;

  void _revealDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2021),
      lastDate: DateTime.now(),
    ).then(
      (selectedDateFromFututreWidged) {
        if (selectedDateFromFututreWidged == null) {
          return;
        }

        _pickedDate = selectedDateFromFututreWidged;
      },
    );
  }

  void submitData() {
    final enteredTitle = titleController.text;
    double enteredAmount = 0.0;

    if (!amountController.text.isEmpty ) {
      enteredAmount = double.parse(amountController.text);
    }

    if (enteredTitle.isEmpty || enteredAmount <= 0 || _pickedDate==null) {
      return;
    }
    widget.addTx(enteredTitle, enteredAmount,_pickedDate);
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
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  
                  child: Text( _pickedDate==null ? "NO Date Choesen..!" : "Chosed date:  ${DateFormat.yMd().format(_pickedDate!)}",
                      style: Theme.of(context).textTheme.headline6),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  child: TextButton(
                    child: Text(
                      "Chose Date",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    onPressed: _revealDatePicker,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                // print(title);
                // print(amount);
                // print(titleController.text);
                // print(amountController.text);
                submitData();
              },
              child:
                  Text("Save Data", style: Theme.of(context).textTheme.button),
            )
          ],
        ),
      ),
    );
  }
}
