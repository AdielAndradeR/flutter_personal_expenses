import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleControler = TextEditingController();
  final _amountControler = TextEditingController();
  DateTime _selectDate;

  void _submitData(){
    if(_amountControler.text.isEmpty){
      return;
    }
    final enteredTitle = _titleControler.text;
    final enteredAmount = double.parse(_amountControler.text) ;

    if(enteredTitle.isEmpty || enteredAmount <= 0 || _selectDate == null){
      return;
    }

    widget.addTx(
      enteredTitle,
      enteredAmount,
      _selectDate
      );

    Navigator.of(context).pop();  
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context, 
      initialDate: DateTime.now(), 
      firstDate: DateTime(2019),
      lastDate: DateTime.now()
      ).then((pickedDate) {
        if(pickedDate == null){
          return;
        }
        setState(() {
            _selectDate = pickedDate;    
        });
      
      });
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
                  controller: _titleControler,
                  onSubmitted: (_) => _submitData(),
                ),
                TextField(
                  decoration: InputDecoration(labelText: 'Amount'),
                  controller: _amountControler,
                  keyboardType: TextInputType.number,
                  onSubmitted: (_) => _submitData(),
                ),
                Container(
                  height: 70,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          _selectDate == null 
                            ? 'No Date Chosen!' 
                            : 'Picked Date: ${DateFormat('dd-MM-yyyy').format(_selectDate)}'),
                      ) ,
                      FlatButton(
                        textColor: Theme.of(context).accentColor,
                        child: Text(
                          'Choose Date',
                          style: TextStyle(
                            fontWeight: FontWeight.bold
                          ),
                          ),
                        onPressed: _presentDatePicker,
                      )
                    ],
                  ),
                ),
                RaisedButton(
                  child: Text('Add Transaction',
                  style: TextStyle(color: Colors.white),),
                  color: Theme.of(context).accentColor,
                  onPressed: () => _submitData(),
                )
              ],
            ),
          )
        );
  }
}