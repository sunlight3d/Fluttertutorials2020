import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/authentication/authentication_bloc.dart';
import 'blocs/authentication/authentication_event.dart';
import 'blocs/authentication/authentication_state.dart';
import 'blocs/blocs.dart';
import 'blocs/simple_bloc_observer.dart';
import 'blocs/todos/todos_bloc.dart';
import 'blocs/todos/todos_event.dart';
import 'models/models.dart';
import 'repositories/todos_repository/firebase_todos_repository.dart';
import 'repositories/user_repository/firebase_user_repository.dart';
import 'screens/insert_update_screen.dart';
import 'screens/home_screen.dart';

void main() {
  Bloc.observer = SimpleBlocObserver();
  runApp(TodosApp());
}

class TodosApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthenticationBloc>(
          create: (context) {
            return AuthenticationBloc(
              userRepository: FirebaseUserRepository(),
            )..add(AuthenticationEventStarted());
          },
        ),
        BlocProvider<TabBloc>(
          create: (context) => TabBloc(),
        ),
        BlocProvider<TodosBloc>(
          create: (context) {
            return TodosBloc(
              todosRepository: FirebaseTodosRepository(),
            )..add(TodosEventQueryAll());//Get all Todos
          },
        )
      ],
      child: MaterialApp(
        title: 'Firestore Todos with Firebase/BLoC',
        theme: ThemeData(
          // Define the default brightness and colors.
          brightness: Brightness.light,
          primaryColor: Colors.green,
          fontFamily: 'Georgia',
        ),
        routes: {
          '/': (context) {
            return BlocBuilder<AuthenticationBloc, AuthenticationState>(
              builder: (context, authenticationState) {
                if (authenticationState is AuthenticationStateSuccess) {
                  return MultiBlocProvider(
                    providers: [
                      BlocProvider<FilteredTodosBloc>(
                        create: (context) => FilteredTodosBloc(
                          todosBloc: BlocProvider.of<TodosBloc>(context),
                        ),
                      ),
                      BlocProvider<StatisticsBloc>(
                        create: (context) => StatisticsBloc(
                          todosBloc: BlocProvider.of<TodosBloc>(context),
                        ),
                      ),
                    ],
                    child: HomeScreen(),
                  );
                }
                if (authenticationState is AuthenticationStateFailed) {
                  return Center(
                    child: Text(
                      authenticationState.error.toString(),
                      style: Theme.of(context).textTheme.headline4,),
                  );
                }
                return Center(child: CircularProgressIndicator());
              },
            );
          },
          '/addTodo': (context) {
            return InsertUpdateTodoScreen(
              onSave: (taskName, taskDetail) {
                BlocProvider.of<TodosBloc>(context).add(
                  TodosEventInsert(Todo(taskName: taskName, taskDetail: taskDetail)),
                );
              },
              isEditing: false,
            );
          },
        },
      ),
    );
  }
}
