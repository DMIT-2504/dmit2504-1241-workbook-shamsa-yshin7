import 'package:flutter/material.dart';
import 'package:flutter_profile_app_demo/widgets/profile_detail.dart';
import 'package:flutter_profile_app_demo/widgets/profile_image.dart';

class MyHomePage extends StatelessWidget{

  const MyHomePage({super.key}); // this constructor needs to have the same name as class

  @override
  Widget build(BuildContext context){
    return Scaffold(
        appBar: AppBar(
          title: const Text('Profile App Demo')
        ),
        // backgroundColor: Theme.of(context).colorScheme.primary,
        body: const Column(
          children: [
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Employee Profile',
                style: TextStyle(
                  fontFamily: 'Lobster',
                  fontSize: 36.0,
                  fontWeight: FontWeight.bold
                )
              )
            ),
            // Profile image
            ProfileImage('images/spongebob.jpg'),
            // Profile name
            Padding(padding: EdgeInsets.all(16.0),
            child: Text(
              'Spongebob',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              )
            )
            ),
            // Positioning
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ProfileDetail('Position', 'Developer')
              ],
            )
          ]
        )
      );
  }
}