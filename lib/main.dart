import 'package:flutter/material.dart';
import './widgets/transaction_list.dart';
import './widgets/new_transaction.dart';
import './models/transaction.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expenses',
      theme: ThemeData(
        primarySwatch: Colors.amber,
        accentColor: Colors.green,
        fontFamily: 'Comfortaa'
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();

}


class _MyHomePageState extends State<MyHomePage>{

  final List<Transaction> _userTransactions = [
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

  void _addNewTransaction(String txTitle, double txAmount){
    final newTx =Transaction(
      title: txTitle, 
      amount: txAmount, 
      date:  DateTime.now(), 
      id: DateTime.now().toString());

      setState(() {
       _userTransactions.add(newTx); 
      });
  }

  void _startAddNewTransaction(BuildContext ctx){
    showModalBottomSheet(context: ctx, builder: (_) {
      return GestureDetector(
        onTap : () {},
        child: NewTransaction(_addNewTransaction),
        behavior: HitTestBehavior.opaque,
        );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Personal Expenses'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _startAddNewTransaction(context),
            )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(children: <Widget>[
          Container(
            width: double.infinity,
            child: Card(
              color: Colors.green,
              elevation: 5,
              child:Text('Charts')),
            ),
          TransactionList(_userTransactions)      
          ],
        )
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        
        onPressed: () => _startAddNewTransaction(context),
        )
    );
  }
}
