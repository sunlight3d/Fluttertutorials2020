import 'package:TodoAppBloc/models/models.dart';
import 'package:equatable/equatable.dart';

abstract class StatisticsEvent extends Equatable {
  const StatisticsEvent();
}

class StatisticsEventUpdate extends StatisticsEvent {
  final List<Todo> todos;

  const StatisticsEventUpdate(this.todos);

  @override
  List<Object> get props => [todos];

  @override
  String toString() => 'StatisticsEventUpdate todos: $todos';
}
