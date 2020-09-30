import 'package:araya_flutter_app/utils/customFunction.dart';
import 'package:araya_flutter_app/widgets/inputField.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../utils/validationForm.dart';

class LoginScreen extends StatefulWidget {
  createState() {
    return LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen>
    with ValidationForm, CustomFunction {
  /// immutable variables
  final formKey = GlobalKey<FormState>();
  final Color inkwellColor = Color(0xFFFFFF);
  final texfieldController = TextEditingController();

  /// mutable variables
  String email = '';
  String password = '';
  bool resetErrorField = false;

  @override
  void initState() {
    super.initState();
    // texfieldController.addListener(_texfieldController);
  }

  void _texfieldController() {
    print('_texfieldController > ' + resetErrorField.toString());
    setState(() {
      resetErrorField = !resetErrorField;
    });
  }

  Widget build(context) {
    return Wrap(
      children: <Widget>[
        InkWell(
          radius: 0,
          splashColor: inkwellColor,
          highlightColor: inkwellColor,
          focusColor: inkwellColor,
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Container(
            margin: EdgeInsets.all(20.0),
            child: Form(
                key: formKey,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Flexible(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Text(
                              'Returning Customer $resetErrorField',
                              style: TextStyle(
                                color: hexToColor('#000000'),
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Flexible(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Text(
                              '*Required',
                              style: TextStyle(
                                color: hexToColor('#000000'),
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Flexible(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Text(
                              'If you are a registered user, please enter your email and password.',
                              style: TextStyle(
                                color: hexToColor('#000000'),
                                fontSize: 16,
                              ),
                              overflow: TextOverflow.clip,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: InputField(
                        param: {
                          'key': new Key('email'),
                          'decoration': InputDecoration(
                            labelText: 'Email Address*',
                            labelStyle: TextStyle(color: Colors.black),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.amber)),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.yellow)),
                          ),
                          'validator': validateEmail,
                          'onSaved': (String value) {
                            email = value;
                          },
                          'keyboardType': TextInputType.emailAddress,
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: InputField(
                        param: {
                          'obscureText': true,
                          'key': new Key('password'),
                          'decoration': InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.amber)),
                            labelText: 'Password*',
                            labelStyle: TextStyle(color: Colors.black),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.red)),
                          ),
                          // 'onChanged':(val) {
                          //   _texfieldController();
                          // },
                          // 'controller': texfieldController,
                          'validator': validatePassword,
                          // 'validator': validatePassword('123456789'),
                          'onSaved': (String value) {
                            password = value;
                          },
                        },
                      ),
                    ),
                    submitButton(),
                  ],
                )),
          ),
        ),
      ],
    );
  }

  Widget submitButton() {
    return Row(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: 60.0),
          child: RaisedButton(
            color: hexToColor('#E31837'),
            onPressed: () {
              print('Email: $email, Password: $password');
              bool isValid = formKey.currentState.validate();
              if (isValid) {
                formKey.currentState.save();
                print('Email: $email, Password: $password');
                FocusScope.of(context).unfocus();
                Navigator.pushNamed(context, '/dashboard');
              } else {
                Fluttertoast.showToast(
                  msg: "Email or Password Incorrect",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.TOP,
                  backgroundColor: Colors.redAccent,
                  // timeInSecForIosWeb: 1
                );
              }
            },
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 60),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            child: Text(
              'Daftar',
              style: TextStyle(color: hexToColor('#FFFFFF'), fontSize: 16),
            ),
          ),
        ),
      ],
    );
  }
}
