import 'package:myappTemp/models/person.dart';

class PersonsState {
  final List<Person> persons;
  Person selectedPerson;
  PersonsState({this.persons = const []});
}

