import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//You can define your own Widget
class MyApp extends StatefulWidget {
  //StatefulWidget has internal "state"
  String name;
  int age;
  MyApp({this.name, this.age});//name, age is state ? No !, it is properties
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}
class _MyAppState extends State<MyApp> with WidgetsBindingObserver{
  //when a widget is created and running, there are 3 functions that we may concern:
  //1. initState
  //2.build() is triggered when we call setState(...)
  //3.dispose() is called when state/widget object is removed
  //Now we try to test these functions/methods

  String _email = '';//This is state!
  final emailEditingController = TextEditingController();
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    print('Run initstate()');
  }
  @override
  void dispose() {
    super.dispose();
    emailEditingController.dispose();
    WidgetsBinding.instance.removeObserver(this);
    print('Run dispose()');
  }
  //when I know "the app is in background/foreground mode" ?
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if(state == AppLifecycleState.paused) {
      print('App is in Background mode');
    } else if(state == AppLifecycleState.resumed) {
      print('App is in Foreground mode');
    }
  }
  @override
  Widget build(BuildContext context) {
    print('Run build()');
    return MaterialApp(
      title: "This is a StatefulWidget",
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: TextField(
                  controller: emailEditingController,
                  onChanged: (text){
                    this.setState((){
                      _email = text;//when state changed => build() rerun => reload widget
                    });
                  },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(10)
                        ),
                      ),
                      labelText:'Enter your email',
                  ),
                ),
              ),
              Text(
                'See result here: ',
                style: TextStyle(fontSize: 30, color: Colors.green),
              ),
              Text(
                _email,
                style: TextStyle(fontSize: 30, color: Colors.blueAccent),
              ),
            ],
          )
        ),
      )
    );
  }
}