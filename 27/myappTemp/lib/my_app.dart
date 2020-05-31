import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
          body: SafeArea(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter name',
                    ),
                  ),
                  SizedBox(height: 20,),
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter email',
                    ),
                  ),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      RaisedButton(
                        padding: const EdgeInsets.all(10.0),
                        textColor: Colors.white,
                        color: Colors.blue,
                        onPressed: () {

                        },
                        child: new Text("Add Person", style: TextStyle(fontSize: 22),),
                      ),
                      SizedBox(width: 20,),
                      RaisedButton(
                        padding: const EdgeInsets.all(10.0),
                        textColor: Colors.white,
                        color: Colors.redAccent,
                        onPressed: () {

                        },
                        child: new Text("Delete", style: TextStyle(fontSize: 22),),
                      ),
                    ],
                  ),
                  Expanded(
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: 2,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text('haha'),
                            subtitle: Text('kekekeek'),
                          );
                        }
                    ),
                  )
                ],
              ),
            ),
          ))
    );
  }
}