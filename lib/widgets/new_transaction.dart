import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {

  final titleControler = TextEditingController();
  final amountControler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
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
        );
  }
}