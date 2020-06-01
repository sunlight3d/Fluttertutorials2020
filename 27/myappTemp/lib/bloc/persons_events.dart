import 'package:myappTemp/models/person.dart';
import 'package:equatable/equatable.dart';

abstract class PersonsEvent extends Equatable {
  const PersonsEvent();

  @override
  List<Object> get props => [];
}

class EventInsertPerson extends PersonsEvent{
  //properties = event's params
  final Person newPerson;
  const EventInsertPerson({this.newPerson});
  @override
  String toString() {
    // TODO: implement toString
    return 'EventInsertPerson, params : $newPerson';
  }
}
class EventEditPerson extends PersonsEvent{
  //properties = event's params
  final Person updatedPerson;
  const EventEditPerson({this.updatedPerson});
  @override
  String toString() {
    // TODO: implement toString
    return 'EventEditPerson, params : $updatedPerson';
  }
}
class EventDeletePerson extends PersonsEvent{
  //properties = event's params
  final int id;
  const EventDeletePerson({this.id});
  @override
  String toString() {
    // TODO: implement toString
    return 'EventDeletePerson, params : $id';
  }
}
