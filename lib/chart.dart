import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'models/Transaction.dart';


class Chart extends StatelessWidget {

  late List<Transation> recentTransactions;  

  Chart(this.recentTransactions);

  List<Map<String,Object>> get generateTotalExpensePerDay{
    return List.generate(7, (index) {
      final weekDay=DateTime.now().subtract(Duration(days: index));

      var totalSum = 0.0;

      for (var i = 0; i < recentTransactions.length; i++) {
        if (recentTransactions[i].date.day == weekDay.day &&
            recentTransactions[i].date.month == weekDay.month &&
            recentTransactions[i].date.year == weekDay.year) {
          
          totalSum+=recentTransactions[i].amount;
        }
      }

      return {"day": DateFormat.E().format(weekDay).toString(),
              "amount":totalSum,
            };
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}