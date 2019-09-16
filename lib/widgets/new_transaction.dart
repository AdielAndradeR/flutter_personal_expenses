import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  final titleControler = TextEditingController();
  final amountControler = TextEditingController();

  void submitData(){
    final enteredTitle = titleControler.text;
    final enteredAmount = double.parse(amountControler.text) ;

    if(enteredTitle.isEmpty || enteredAmount <= 0){
      return;
    }

    addTx(
      enteredTitle,
      enteredAmount
      );
  }

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
                  onSubmitted: (_) => submitData(),
                ),
                TextField(
                  decoration: InputDecoration(labelText: 'Amount'),
                  controller: amountControler,
                  keyboardType: TextInputType.number,
                  onSubmitted: (_) => submitData(),
                ),
                FlatButton(
                  child: Text('Add Transaction'),
                  textColor: Colors.blue,
                  onPressed: () => submitData(),
                )
              ],
            ),
          )
        );
  }
}