import 'package:TodoAppBloc/blocs/blocs.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'insert_update_screen.dart';

class DetailsScreen extends StatelessWidget {
  final String id;

  DetailsScreen({Key key, @required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodosBloc, TodosState>(
      builder: (context, todoSState) {
        if(todoSState is TodosStateLoading) {
          return Scaffold(
            body: CircularProgressIndicator(),
          );
        } else if(todoSState is TodosStateFailed) {
          return Scaffold(
            body: Center(
              child: Text('Failed to load todos: ${todoSState.error.toString()}'),
            ),
          );
        }
        final todo = (todoSState as TodosStateLoaded).todos
            .firstWhere((todo) => todo.id == id, orElse: () => null);
        return Scaffold(
          appBar: AppBar(
            title: Text('Todo Details'),
            actions: [
              IconButton(
                tooltip: 'Delete Todo',
                icon: Icon(Icons.delete),
                onPressed: () {
                  BlocProvider.of<TodosBloc>(context).add(TodosEventDelete(todo));
                  Navigator.pop(context, todo);
                },
              )
            ],
          ),
          body: todo == null
              ? Container()
              : Padding(
                  padding: EdgeInsets.all(16.0),
                  child: ListView(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(right: 5.0),
                            child: Checkbox(
                                value: todo.isCompleted,
                                onChanged: (_) {
                                  BlocProvider.of<TodosBloc>(context).add(
                                    TodosEventUpdate(
                                      todo.copyWith(isCompleted: !todo.isCompleted),
                                    ),
                                  );
                                }),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  padding: EdgeInsets.symmetric(vertical: 10),
                                  child: Text(
                                    todo.taskName,
                                    style:
                                    Theme.of(context).textTheme.headline5,
                                  ),
                                ),
                                Text(
                                  todo.taskDetail,
                                  style: Theme.of(context).textTheme.subtitle1,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
          floatingActionButton: FloatingActionButton(
            tooltip: 'Edit Todo',
            child: Icon(Icons.edit),
            onPressed: todo == null
                ? null
                : () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return InsertUpdateTodoScreen(
                            onSave: (taskName, taskDetail) {
                              BlocProvider.of<TodosBloc>(context).add(
                                TodosEventUpdate(
                                  todo.copyWith(taskName: taskName, taskDetail: taskDetail),
                                ),
                              );
                            },
                            isEditing: true,
                            todo: todo,
                          );
                        },
                      ),
                    );
                  },
          ),
        );
      },
    );
  }
}
