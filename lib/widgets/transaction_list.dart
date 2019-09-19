import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);
  
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 400,
        child : transactions.isEmpty ? 
          Column(
            children: <Widget>[
              Text(
                'No transactions added yet!!!',
                style: TextStyle(fontWeight: FontWeight.bold)
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 200,
                child: Image.asset(
                  'assets/images/waiting.png',
                  fit: BoxFit.cover,
                
                ),
              )

            ],
          )
        : ListView.builder(
          itemBuilder: (ctx, index) {
            return Card(
              margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
              elevation: 5,
              child: ListTile(
                leading: CircleAvatar(
                  radius: 30,
                  child: Padding(
                    padding: EdgeInsets.all(6),
                    child: FittedBox(
                      child: Text('R\$${transactions[index].amount}')
                    ),
                  ),
                ),
                title: Text(
                  transactions[index].title,
                  style: TextStyle(fontWeight: FontWeight.bold)
                  ),
                subtitle: Text(
                  DateFormat('dd-MM-yyyy').format(transactions[index].date),
                ),
              ),
            );
          },
          itemCount: transactions.length,
        )
    );
  }
}

