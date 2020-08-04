import 'dart:async';
import 'package:TodoAppBloc/blocs/todos/todos_bloc.dart';
import 'package:TodoAppBloc/blocs/todos/todos_state.dart';
import 'package:bloc/bloc.dart';

import 'statistics_event.dart';
import 'statistics_state.dart';

class StatisticsBloc extends Bloc<StatisticsEvent, StatisticsState> {
  StreamSubscription _todosSubscription;

  StatisticsBloc({TodosBloc todosBloc})
      : assert(todosBloc != null),
        super(StatisticsStateLoading()) {
    final statisticsState = state;
    _todosSubscription = todosBloc.listen((todosState) {
      if (todosState is TodosStateLoaded) {
        add(StatisticsEventUpdate(todosState.todos));
      } else if(todosState is TodosStateLoading) {
        add(StatisticsEventUpdate([]));
      }
    });
  }

  @override
  Stream<StatisticsState> mapEventToState(StatisticsEvent statisticsEvent) async* {
    if (statisticsEvent is StatisticsEventUpdate) {
      int numberOfActiveTodos =
          statisticsEvent.todos
              .where((todo) => !todo.isCompleted)
              .toList()
              .length;
      int numberOfCompletedTodo =
          statisticsEvent.todos
              .where((todo) => todo.isCompleted)
              .toList()
              .length;
      yield StatisticsStateLoaded(numberOfActiveTodos, numberOfCompletedTodo);
    }
  }

  @override
  Future<void> close() {
    _todosSubscription?.cancel();
    return super.close();
  }
}
