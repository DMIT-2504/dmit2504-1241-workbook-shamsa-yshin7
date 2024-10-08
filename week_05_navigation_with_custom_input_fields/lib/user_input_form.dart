import 'package:flutter/material.dart';

// use stateful to dynamically rebuild your text field
class NameField extends StatelessWidget {
  final TextEditingController controller;
  final String label;

  NameField({super.key, required this.controller, this.label = 'Name'});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          fillColor: Colors.white,
          labelText: label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0)
          )
        ),
        validator: (value) {
          if(value == null || value.isEmpty) {
            return 'Please enter a $label';
          }
          return null;
        },
      )
    );
  }
}



class WhatYouDoField extends StatefulWidget {
  final TextEditingController controller;
  final String label;

  WhatYouDoField({super.key, required this.controller, this.label = 'What You Do'});

  @override
  WhatYouDoFieldState createState() {
    return WhatYouDoFieldState();
  }
}

class WhatYouDoFieldState extends State<WhatYouDoField> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: widget.controller,
        decoration: InputDecoration(
          fillColor: Colors.white,
          labelText: widget.label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0)
          )
        ),
        validator: (value) {
          if(value == null || value.isEmpty) {
            return 'Please enter $widget.label';
          }
          return null;
        },
      )
    );
  }
}


class EmailField extends FormField<String> {
  final TextEditingController controller;
  final String label;

  EmailField({super.key, required this.controller, this.label = 'Email'})

  :super(
    initialValue: controller.text,
    validator: (value) {
      if(value == null || value.isEmpty) {
        return 'Email is required';
      }
      if(RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
        return 'Email a valid email';
      }

      return null;
    },
    builder: (FormFieldState<String> field) {
      final EmailFormFieldState state = field as EmailFormFieldState;
      state._setController(controller);
      return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          fillColor: Colors.white,
          labelText: label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0)
          )
        ),
        validator: (value) {
          if(value == null || value.isEmpty) {
            return 'Please enter $label';
          }
          return null;
        },
      )
    );
    }
  );

  @override
  FormFieldState<String> createSate() => EmailFormFieldState();
}


class EmailFormFieldState extends FormFieldState<String> {
  TextEditingController? _controller;

  void _setController(TextEditingController controller) {
    if(_controller != controller) {
      if(_controller != null) {
        _controller!.removeListener(_onControllerChanged);
      }
      _controller = controller;
      _controller!.addListener(_onControllerChanged);
    }
    
  }

  void _onControllerChanged() {
    didChange(_controller!.text);
  }

  @override
  void dispose() {
    if(_controller != null) {
      _controller!.removeListener(_onControllerChanged);
    }

    super.dispose();
  }

}


class UserInputForm extends StatefulWidget {
  final Widget submitButton;
  final GlobalKey<FormState> formKey;
  TextEditingController nameController;
  TextEditingController whatYouDoController;
  TextEditingController emailController;

  UserInputForm(
    {
      required this.submitButton,
      required this.formKey,
      required this.nameController,
      required this.whatYouDoController,
      required this.emailController,
      super.key
    }
  )

  @override
  UserInputFormState createState() => UserInputFormState();

}


class UserInputFormState extends State<UserInputForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        children: [
          NameField(controller: widget.nameController),
          WhatYouDoField(controller: widget.whatYouDoController),
          EmailField(controller: widget.emailController),
          SizedBox(height: 20),
          widget.submitButton
        ]
      ),
    );
  }
}