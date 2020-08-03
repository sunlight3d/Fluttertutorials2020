import 'package:TodoAppBloc/models/models.dart';
import 'package:equatable/equatable.dart';

abstract class StatisticsEvent extends Equatable {
  const StatisticsEvent();
}

class UpdateStatistics extends StatisticsEvent {
  final List<Todo> todos;

  const UpdateStatistics(this.todos);

  @override
  List<Object> get props => [todos];

  @override
  String toString() => 'UpdateStatistics { todos: $todos }';
}
