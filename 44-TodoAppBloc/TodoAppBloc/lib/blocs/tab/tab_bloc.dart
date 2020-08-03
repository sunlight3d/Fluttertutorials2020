import 'dart:async';
import 'package:TodoAppBloc/models/models.dart';
import 'package:bloc/bloc.dart';
import 'tab_event.dart';


class TabBloc extends Bloc<TabEvent, MyAppTab> {
  TabBloc() : super(MyAppTab.todos);

  @override
  Stream<MyAppTab> mapEventToState(TabEvent event) async* {
    if (event is TabEventChangeTab) {
      yield event.myAppTab;
    }
  }
}
