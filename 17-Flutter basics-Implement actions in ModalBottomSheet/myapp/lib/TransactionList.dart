import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';
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
              //this lesson will customize this ListItem, using Column and Row
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(padding: EdgeInsets.all(10),),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(padding: EdgeInsets.only(top:10)),
                      Text(transactions[index].content,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.white
                        ),
                      ),
                      Text('Date: ${DateFormat.yMd().format(transactions[index].createdDate)}',
                          style: TextStyle(fontSize: 18, color: Colors.white)),
                      Padding(padding: EdgeInsets.only(bottom:10)),
                    ],
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Container(
                          padding: const EdgeInsets.all(10.0),
                          child: Text('${transactions[index].amount}\$',
                              style: TextStyle(fontSize: 18, color: Colors.white)),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white, width: 2, style: BorderStyle.solid),
                            borderRadius:BorderRadius.all(Radius.circular(10))
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(right: 10),)
                      ],
                    )
                  )

                ],
              )

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