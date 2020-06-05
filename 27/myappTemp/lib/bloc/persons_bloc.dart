import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:myappTemp/bloc/persons_events.dart';
import 'package:myappTemp/bloc/persons_state.dart';
import 'package:myappTemp/models/person.dart';
class PersonsBloc extends Bloc<PersonsEvent, PersonsState> {
  @override
  // TODO: implement initialState
  PersonsState get initialState => PersonsState();
  @override
  Stream<PersonsState> mapEventToState(PersonsEvent event) async* {
    if(event is EventInsertPerson) {
      final List<Person> updatedPersons =
      List.from((state as PersonsState).persons)..add(event.newPerson);
      yield PersonsState(persons: updatedPersons);
    } else if(event is EventEditPerson) {
      final List<Person> updatedPersons =
        (state as PersonsState).persons.map((person) {
          return person.id == event.updatedPerson.id ? event.updatedPerson : person;
        }).toList();
      yield PersonsState(persons: updatedPersons);
    } else if(event is EventDeletePerson) {
      var selectedPerson = (state as PersonsState).selectedPerson;
      final List<Person> updatedPersons =
      (state as PersonsState).persons
          .where((person) => person.id != selectedPerson.id)
          .toList();
      yield PersonsState(persons: updatedPersons);
    } else if(event is EventSelectPerson) {
      PersonsState newState = PersonsState(persons: (state as PersonsState).persons);
      newState.selectedPerson = event.selectedPerson;
      yield newState;
    }
  }
}