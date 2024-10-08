import 'package:flutter/material.dart';

class SimpleTextFieldStateful extends StatefulWidget{
  @override
  _SimpleTextFieldState createState() => _SimpleTextFieldState();
}

// state class to display error messages
class _SimpleTextFieldState extends State<SimpleTextFieldStateful> {

  // instantiate controllers
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  // variable for validation errors
  String? nameError;
  String? emailError;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // name textfield
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'Enter name',
                errorText: nameError // display error message for name
              ),
              onChanged: (text) {
                setState(() {
                  if(text.isEmpty) {
                    nameError = 'Name cannot be empty';
                  } else {
                    nameError = null;
                  }
                });
              },
            ),
            SizedBox(height: 20),
            // email textfield
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'Enter email',
                errorText: emailError // display error message for name
              ),
              onChanged: (text) {
                setState(() {
                  if(text.isEmpty) {
                    nameError = 'Email cannot be empty';
                  } else {
                    nameError = null;
                  }
                });
              },
            ),
            ElevatedButton(
              onPressed: () {
                // get data from controller
                String name = nameController.text;
                String email = emailController.text;

                setState(() {
                  if(name.isEmpty) {
                    nameError = 'Name cannot be empty';
                  } else {
                    nameError = null;
                  }

                  if(email.isEmpty) {
                    nameError = 'Email cannot be empty';
                  } else {
                    emailError = null;
                  }
                });

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Your name is $name and your email is $email')
                  )
                );
              }, child: Text('Submit'),
            )

          ],
      )
    );
  }

}