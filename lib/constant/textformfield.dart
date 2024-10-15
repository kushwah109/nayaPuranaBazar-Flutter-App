import 'package:flutter/material.dart';

class Textformfieldsignup extends StatelessWidget {
  const Textformfieldsignup({super.key,
    required this.fullNameController,
    this.validator, this.hinttext,  this.keyboardType});

  final TextEditingController fullNameController;
  final validator;
  final hinttext;
  final keyboardType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: fullNameController,
      validator: validator,
      textInputAction: TextInputAction.next,
      keyboardType: keyboardType,
      cursorColor: Colors.black,
      decoration: InputDecoration(
        // contentPadding: const EdgeInsets.all(15),
        filled: true,
        fillColor: Colors.white,
        hintText: hinttext,
        hintStyle: TextStyle(color: Colors.grey,fontSize: 20),
        // focusedBorder: OutlineInputBorder(
        //     borderSide: const BorderSide(color: Colors.orange, width: 2),
        //     borderRadius: BorderRadius.circular(30)),
        // enabledBorder: OutlineInputBorder(
        //     borderSide: const BorderSide(color: Colors.grey, width: 1),
        //     borderRadius: BorderRadius.circular(30)),
        // border: OutlineInputBorder(
        //     borderSide: const BorderSide(color: Colors.grey, width: 1),
        //     borderRadius: BorderRadius.circular(10)),
      )


    );
  }
}
