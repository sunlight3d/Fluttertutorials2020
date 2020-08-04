import 'package:TodoAppBloc/blocs/blocs.dart';
import 'package:TodoAppBloc/screens/screens.dart';
import 'package:TodoAppBloc/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FilteredTodos extends StatelessWidget {
  FilteredTodos({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FilteredTodosBloc, FilteredTodosState>(
      builder: (context, state) {
        if (state is FilteredTodosLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is FilteredTodosLoaded) {
          final todos = state.filteredTodos;
          return ListView.builder(
            itemCount: todos.length,
            itemBuilder: (context, index) {
              final todo = todos[index];
              return TodoItem(
                todo: todo,
                onDismissed: (direction) {
                  BlocProvider.of<TodosBloc>(context).add(TodosEventDelete(todo));
                  Scaffold.of(context).showSnackBar(DeleteTodoSnackBar(
                    todo: todo,
                    onUndo: () =>
                        BlocProvider.of<TodosBloc>(context).add(TodosEventInsert(todo)),
                  ));
                },
                onTap: () async {
                  final removedTodo = await Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) {
                      return DetailsScreen(id: todo.id);
                    }),
                  );
                  if (removedTodo != null) {
                    Scaffold.of(context).showSnackBar(
                      DeleteTodoSnackBar(
                        todo: todo,
                        onUndo: () => BlocProvider.of<TodosBloc>(context)
                            .add(TodosEventInsert(todo)),
                      ),
                    );
                  }
                },
                onCheckboxChanged: (_) {
                  BlocProvider.of<TodosBloc>(context).add(
                    TodosEventUpdate(todo.copyWith(isCompleted: !todo.isCompleted)),
                  );
                },
              );
            },
          );
        } else {
          return Container();
        }
      },
    );
  }
}
