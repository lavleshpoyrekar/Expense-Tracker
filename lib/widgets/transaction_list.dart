import 'package:flutter/material.dart';
import '../model/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: transactions.isEmpty ?
      Column(
        children:<Widget> [
          Text('No transactions added yet!',
          style: Theme.of(context).textTheme.headline6,),
          
          Image.asset('assets/images/wait1.png'),
        ],
      )
      : ListView.builder(
        itemBuilder: (ctx, index) {
          return Card(
            color: Color.fromARGB(255, 132, 192, 242),
            child: Row(
              children: <Widget>[
                Container(
                  
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  decoration: BoxDecoration(
                      border: Border.all(
                    color: Color.fromARGB(255, 40, 88, 231),
                    width: 2,
                  )),
                  padding: EdgeInsets.all(10),
                  child: Text(
                    '\u{20B9}${transactions[index].amount.toStringAsFixed(2)}',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Color.fromARGB(255, 30, 15, 168)),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      transactions[index].title,
                      style:Theme.of(context).textTheme.headline6,
                        
                    ),
                    Text(
                      DateFormat.yMMMd().format(transactions[index].date),
                      style: TextStyle(color: Color.fromARGB(255, 33, 6, 116)),
                    )
                  ],
                )
              ],
            ),
          );
        },
        itemCount: transactions.length,
        
      ),
    );
  }
}
