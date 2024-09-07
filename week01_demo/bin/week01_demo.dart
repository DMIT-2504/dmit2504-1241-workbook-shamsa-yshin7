import 'dart:io';

import 'package:week01_demo/person.dart';
import 'package:week01_demo/week01_demo.dart';

void main(List<String> arguments) {
  String name = prompt('Enter your name: ');

  int age = promptAge('Enter your age: ');

  Person person = Person(name, age);
  stdout.writeln('Your name is ${person.name} and you are ${person.age} years old');
}
