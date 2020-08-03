import 'package:TodoAppBloc/models/models.dart';
import 'package:TodoAppBloc/models/visibility_filter.dart';
import 'package:equatable/equatable.dart';

abstract class FilteredTodosEvent extends Equatable {
  const FilteredTodosEvent();
}

class FilteredTodosEventUpdateFilter extends FilteredTodosEvent {
  final VisibilityFilter filter;

  const FilteredTodosEventUpdateFilter(this.filter);

  @override
  List<Object> get props => [filter];

  @override
  String toString() => 'UpdateFilter { filter: $filter }';
}

class FilteredTodosEventUpdateTodos extends FilteredTodosEvent {
  final List<Todo> todos;

  const FilteredTodosEventUpdateTodos(this.todos);

  @override
  List<Object> get props => [todos];

  @override
  String toString() => 'UpdateTodos { todos: $todos }';
}
