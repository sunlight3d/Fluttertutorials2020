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
    _transaction.createdDate = DateTime.now();
    _transactions.add(_transaction);
    _transaction = Transaction(content: '', amount: 0.0);
    _contentController.text = '';
    _amountController.text = '';
  }
  void _onButtonShowModalSheet() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Column(
            children: <Widget>[
              Container(padding: EdgeInsets.all(10), child: TextField(
                decoration: InputDecoration(labelText: 'Content'),
                controller: _contentController,
                onChanged: (text) {
                  setState(() {
                    _transaction.content = text;
                  });
                },
              )),
              Container(padding: EdgeInsets.all(10), child:TextField(
            decoration: InputDecoration(labelText: 'Amount(money)'),
            controller: _amountController,
            onChanged: (text){
              setState(() {
                _transaction.amount = double.tryParse(text) ?? 0;//if error, value = 0
              });
            },
          )),
              Container(
                padding: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Expanded(child: SizedBox(child: RaisedButton(
                      color: Colors.teal,
                      child: Text('Save', style: TextStyle(fontSize: 16, color: Colors.white),),
                      onPressed: () {
                        print('press Save');
                        setState(() {
                          this._insertTransaction();
                        });
                      },
                    ),height: 50,)),
                    Padding(padding: EdgeInsets.only(left: 10)),
                    Expanded(child: SizedBox(child: RaisedButton(
                      color: Colors.pinkAccent,
                      child: Text('Cancel', style: TextStyle(fontSize: 16, color: Colors.white),),
                      onPressed: () {
                        print('Press cancel');
                      },
                    ),height: 50,))
                  ],
                ),
              ),
              //ok button

            ],
          );
        }
    );
  }
  @override
  Widget build(BuildContext context) {
    //In this lesson, we need to add AppBar and more "Add" button
    //This must be Scaffold!. not MaterialApp !
    return Scaffold(
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
              //In this lesson, we will replace the input form with "Modal Bottom Sheet"
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
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
                      this._onButtonShowModalSheet();

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
    );
  }
}