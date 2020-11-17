import 'package:flutter/material.dart';

Widget defaultButton({
  double wid = double.infinity,
  double r = 10.0,
  @required String text,
  bool isUpper = true,
  Color back = Colors.blue,
  @required Function function,
}) =>
    Container(
      width: wid,
      decoration: BoxDecoration(
        color: back,
        borderRadius: BorderRadius.circular(
          r,
        ),
      ),
      child: FlatButton(
        onPressed: function,
        child: Text(
          isUpper ? text.toUpperCase() : text,
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
          color: Colors.grey,
        ),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 15.0,
      ),
      child: TextFormField(
        controller: controller,
        keyboardType: type,
        obscureText: isPassword,
        decoration: InputDecoration(
          hintText: hint,
          border: InputBorder.none,
        ),
      ),
    );

void navigateTo(context, widget) => Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => widget,
  ),
);


Widget buildSeparator() => Container(
  height: 1.0,
  width: double.infinity,
  color: Colors.grey,
);
