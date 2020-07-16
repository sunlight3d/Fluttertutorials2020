import 'package:flutter_bloc/flutter_bloc.dart';

import '../events/counter_event.dart';
class CounterBloc extends Bloc<CounterEvent, int> {
  //define "initial state" here
  @override
  int get initialState => 0;
  @override
  Stream<int> mapEventToState(CounterEvent event) async*{
    print(state);//this is "current state"
    //You must have UI to send Event(by pressing buttons)
    switch(event) {
      case CounterEvent.increment:
        var newState = state + 1;
        yield newState;
        break;
      case CounterEvent.decrement:
        var newState = state - 1;
        yield newState;
        break;
    }
  }
}