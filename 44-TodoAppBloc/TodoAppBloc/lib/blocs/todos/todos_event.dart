import 'package:TodoAppBloc/models/models.dart';
import 'package:equatable/equatable.dart';

abstract class TodosEvent extends Equatable {
  const TodosEvent();

  @override
  List<Object> get props => [];
}

class TodosEventQueryAll extends TodosEvent {}

class TodosEventInsert extends TodosEvent {
  final Todo todo;

  const TodosEventInsert(this.todo);

  @override
  List<Object> get props => [todo];

  @override
  String toString() => 'AddTodo { todo: $todo }';
}

class TodosEventUpdate extends TodosEvent {
  final Todo todo;

  const TodosEventUpdate(this.todo);

  @override
  List<Object> get props => [todo];

  @override
  String toString() => 'UpdateTodo { updatedTodo: $todo }';
}

class TodosEventDelete extends TodosEvent {
  final Todo todo;

  const TodosEventDelete(this.todo);

  @override
  List<Object> get props => [todo];

  @override
  String toString() => 'DeleteTodo { todo: $todo }';
}

class TodosEventDeleteAllCompleted extends TodosEvent {}

class TodosEventMakeAllCompleted extends TodosEvent {}

class TodosEventUpdated extends TodosEvent {
  final List<Todo> todos;

  const TodosEventUpdated(this.todos);

  @override
  List<Object> get props => [todos];
}
