import 'package:calculator/modules/database/database.dart';
import 'package:calculator/modules/screen_two/screen_two.dart';
import 'package:calculator/shared/components/components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ScreenOne extends StatelessWidget {
  var emailController = TextEditingController();
  var email = '';

  var usernameController = TextEditingController();
  var username = '';

  var phoneController = TextEditingController();
  var phone = '';

  var passwordController = TextEditingController();
  var password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('screen one'),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              defaultFormField(
                controller: emailController,
                hint: 'enter email',
                type: TextInputType.emailAddress,
              ),
              SizedBox(
                height: 10.0,
              ),
              defaultFormField(
                controller: usernameController,
                hint: 'enter username',
                type: TextInputType.name,
              ),
              SizedBox(
                height: 20.0,
              ),
              defaultFormField(
                controller: phoneController,
                hint: 'enter phone number',
                type: TextInputType.phone,
              ),
              SizedBox(
                height: 20.0,
              ),
              defaultFormField(
                controller: passwordController,
                hint: 'enter password',
                type: TextInputType.visiblePassword,
                isPassword: true,
              ),
              SizedBox(
                height: 20.0,
              ),
              // defaultButton(
              //   color: Colors.blue,
              //   text: 'login',
              //   isUpperCase: true,
              //   function: () {
              //     email = emailController.text;
              //     username = usernameController.text;
              //     phone = phoneController.text;
              //     password = passwordController.text;
              //     print('${email.toString()}');
              //     print('${username.toString()}');
              //     print('${phone.toString()}');
              //     print('${password.toString()}');
              //
              //     Toast.show(
              //       'toast hello',
              //       context,
              //       duration: Toast.LENGTH_LONG,
              //       gravity: Toast.BOTTOM,
              //       backgroundColor: Color(0xFF000000).withOpacity(.1),
              //     );
              //   },
              // ),
              // SizedBox(
              //   height: 20.0,
              // ),
              // defaultButton(
              //   color: Colors.teal,
              //   text: 'screen two',
              //   isUpperCase: true,
              //   function: () {
              //     navigateTo(context, ScreenTwo());
              //   },
              // ),
              defaultButton(
                text: 'next',
                function: () {
                  Fluttertoast.showToast(
                      msg: "This is Bottom Short Toast",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.green,
                      textColor: Colors.white,
                      fontSize: 16.0,
                  );
                },
              ),
              SizedBox(
                height: 20.0,
              ),
              defaultButton(
                text: 'screen two',
                function: () {
                  navigateTo(context, ScreenTwo());
                },
              ),
              SizedBox(
                height: 20.0,
              ),
              defaultButton(
                text: 'database',
                function: () {
                  navigateTo(context, WaitDatabase());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
