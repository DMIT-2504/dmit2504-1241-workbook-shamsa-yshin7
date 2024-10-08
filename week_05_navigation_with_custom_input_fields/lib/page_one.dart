import 'package:flutter/material.dart';
import 'package:week_05_navigation_with_custom_input_fields/page_two.dart';
import 'package:week_05_navigation_with_custom_input_fields/user_input_form.dart';

class PageOne extends StatelessWidget {
  PageOne({super.key});
  final formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController whatYouDoController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page 1')
      ),
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: UserInputForm(
            submitButton: ElevatedButton(
              onPressed: () {
                if(formKey.currentState!.validate()) {
                  Navigator.push(
                    context, 
                    MaterialPageRoute(
                      builder: (context) => PageTwo(
                        name: nameController.text,
                        whatYouDo: whatYouDoController.text,
                        email: emailController.text
                      )
                    )
                    );
                }
              }, 
              child: child
            ), 
            formKey: formKey, 
            nameController: nameController, 
            whatYouDoController: whatYouDoController, 
            emailController: emailController),
        )

      // Column(
      //   children: [
      //     ElevatedButton(
      //       onPressed: () {
      //         // Navigator.push(context, MaterialPageRoute(builder: (context) {
      //         //   return PageTwo();
      //         // }));

      //         Navigator.pushNamed(context, '/pageTwo');
      //       },
      //       child: Text('Go to page 2')
      //     )
      //   ],
      // )
    );
  }
}