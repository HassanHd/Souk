import 'package:flutter/material.dart';
class MyTextFormFieldpass extends StatefulWidget {
  final String? hintText;
  final String? Function(String?)? validator;
  final Function(String?)? onSaved;
  // final bool isPassword;
  final TextInputType? keyboardType;
  final String? helperText;
  final String initialValue;
  final Function()? onEditingComplete;
  final TextInputAction? textInputAction;
  // Initially password is obscure
  bool obscureText ;

  // Toggles the password show status

  MyTextFormFieldpass(
      {this.hintText,
        this.validator,
        this.onSaved,
        this.keyboardType,
        this.helperText,
        this.obscureText = true,
        this.initialValue = "",
        this.onEditingComplete,
        this.textInputAction});
  @override
  _MyTextFormFieldpassState createState() => _MyTextFormFieldpassState();
}

class _MyTextFormFieldpassState extends State<MyTextFormFieldpass> {

  void _toggle() {
    setState(() {
     widget.obscureText = ! widget.obscureText;

    });
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: TextFormField(
        initialValue:widget.initialValue,
        textInputAction:widget. textInputAction ?? TextInputAction.done,
        onEditingComplete:widget. onEditingComplete,
        decoration: InputDecoration(
            isDense: true,
            labelText:widget. hintText,
            helperText:widget. helperText,

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

            suffixIcon: FlatButton(
                onPressed: _toggle,
                child: Padding(
                  padding:
                  const EdgeInsets.only(left: 25.0),
                  child: Icon(Icons.remove_red_eye,
                      color:widget. obscureText
                          ? Colors.black12
                          : Colors.black54),
                ))
        ),
        obscureText:widget.obscureText,

        validator:widget. validator,
        onSaved:widget. onSaved,
        keyboardType:widget. keyboardType,
      ),
    );
  }
}
