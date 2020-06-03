import 'package:myappTemp/models/person.dart';
import 'package:equatable/equatable.dart';

abstract class PersonsEvent{
  const PersonsEvent();
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
  const EventDeletePerson();
  @override
  String toString() {
    // TODO: implement toString
    return 'EventDeletePerson';
  }
}
class EventSelectPerson extends PersonsEvent {
  final Person selectedPerson;
  const EventSelectPerson({this.selectedPerson});
  @override
  String toString() {
    return 'EventSelectPerson, params : $selectedPerson';
  }
}
