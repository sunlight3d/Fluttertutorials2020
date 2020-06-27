import 'package:counterApp/events/counter_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import './blocs/counter_bloc.dart';

class CounterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CounterBloc counterBloc = context.bloc<CounterBloc>();
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<CounterBloc, int>(
          builder: (context, counter){ //"counter" is "new state"
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text("Two actions/events here:", style: TextStyle(fontSize: 25),),
                Container(
                  child: FlatButton(
                    child: Text("Increment(+)",
                      style: TextStyle(fontSize: 16, color: Colors.black),),
                    onPressed: () {
                      //How to send event to Bloc ?
                      counterBloc.add(CounterEvent.increment);
                    },
                  ),
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(color: Colors.greenAccent),
                ),
                Text('Result : $counter', style: TextStyle(fontSize: 40, color: Colors.blue),),
                Container(
                  child: FlatButton(
                    child: Text("Decrement(-)",
                      style: TextStyle(fontSize: 16, color: Colors.black),),
                    onPressed: () {
                      counterBloc.add(CounterEvent.decrement);
                    },
                  ),
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(color: Colors.redAccent),
                ),

              ],
            );
          },)
      ),
    );
  }
}