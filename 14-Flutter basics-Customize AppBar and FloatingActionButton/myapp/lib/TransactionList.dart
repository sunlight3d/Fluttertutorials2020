import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'transaction.dart';

class TransactionList extends StatelessWidget{
  final List<Transaction> transactions;

  TransactionList({this.transactions});
  ListView _buildListView() {
    return ListView.builder(
        itemCount: transactions.length,
        itemBuilder: (context, index){
          return Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)
            ),
            color: (index) % 2 == 0 ? Colors.green : Colors.teal,
            elevation: 10,
            child: ListTile(
              leading: const Icon(Icons.access_alarm),
              title: Text(transactions[index].content,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.white
                ),
              ),
              subtitle: Text('Price: ${transactions[index].amount}',
                  style: TextStyle(fontSize: 18, color: Colors.white)),
              onTap: (){
                print('You clicked: ${transactions[index].content}');
              },
            ),
          );
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    //Now how to make this "Scrollable", let use ListView:
    //1.ListView(children: <Widget>[]) => this loads all children at the same time
    //2.ListView(itemBuilder: ...) => this loads only visible items
    return Container(
      height: 500,
      child: _buildListView()
    );
  }
}