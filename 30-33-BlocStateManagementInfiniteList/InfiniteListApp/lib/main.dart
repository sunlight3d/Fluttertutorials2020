import 'package:InfiniteListApp/blocs/comment_bloc.dart';
import 'package:InfiniteListApp/events/comment_events.dart';
import 'package:InfiniteListApp/infinite_list.dart';
import 'package:InfiniteListApp/states/comment_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: BlocProvider(
        create: (context) => CommentBloc()..add(CommentFetchedEvent()),
        child: InfiniteList(),
      )
    );
  }
}
