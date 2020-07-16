import 'package:counterApp/blocs/counter_bloc.dart';
import 'package:counterApp/counter_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  //Now we need to install bloc
  //We have 2 Events => Increase / Descrease
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Increment / Decrement Counter App using Bloc',
      home: BlocProvider<CounterBloc>(
        create: (context) => CounterBloc(),
        child: CounterPage(),
      )
    );
  }
}

