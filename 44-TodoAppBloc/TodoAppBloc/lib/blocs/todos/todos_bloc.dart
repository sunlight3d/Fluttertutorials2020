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
        super(TodosLoading());

  @override
  Stream<TodosState> mapEventToState(TodosEvent event) async* {
    if (event is TodosEventQueryAll) {
      yield* _mapLoadTodosToState();
    } else if (event is TodosEventInsert) {
      yield* _mapAddTodoToState(event);
    } else if (event is TodosEventUpdate) {
      yield* _mapUpdateTodoToState(event);
    } else if (event is TodosEventDelete) {
      yield* _mapDeleteTodoToState(event);
    } else if (event is TodosEventToggleAll) {
      yield* _mapToggleAllToState();
    } else if (event is TodosEventDeleteAllCompleted) {
      yield* _mapClearCompletedToState();
    } else if (event is TodosEventUpdated) {
      yield* _mapTodosUpdateToState(event);
    }
  }

  Stream<TodosState> _mapLoadTodosToState() async* {
    _todosSubscription?.cancel();
    _todosSubscription = _todosRepository.todos().listen(
          (todos) => add(TodosEventUpdated(todos)),
        );
  }

  Stream<TodosState> _mapAddTodoToState(TodosEventInsert event) async* {
    _todosRepository.addNewTodo(event.todo);
  }

  Stream<TodosState> _mapUpdateTodoToState(TodosEventUpdate event) async* {
    _todosRepository.updateTodo(event.updatedTodo);
  }

  Stream<TodosState> _mapDeleteTodoToState(TodosEventDelete event) async* {
    _todosRepository.deleteTodo(event.todo);
  }

  Stream<TodosState> _mapToggleAllToState() async* {
    final currentState = state;
    if (currentState is TodosLoaded) {
      final allCompleted = currentState.todos.every((todo) => todo.isCompleted);
      final List<Todo> updatedTodos = currentState.todos
          .map((todo) => todo.copyWith(isCompleted: !allCompleted))
          .toList();
      updatedTodos.forEach((updatedTodo) {
        _todosRepository.updateTodo(updatedTodo);
      });
    }
  }

  Stream<TodosState> _mapClearCompletedToState() async* {
    final currentState = state;
    if (currentState is TodosLoaded) {
      final List<Todo> completedTodos =
          currentState.todos.where((todo) => todo.isCompleted).toList();
      completedTodos.forEach((completedTodo) {
        _todosRepository.deleteTodo(completedTodo);
      });
    }
  }

  Stream<TodosState> _mapTodosUpdateToState(TodosEventUpdated event) async* {
    yield TodosLoaded(event.todos);
  }

  @override
  Future<void> close() {
    _todosSubscription?.cancel();
    return super.close();
  }
}
