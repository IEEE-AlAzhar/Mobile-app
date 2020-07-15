import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ieeeapp/constants.dart';
import 'package:ieeeapp/main.dart';

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
      cursorColor: Colors.blue[300],
      maxLength: 11,
      keyboardType: TextInputType.phone,
      style: TextStyle(
        color: themeChangeProvider.darkTheme ? Colors.blue[300] : Colors.black,
        fontSize: 20
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
        fillColor: themeChangeProvider.darkTheme ? primaryColor : Colors.white,
        labelText: widget.label,
        labelStyle: TextStyle(
          color: Colors.blue[300],
          fontSize: 20.0,
          fontWeight: FontWeight.bold
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.blue[300],
            width: 4.0,
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}


