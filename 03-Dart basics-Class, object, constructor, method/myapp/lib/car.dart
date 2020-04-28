import 'package:flutter/cupertino.dart';

class Car {
  String name;
  int yearOfProduction;
  //This is the constructor
  /*
  Car(String name, int yearOfProduction){
    this.name = name;
    this.yearOfProduction = yearOfProduction;//classical way
  }
  */
  //New way
  //Car(this.name, this.yearOfProduction);
  //constructor with named arguments
  Car({
    @required this.name,//@required = Not null(warning),
    this.yearOfProduction = 2020//what about "default parameter" ?
  });
  //
  @override
  String toString() {
    // TODO: implement toString
    return '${this.name} - ${this.yearOfProduction}';
  }
  void doSomething(){
    print('I am doing something...');
    this.handleEvent();
  }
  //method with named arguments ?
  void sayHello({String personName}){
    print('Hello $personName');
  }
  //function as "a variable"
  Function handleEvent;
}