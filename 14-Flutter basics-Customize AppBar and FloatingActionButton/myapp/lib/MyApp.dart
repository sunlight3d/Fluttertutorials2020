import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'transaction.dart';
import 'package:myapp/TransactionList.dart';

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
  void _insertTransaction() {
    //You must validate information first
    if(_transaction.content.isEmpty ||
        _transaction.amount == 0.0 ||
        _transaction.amount.isNaN) {
      return;
    }
    _transactions.add(_transaction);
    _transaction = Transaction(content: '', amount: 0.0);
    _contentController.text = '';
    _amountController.text = '';
  }
  @override
  Widget build(BuildContext context) {
    //In this lesson, we need to add AppBar and more "Add" button

    return MaterialApp(
      title: "This is a StatefulWidget",
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Transaction manager'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.add),
              onPressed: (){
                setState(() {
                  this._insertTransaction();
                });
              },
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          tooltip: 'Add transaction',
          child: Icon(Icons.add),
          onPressed: (){
            setState(() {
              this._insertTransaction();
            });
          },
        ),
        key: _scaffoldKey,
        body: SafeArea(
          minimum: const EdgeInsets.only(left: 20, right: 20),
            child: SingleChildScrollView(
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
                          this._insertTransaction();
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
                  TransactionList(transactions: _transactions)
                ],
              ),
            ),
        )
        )
    );
  }
}