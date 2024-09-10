import 'dart:io';

import 'package:four_functions_probs/four_functions_probs.dart' as four_functions_probs;


void main(List<String> arguments) {

  // Problem #1
  // Write a program to tally up total change from user’s pockets. The method GetTotal() will have number of pennies, nickels, dimes, quarters, loonies and twoonies passed into it and will return the total amount. All values entered must be integers and positive. Validation is required to ensure a negative value is not allowed.

  print('Enter number of pennies ');
  int pennies = validateInput();

  print('Enter number of nickels ');
  int nickels = validateInput();

  print('Enter number of dimes ');
  int dimes = validateInput();

  print('Enter number of quarters ');
  int quarters = validateInput();

  print('Enter number of loonies ');
  int loonies = validateInput();

  print('Enter number of twoonies ');
  int twoonies = validateInput();

  double total = getTotal(pennies, nickels, dimes, quarters, loonies, twoonies);

  print('Total value is $total');


  // Problem #2
  // Write a program that will return the number of seconds from hours, minutes and seconds. The method CalculateSeconds() will be passed in hours, minutes and seconds. All values entered must be integers and positive. Validation is required to ensure a negative value is not allowed.

  // Array Problem #1
  // Create a program that will generate a lottery ticket for the user. The user willenter the number of values in the pick and the range. For example, a lottery pick for 6 values in the range 1-49 might look like the following:
	// 7 13 22 34 43 46
	// Store the values in an array of the appropriate length and ensure that there are no duplicates (i.e. the same number must not appear twice). Don’t worry about sorting the values.

  

}


// Methods for Problem #1

double getTotal(int pennies, int nickels, int dimes, int quarters, int loonies, int twoonies) {

  const double penny = 0.01;
  const double nickel = 0.05;
  const double dime = 0.10;
  const double quarter = 0.25;
  const double loonie = 1.0;
  const double twoonie = 2.0;

  double totalValue = (pennies * penny) + (nickels * nickel) + (dimes * dime) + (quarters * quarter) + (loonies * loonie) + (twoonies * twoonie);

  return totalValue;

}

int validateInput() {
  int? value;

  while(true) {
    String? input = stdin.readLineSync();
    value = int.tryParse(input!);

    if(value != null && value >= 0) {
      return value;
    } else {
      print('Print enter a valid positive integer');
    }
  }
}

// Methods for Problem #2




