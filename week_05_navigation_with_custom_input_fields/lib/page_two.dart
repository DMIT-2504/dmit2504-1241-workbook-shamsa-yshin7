import 'package:flutter/material.dart';

class PageTwo extends StatefulWidget {
  PageTwo({super.key});

  final String name;
  final String whatYouDo;
  final email;

  PageTwo({
      this.name = '',
      this.email = '',
      this.whatYouDo = '',
      super.key
    });

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: const Text('Page 2')
  //     ),
  //     body: Column(
  //       children: [
  //         ElevatedButton(
  //           onPressed: () {
  //           //   Navigator.push(context, MaterialPageRoute(builder: (context) {
  //           //     return PageTwo();
  //           //   }));
  //           // },
  //           Navigator.pop(context);},
  //           child: Text('Go to page 1')
  //         )
  //       ],
  //     )
  //   );
  // }
}

class PageTwoState extends State<PageTwo> {

  final formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController whatYouDoController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.name);
    whatYouDoController = TextEditingController(text: widget.whatYouDo);
    emailController = TextEditingController(text: widget.email);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      
    })
  }

}