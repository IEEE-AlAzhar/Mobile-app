import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InputField extends StatefulWidget {

  final String label;
  final TextEditingController myController;

  InputField(this.label,this.myController);

  @override
  _InputFieldState createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLength: 11,
      keyboardType: TextInputType.phone,
      style: TextStyle(
        color: Colors.black,
      ),
      controller: widget.myController,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.blue[300],
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
        filled: true,
        fillColor: Colors.white,
        labelText: widget.label,
        labelStyle: TextStyle(
          color: Colors.blue[300],
          fontSize: 20.0,
          fontWeight: FontWeight.bold
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.blue[300],
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}


