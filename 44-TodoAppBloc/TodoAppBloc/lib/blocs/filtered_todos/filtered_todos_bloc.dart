import 'dart:async';
import 'package:TodoAppBloc/blocs/blocs.dart';
import 'package:TodoAppBloc/models/models.dart';
import 'package:TodoAppBloc/models/visibility_filter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import 'filtered_todos_event.dart';
import 'filtered_todos_state.dart';

class FilteredTodosBloc extends Bloc<FilteredTodosEvent, FilteredTodosState> {
  final TodosBloc _todosBloc;
  StreamSubscription _todosSubscription;

  FilteredTodosBloc({@required TodosBloc todosBloc})
      : assert(todosBloc != null),
        _todosBloc = todosBloc,
        super(todosBloc.state is TodosStateLoaded
            ? FilteredTodosLoaded(
                (todosBloc.state as TodosStateLoaded).todos,
                VisibilityFilter.all,
              )
            : FilteredTodosLoading()) {
    _todosSubscription = todosBloc.listen((state) {
      if (state is TodosStateLoaded) {
        add(FilteredTodosEventUpdateTodos((todosBloc.state as TodosStateLoaded).todos));
      }
    });
  }

  @override
  Stream<FilteredTodosState> mapEventToState(FilteredTodosEvent event) async* {
    if (event is FilteredTodosEventUpdateFilter) {
      yield* _mapUpdateFilterToState(event);
    } else if (event is FilteredTodosEventUpdateTodos) {
      yield* _mapTodosUpdatedToState(event);
    }
  }

  Stream<FilteredTodosState> _mapUpdateFilterToState(
    FilteredTodosEventUpdateFilter event,
  ) async* {
    final currentState = _todosBloc.state;
    if (currentState is TodosStateLoaded) {
      yield FilteredTodosLoaded(
        _mapTodosToFilteredTodos(currentState.todos, event.filter),
        event.filter,
      );
    }
  }

  Stream<FilteredTodosState> _mapTodosUpdatedToState(
    FilteredTodosEventUpdateTodos event,
  ) async* {
    final visibilityFilter = state is FilteredTodosLoaded
        ? (state as FilteredTodosLoaded).activeFilter
        : VisibilityFilter.all;
    yield FilteredTodosLoaded(
      _mapTodosToFilteredTodos(
        (_todosBloc.state as TodosStateLoaded).todos,
        visibilityFilter,
      ),
      visibilityFilter,
    );
  }

  List<Todo> _mapTodosToFilteredTodos(
      List<Todo> todos, VisibilityFilter filter) {
    return todos.where((todo) {
      if (filter == VisibilityFilter.all) {
        return true;
      } else if (filter == VisibilityFilter.active) {
        return !todo.isCompleted;
      } else {
        return todo.isCompleted;
      }
    }).toList();
  }

  @override
  Future<void> close() {
    _todosSubscription?.cancel();
    return super.close();
  }
}
