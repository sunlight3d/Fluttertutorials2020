import 'dart:math';

class Person {
  int id;
  String name, email;
  Person({this.name, this.email}) {
    this.id = Random().nextInt(1000);
  }
}