import 'package:flutter/material.dart';
import 'models/Transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  late List<Transation> transations;
  late Function delteTx;
  TransactionList(this.transations,this.delteTx);
  
  @override
  Widget build(BuildContext context) {
    return 
    Container(
      height: 400,
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
              elevation: 5,
              margin: EdgeInsets.symmetric(vertical: 8,horizontal: 5),
              child: ListTile(
                
                leading: CircleAvatar(
                  radius: 30,
                  child: Padding(
                    padding: EdgeInsets.all(6),
                    child: FittedBox(
                      child:Text("\$${transations[index].amount}")
                    ),
                  ),
                ),

                title: Text(transations[index].title,
                  style: Theme.of(context).textTheme.titleMedium,
                ),

                subtitle: Text(DateFormat.yMMMd().format(transations[index].date)),

                trailing: IconButton(onPressed:() => delteTx(transations[index].id,) , icon: Icon(Icons.delete)),
              ),
            );
          
          },
        ),
      
    );
  }
}
