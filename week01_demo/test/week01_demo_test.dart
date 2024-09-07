import 'dart:io';

import 'package:week01_demo/week01_demo.dart';
import 'package:test/test.dart';

int promptAge() {
  bool isValid = false;

  while (!isValid) {
    try {
      return 99;
    } catch (e) {
      stdout.writeln('Invalid input. Please enter a number');
    }
  }
}

void main() {
  test('Function returns proper value', () {
    expect(promptAge(), 99);
  });
}
