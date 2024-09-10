import 'dart:math';
import 'dart:io';


void main(List<String> arguments) {

  // Array Problem #1
  // Create a program that will generate a lottery ticket for the user. The user willenter the number of values in the pick and the range. For example, a lottery pick for 6 values in the range 1-49 might look like the following:
  // 7 13 22 34 43 46
  // Store the values in an array of the appropriate length and ensure that there are no duplicates (i.e. the same number must not appear twice). Don’t worry about sorting the values.


  // get user input for values
  print('Enter number of values ');
  int numOfValues = int.parse(stdin.readLineSync()!);

  // get user input for ranges
  print('Enter range of values ');
  int range = int.parse(stdin.readLineSync()!);

  // store in array (list)
  List<int> lotteryTicket = generateTicket(numOfValues, range);

  print(lotteryTicket);

}

List<int> generateTicket(int values, int range) {

  Random random = Random();
  Set<int> ticketSet = {};

  while(ticketSet.length < values) {
    int randValue = random.nextInt(range) + 1;
    ticketSet.add(randValue);
  }

  return ticketSet.toList();

}