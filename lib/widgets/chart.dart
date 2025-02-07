import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';
import './chart_bar.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;

  List<Map<String, Object>> get groupedTransactionValues{
        return List.generate(7, (index) {
          final weekDay = DateTime.now().subtract(Duration(days: index),);

          var totalSum = 0.0;
          for(var i =1; i < recentTransactions.length; i++){
            if (recentTransactions[i].date.day == weekDay.day && 
                recentTransactions[i].date.month == weekDay.month && 
                recentTransactions[i].date.year == weekDay.year){
                  totalSum += recentTransactions[i].amount;
            }
          }

          return {
            'day' : DateFormat.E().format(weekDay).substring(0, 1), 
            'amount' : totalSum   
            };
    }).reversed.toList();//;
  }

  double get maxSpending{
    return groupedTransactionValues.fold(0.0, (sum, item) {
      return sum + item['amount'];
    });
  }


  Chart(this.recentTransactions);



  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupedTransactionValues.map((data) {
          return Flexible(
            fit: FlexFit.tight,
            child: ChartBar(
              data['day'], 
              data['amount'], 
              maxSpending == 0.0 ? 0.0 : (data['amount'] as double)/ maxSpending),
          );
         }).toList()
        ),
      ),
    );
  }
}