import 'dart:io';

String prompt(String message) {
  stdout.write(message);
  return stdin.readLineSync()!;
}

// test to see if it can get the proper input
// if user returns a name string, it should give an error
int promptAge(String message) {
  bool isValid = false;

  while (!isValid) {
    try {
      var userInput = prompt((message));
      return int.parse(userInput);
    } catch (e) {
      stdout.writeln('Invalid input. Please enter a number');
    }
  }
}
