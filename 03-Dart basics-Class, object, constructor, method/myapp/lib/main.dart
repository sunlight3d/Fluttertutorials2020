import 'package:flutter/material.dart';
import 'calculation.dart';//calculation is a "module"
import 'car.dart';

void main(){
    /*
    //classical way of iterating
    for(int i = 0; i < numbers.length; i++){
        print(numbers[i]);
    }*/
    /*
    numbers.forEach((number){
       print(number);
    });
    */
    stringNumbers.forEach((str){
        print(str);
    });
    //How to init an object ?
    var myCar = Car(
        name:'Mercedes-Maybach S-Class Saloon',
        yearOfProduction: 2021); //Flutter style

    myCar.handleEvent = (){
        print("Handle in main");
    };
    myCar.doSomething();
    myCar.sayHello(personName: 'Hoang');

    runApp(
        Center(child: Text(
            '${myCar.toString()}',
            //How to increase TextSize ?
            style: TextStyle(fontSize: 30),
            textDirection: TextDirection.ltr//left-to-right
        )),
    );
}


