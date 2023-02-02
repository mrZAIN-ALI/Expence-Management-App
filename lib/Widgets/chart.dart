import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:module_four_apk/Widgets/chart_Bar.dart';
import '../models/Transaction.dart';

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
        "day": DateFormat.E().format(weekDay).toString().substring(0, 2),
        "amount": totalSum,
      };
    }).reversed.toList();
  }

  double get totalSpending {
    return generateTotalExpensePerDay.fold(0.0, (sum, item) {
      return sum + (item['amount'] as double);
    });
  }

  @override
  Widget build(BuildContext context) {
    // print(generateTotalExpensePerDay);
    return Card(
      margin: EdgeInsets.all(10),
      elevation: 5,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          children: generateTotalExpensePerDay.map(
            ((data) {
              return Flexible(
                fit: FlexFit.tight,
      
                child: Chart_Bar(
                    (data['day'] as String),
                    (data['amount'] as double),
                    totalSpending == 0.0 ? 0.0 :(data['amount'] as double) / totalSpending),
              );
            }),
          ).toList(),
      
          mainAxisAlignment: MainAxisAlignment.spaceAround,
        ),
      ),
    );
  }
}
