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
    /*
    var myCar = Car(
        name:'Mercedes-Maybach S-Class Saloon',
        yearOfProduction: 2021); //Flutter style

    myCar.handleEvent = (){
        print("Handle in main");
    };
    myCar.doSomething();//_doSomething is "private" method
    myCar.sayHello(personName: 'Hoang');
    */
    //List of cars ?
    List<Car> cars = <Car>[
        Car(name: 'Mercedes Benz C class 250', yearOfProduction: 2016),
        Car(name:'Mercedes-Maybach S-Class Saloon', yearOfProduction: 2020),
        Car(name: ' Mercedes Benz C class C300 AMG', yearOfProduction: 2017)
    ];//a blank list
    //How to sort this list, by yearOfProduction ?
    //cars.sort((car1, car2) => car1.yearOfProduction - car2.yearOfProduction);//sort ascending
    //cars.sort((car1, car2) => car2.yearOfProduction - car1.yearOfProduction);//sort descending
    //How to sort by name ?
    //cars.sort((car1, car2) => car1.name.compareTo(car2.name));
    //How to update an item in the list ?
    cars[0].yearOfProduction = 2015;
    //add more item
    cars.add(Car(name: '2020 Mercedes-AMG ONE', yearOfProduction: 2020));
    //How to filter ? Ex: get only cars in 2020
    var filteredCars = cars.where((car) => car.yearOfProduction == 2020
                                    && car.name.toUpperCase().contains("AMG"))
                        .toList();
    //delete an item = using filter
    cars = cars.where((car) => car.name != 'Mercedes-Maybach S-Class Saloon')
               .toList();
    //How to get a list of names ? Use "map"
    List<String> names = cars.map((car) => car.name).toList();
    names.forEach((name) {
       print('name: ${name}');
    });
    runApp(
        Center(child: Text(
            names.toString(),
            //How to increase TextSize ?
            style: TextStyle(fontSize: 30),
            textDirection: TextDirection.ltr//left-to-right
        )),
    );
}


