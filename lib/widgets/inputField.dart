import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  InputField({Key key, this.param}) : super(key: key);

  final Map param;

  @override
  Widget build(BuildContext context) {
    bool setObscureText =  param['obscureText'] != null ? true : false;
    return TextFormField(
        key: param['key'],
        decoration: param['decoration'],
        validator: param['validator'],
        onSaved: param['onSaved'],
        keyboardType: param['keyboardType'],
        obscureText: setObscureText,
        onChanged: param['onChanged'],
        controller: param['controller'],
    );
  }
}