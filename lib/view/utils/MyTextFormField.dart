import 'package:flutter/material.dart';

class MyTextFormField extends StatelessWidget {
  final String? hintText;
  final String? Function(String?)? validator;
  final Function(String?)? onSaved;
  final bool isPassword;
  final TextInputType? keyboardType;
  final String? helperText;
  final String initialValue;
  final Function()? onEditingComplete;
  final TextInputAction? textInputAction;

  MyTextFormField(
      {this.hintText,
        this.validator,
        this.onSaved,
        this.keyboardType,
        this.helperText,
        this.isPassword = false,
        this.initialValue = "",
        this.onEditingComplete,
        this.textInputAction});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: TextFormField(
        initialValue: initialValue,
        textInputAction: textInputAction ?? TextInputAction.done,
        onEditingComplete: onEditingComplete,
        decoration: InputDecoration(
          isDense: true,
          labelText: hintText,
          helperText: helperText,
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          labelStyle: TextStyle(
              fontSize: 14, color: Theme.of(context).textTheme.caption?.color),
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black12)),
          contentPadding: EdgeInsets.symmetric(vertical: 4, horizontal: 4),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).accentColor,
            ),
          ),
        ),
        obscureText: isPassword ? true : false,

        validator: validator,
        onSaved: onSaved,
        keyboardType: keyboardType,
      ),
    );
  }
}