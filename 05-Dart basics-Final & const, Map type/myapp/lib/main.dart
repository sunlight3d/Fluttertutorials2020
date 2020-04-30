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
    //Now we try with final and const(constant)
    const List<int> someNumbers = [1,2,3,5];
    //someNumbers.add(7);//you can add more items to a "final" list.In "const" list, you cannot do that !
    //someNumbers[1] = 99;//you can update item's value in a list(final).In "const" list, you cannot do that !
    //now reference to a final list
    List<int> someNumbers2 = someNumbers;
    //someNumbers2.add(123);
    someNumbers2 = [4,7,9];//you can reference someNumbers2 to another array after reference to a "final/const"
    //It means: reference to a final/const is not final/const !
    //You can define an object without creating a class => Map type
    Map<String, dynamic> personA = Map();//key:String, value: String
    personA['name'] = 'Hoang';
    personA['age'] = 18;
    Map<double, double> point = Map();
    point[2.0] = 3.2;//x = 2.0, y = 3.2
    point[1.0] = 5.6;//...You can add many key-value pairs as you like !
    runApp(
        Center(child: Text(
            names.toString(),
            //How to increase TextSize ?
            style: TextStyle(fontSize: 30),
            textDirection: TextDirection.ltr//left-to-right
        )),
    );
}


