import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myappTemp/bloc/persons_bloc.dart';
import 'package:myappTemp/my_app.dart';
void main() {
  runApp(BlocProvider<PersonsBloc>(
    create: (_) => PersonsBloc(),
    child: MyApp(),
  ));
}


