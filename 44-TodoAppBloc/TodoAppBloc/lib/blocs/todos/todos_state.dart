import 'package:TodoAppBloc/models/models.dart';
import 'package:equatable/equatable.dart';

abstract class TodosState extends Equatable {
  const TodosState();

  @override
  List<Object> get props => [];
}

class TodosStateLoading extends TodosState {}

class TodosStateLoaded extends TodosState {
  final List<Todo> todos;

  const TodosStateLoaded([this.todos = const []]);

  @override
  List<Object> get props => [todos];

  @override
  String toString() => 'TodosStateLoaded, todos: $todos';
}

class TodosStateFailed extends TodosState {
  final error;
  TodosStateFailed({this.error});
}
