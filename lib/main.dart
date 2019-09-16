import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import './transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expenses',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {

  final List<Transaction> transactions= [
    Transaction(
      id: 't1', 
      title: 'New Shoes', 
      amount: 169.99, 
      date: DateTime.now()),
      Transaction(
      id: 't2', 
      title: 'New Cap', 
      amount: 49.99, 
      date: DateTime.now()),
      Transaction(
      id: 't3', 
      title: 'Subway', 
      amount: 34.50, 
      date: DateTime.now()),
  ];

  final titleControler = TextEditingController();
  final amountControler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Personal Expenses'),
        backgroundColor: Colors.green,
      ),
      body: Column(children: <Widget>[
        Container(
          width: double.infinity,
          child: Card(
            color: Colors.green,
            elevation: 5,
            child:Text('Charts')),
          ),
        Card(
          child: Container(
            padding: EdgeInsets.all(10),
            child : Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                TextField(
                  decoration: InputDecoration(labelText: 'Title'),
                  controller: titleControler,
                ),
                TextField(
                  decoration: InputDecoration(labelText: 'Amount'),
                  controller: amountControler,
                ),
                FlatButton(
                  child: Text('Add Transaction'),
                  textColor: Colors.blue,
                  onPressed: () {
                    
                  },
                )
              ],
            ),
          )
        ),
        Column(
          children: transactions.map((tx) {
            return Card(
              child: Row(children: <Widget>[
                Container(
                  margin: EdgeInsets.symmetric(
                    vertical: 10, 
                    horizontal: 15),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.blue, 
                      width: 2)
                      ),
                    
                  padding: EdgeInsets.all(10),
                  child: Text(
                    'R\$${tx.amount.toStringAsFixed(2)}',
                 
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.blue
                    )
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                  Text(
                    tx.title,
                    style: TextStyle(
                      fontSize: 18, 
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  Text(
                    DateFormat('dd-MM-yyyy').format(tx.date),
                    style: TextStyle(
                      color: Colors.grey
                      )
                    ,)
                  ])

                ]),
            );
          }).toList(),
        )
      ],)
    );
  }
}
