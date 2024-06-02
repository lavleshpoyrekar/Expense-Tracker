import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
final Function addTx;

NewTransaction(this.addTx);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
final titlecontroller = TextEditingController();

final amountcontroller = TextEditingController();

 void submitData(){
  final enteredTitle = titlecontroller.text;
  final enteredAmount = double.parse(amountcontroller.text);
  if(enteredAmount<=0 || enteredTitle.isEmpty){
    return;
  }
  widget.addTx(enteredTitle,enteredAmount);
  Navigator.of(context).pop();}

  @override
  Widget build(BuildContext context) {
    return Card(
              elevation: 5,
              child: Container(
                  
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      TextField(
                        decoration: InputDecoration(labelText: 'Title'),
                        controller: titlecontroller,
                       
                        onSubmitted: (_)=> submitData,

                      ),
                      TextField(
                          decoration: InputDecoration(labelText: 'amount'),
                          controller: amountcontroller,
                          keyboardType: TextInputType.number,
                          onSubmitted: (_)=> submitData,
                          ),
                      TextButton(
                        onPressed: submitData,
                        child: Text('Add Transaction'),
                        style: ButtonStyle(
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.blue),
                        ),
                      )
                    ],
                  )),
            );
  }
}