import 'package:flutter/material.dart';
import 'package:week_05_navigation_with_custom_input_fields/page_one.dart';
import 'package:week_05_navigation_with_custom_input_fields/page_two.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/pageTwo': (context) => PageTwo(),
        // '/pageThree': (context) => PageThree(),
        // '/pageFour': (context) => PageFour()
      },
      initialRoute: '/',
      home: PageOne()
    );
  }
}
