import 'package:flutter/material.dart';

Widget inputField(String hint) {
  return TextField(
    decoration: InputDecoration(
      hintText: hint,
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.teal,
          width: 2.0,
        ),
        borderRadius: BorderRadius.circular(10.0),
      ),
      filled: true,
      fillColor: Colors.white,
      labelText: 'User Name',
      labelStyle: TextStyle(
        color: Colors.teal,
        fontSize: 18.0,
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.teal,
          width: 2.0,
        ),
        borderRadius: BorderRadius.circular(10.0),
      ),
    ),
  );
}
