import 'package:flutter/material.dart';
import 'models/Transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  late List<Transation> transations;
  TransactionList(this.transations);
  
  @override
  Widget build(BuildContext context) {
    return 
    Container(
      height: 300,
        child: transations.isEmpty ? Column(
          children: <Widget>[
            Text("Ops... No Transactions added Yet!!!" ,
            style: Theme.of(context).textTheme.headline6,
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: Image.asset("assests/images/waiting.png",
              fit: BoxFit.cover,
              ),
            ),
          ],
        ) : ListView.builder( 
          itemCount: transations.length,
          itemBuilder: (ctx, index) {                    
            return Card(
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.symmetric(horizontal: 3, vertical: 22),
                    decoration: BoxDecoration(
                      border: Border.all(color:Theme.of(context).primaryColor, width: 3),
                    ),
                    child: Container(
                      width: 80,
                      child: Text(
                        "\$${transations[index].amount.toStringAsFixed(2)}",
                        style: TextStyle(
                            color: Theme.of(context).accentColor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                        // trans.amount.toString(),
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          border: Border.all(color:Theme.of(context).primaryColor),
                        ),
                        child: Text(
                          style: Theme.of(context).textTheme.headline6,
                          transations[index].title.toString(),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          border: Border.all(color: Theme.of(context).primaryColor),
                        ),
                        child: Text(
                          // trans.date.toString(),
                          DateFormat.yMd().add_jm().format(transations[index].date),
                          style: TextStyle(
                              color: Theme.of(context).accentColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          
          },
        ),
      
    );
  }
}
