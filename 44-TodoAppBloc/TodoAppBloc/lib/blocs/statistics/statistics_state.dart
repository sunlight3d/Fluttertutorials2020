import 'package:equatable/equatable.dart';

abstract class StatisticsState extends Equatable {
  const StatisticsState();

  @override
  List<Object> get props => [];
}

class StatisticsStateLoading extends StatisticsState {}

class StatisticsStateLoaded extends StatisticsState {
  final int numberOfActiveTodos;
  final int numberOfCompletedTodos;

  const StatisticsStateLoaded(this.numberOfActiveTodos, this.numberOfCompletedTodos);

  @override
  List<Object> get props => [numberOfActiveTodos, numberOfCompletedTodos];

  @override
  String toString() {
    return 'StatisticsLoaded { numActive: $numberOfActiveTodos, numCompleted: $numberOfCompletedTodos }';
  }
}
