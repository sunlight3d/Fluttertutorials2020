import 'package:flutter/material.dart';

String s1 = 'How are you ?';
String s2 = 'I\'m fine';
var s3 = '$s1 - $s2'; //string concatenation
int x = 10;
int y = x * 2;
//what about an array ?
List<int> numbers = [1, 4, 6, 2, 3, 9, 11];
//How to "map" an array?
List<String> stringNumbers = numbers.map((number){
    return 'value = $number';
}).toList();
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
    runApp(
        Center(child: Text(
            '$stringNumbers',
            //How to increase TextSize ?
            style: TextStyle(fontSize: 30),
            textDirection: TextDirection.ltr//left-to-right
        )),
    );
}


