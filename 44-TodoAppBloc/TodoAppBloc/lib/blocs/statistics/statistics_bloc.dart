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
        super(StatisticsLoading()) {
    _todosSubscription = todosBloc.listen((state) {
      if (state is TodosLoaded) {
        add(UpdateStatistics(state.todos));
      }
    });
  }

  @override
  Stream<StatisticsState> mapEventToState(StatisticsEvent event) async* {
    if (event is UpdateStatistics) {
      int numActive =
          event.todos.where((todo) => !todo.isCompleted).toList().length;
      int numCompleted =
          event.todos.where((todo) => todo.isCompleted).toList().length;
      yield StatisticsLoaded(numActive, numCompleted);
    }
  }

  @override
  Future<void> close() {
    _todosSubscription?.cancel();
    return super.close();
  }
}
