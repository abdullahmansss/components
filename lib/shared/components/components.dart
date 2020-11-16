import 'package:flutter/material.dart';

Widget defaultButton({
  text,
  function,
  color,
  isUpperCase,
  double r = 5.0,
}) =>
    Container(
      height: 40.0,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          r,
        ),
        color: color,
      ),
      child: FlatButton(
        onPressed: function,
        child: Text(
          isUpperCase ? text.toString().toUpperCase() : text.toString(),
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );

Widget defaultFormField({
  @required controller,
  hint = '',
  @required type,
  isPassword = false,
}) =>
    Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          5.0,
        ),
        border: Border.all(
          width: 1.0,
          color: Colors.grey,
        ),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 15.0,
      ),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          hintText: '$hint',
          border: InputBorder.none,
        ),
        keyboardType: type,
        obscureText: isPassword,
      ),
    );

void navigateTo(context, widget) => Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => widget,
  ),
);
