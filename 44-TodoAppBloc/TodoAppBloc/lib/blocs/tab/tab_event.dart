
import 'package:TodoAppBloc/models/models.dart';
import 'package:equatable/equatable.dart';

abstract class TabEvent extends Equatable {
  const TabEvent();
}

class TabEventChangeTab extends TabEvent {
  final MyAppTab myAppTab;

  const TabEventChangeTab(this.myAppTab);

  @override
  List<Object> get props => [myAppTab];

  @override
  String toString() => 'UpdateTab { tab: $myAppTab }';
}

