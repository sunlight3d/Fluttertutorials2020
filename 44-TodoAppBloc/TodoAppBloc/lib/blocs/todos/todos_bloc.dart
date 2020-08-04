import 'dart:async';
import 'package:TodoAppBloc/blocs/blocs.dart';
import 'package:TodoAppBloc/models/todo.dart';
import 'package:TodoAppBloc/repositories/todos_repository/todos_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

class TodosBloc extends Bloc<TodosEvent, TodosState> {
  final TodosRepository _todosRepository;
  StreamSubscription _todosSubscription;

  TodosBloc({@required TodosRepository todosRepository})
      : assert(todosRepository != null),
        _todosRepository = todosRepository,
        super(TodosStateLoading());

  @override
  Stream<TodosState> mapEventToState(TodosEvent todosEvent) async* {
    final todosState = state;
    if (todosEvent is TodosEventQueryAll) {
      _todosSubscription?.cancel();
      _todosSubscription = _todosRepository.todos().listen(
            (todos) => add(TodosEventUpdated(todos)),
      );
    } else if (todosEvent is TodosEventInsert) {
      _todosRepository.addNewTodo(todosEvent.todo);
    } else if (todosEvent is TodosEventUpdate) {
      _todosRepository.updateTodo(todosEvent.todo);
    } else if (todosEvent is TodosEventDelete) {
      _todosRepository.deleteTodo(todosEvent.todo);
    } else if (todosEvent is TodosEventMakeAllCompleted) {
      if (todosState is TodosStateLoaded) {
        final List<Todo> updatedTodos = todosState.todos
            .map((todo) => todo.copyWith(isCompleted: false))
            .toList();
        updatedTodos.forEach((updatedTodo) {
          _todosRepository.updateTodo(updatedTodo.copyWith(isCompleted: true));
        });
      }
    } else if (todosEvent is TodosEventDeleteAllCompleted) {
      if (todosState is TodosStateLoaded) {
        final List<Todo> completedTodos =
        todosState.todos.where((todo) => todo.isCompleted).toList();
        completedTodos.forEach((completedTodo) {
          _todosRepository.deleteTodo(completedTodo);
        });
      }
    } else if (todosEvent is TodosEventUpdated) {
      yield TodosStateLoaded(todosEvent.todos);
    }
  }

  @override
  Future<void> close() {
    _todosSubscription?.cancel();
    return super.close();
  }
}
