import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'transaction.dart';

//You can define your own Widget
class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}
//This is a "very basic" statefulwidget
class _MyAppState extends State<MyApp> with WidgetsBindingObserver{
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final _contentController = TextEditingController();
  final _amountController = TextEditingController();

  //define states
  Transaction _transaction = Transaction(content: '', amount: 0.0);
  List<Transaction> _transactions = List<Transaction>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }
  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);

  }
  @override
  Widget build(BuildContext context) {
    List<Widget> _buildWidgetList() {
      int index = 0;
      return _transactions.map((eachTransaction){
        //Now we decorate ListTile using Card
        index++;
        return Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)
          ),
          color: (index - 1) % 2 == 0 ? Colors.green : Colors.teal,
          elevation: 10,
          child: ListTile(
            leading: const Icon(Icons.access_alarm),
            title: Text(eachTransaction.content,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.white
              ),
            ),
            subtitle: Text('Price: ${eachTransaction.amount}',
                style: TextStyle(fontSize: 18, color: Colors.white)),
            onTap: (){
              print('You clicked: ${eachTransaction.content}');
            },
          ),
        );
      }).toList();
    }
    return MaterialApp(
      title: "This is a StatefulWidget",
      home: Scaffold(
        key: _scaffoldKey,
        body: SafeArea(
          minimum: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                TextField(
                  decoration: InputDecoration(labelText: 'Content'),
                  controller: _contentController,
                  onChanged: (text) {
                    setState(() {
                      _transaction.content = text;
                    });
                  },
                ),
                TextField(
                  decoration: InputDecoration(labelText: 'Amount(money)'),
                  controller: _amountController,
                  onChanged: (text){
                    setState(() {
                      _transaction.amount = double.tryParse(text) ?? 0;//if error, value = 0
                    });
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                ),
                ButtonTheme(
                  height: 50,
                  child: FlatButton(
                    child: Text('Insert Transaction', style: const TextStyle(fontSize: 18),),
                    color: Colors.pinkAccent,

                    textColor: Colors.white,
                    onPressed: () {
                      //print('Content = $_content, money\'s amount = $_amount');
                      //Display to UI ?
                      //Now it must add the "transaction object" to a list of transactions(state)
                      setState(() {
                        _transactions.add(_transaction);
                        _transaction = Transaction(content: '', amount: 0.0);
                        _contentController.text = '';
                        _amountController.text = '';
                      });
                      //Now I want to display the list below
                      _scaffoldKey.currentState.showSnackBar(
                          SnackBar(
                            content: Text('transaction list : '+_transactions.toString()),
                            duration: Duration(seconds: 3),
                          )
                      );

                    },
                  ),
                ),
                Column(
                  children: _buildWidgetList(),
                )
              ],
            ),
        )
        )
    );
  }
}