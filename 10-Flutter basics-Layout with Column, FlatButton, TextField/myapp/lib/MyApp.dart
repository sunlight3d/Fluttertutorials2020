import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
  String _content;
  double _amount;
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
                      _content = text;
                    });
                  },
                ),
                TextField(
                  decoration: InputDecoration(labelText: 'Amount(money)'),
                  controller: _amountController,
                  onChanged: (text){
                    setState(() {
                      _amount = double.tryParse(text) ?? 0;//if error, value = 0
                    });
                  },
                ),
                FlatButton(
                  child: Text('Insert Transaction'),
                  color: Colors.pinkAccent,
                  textColor: Colors.white,
                  onPressed: () {
                    //print('Content = $_content, money\'s amount = $_amount');
                    //Display to UI ?
                    _scaffoldKey.currentState.showSnackBar(
                      SnackBar(
                        content: Text('Content = $_content, money\'s amount = $_amount'),
                        duration: Duration(seconds: 3),
                      )
                    );

                  },
                )
              ],
            ))
        )
    );
  }
}