import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'models/Transaction.dart';

class Chart extends StatelessWidget {
  late List<Transation> recentTransactions;

  Chart(this.recentTransactions);

  List<Map<String, Object>> get generateTotalExpensePerDay {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));

      var totalSum = 0.0;

      for (var i = 0; i < recentTransactions.length; i++) {
        if (recentTransactions[i].date.day == weekDay.day &&
            recentTransactions[i].date.month == weekDay.month &&
            recentTransactions[i].date.year == weekDay.year) {
          totalSum += recentTransactions[i].amount;
        }
      }

      // print(DateFormat.E().format(weekDay));
      // print(totalSum);
      return {
        "day": DateFormat.E().format(weekDay).toString().substring(0,2),
        "amount": totalSum,
      };
    });
  }

  double getMaxSpend{
    return generateTotalExpensePerDay.fold(0.0,((sum, item) {
      return 
    });
  }
  @override
  Widget build(BuildContext context) {
    // print(generateTotalExpensePerDay);
    return Card(
      margin: EdgeInsets.all(10),
      elevation: 5,
      child: Row(
        children: generateTotalExpensePerDay.map(
          ((data) {
            return Text("${data['day']} : ${data['amount']}");
          }),
        ).toList(),
      ),
    );
  }
}
