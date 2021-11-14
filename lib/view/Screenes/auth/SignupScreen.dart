import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:souk/controllers/SignupControler.dart';
import 'package:souk/view/Screenes/auth/LoginScreen.dart';
import 'package:souk/view/utils/MyTextFormField.dart';
import 'package:souk/view/utils/MyTextFormFieldpass.dart';

import '../../../constant.dart';
class SignupScreen extends StatefulWidget {

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  String? email,password,Confirmation_Password,name;
  final SignupControler signupControler =Get.put(SignupControler());
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false, // Don't show the leading button
          backgroundColor: primarycolor,
          title: Text("Sign Up"),
        ),
        backgroundColor: white,
        body:  Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height/20,),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                elevation: 5,
                child: Container(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        _createBasicInfoCard(),
                        SizedBox(
                          height: 24,
                        ),
                        FractionallySizedBox(
                          widthFactor: 0.8,
                          child: ButtonTheme(
                            height: 48,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary:primarycolor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4),
                                ),// Sets color for all the descendent ElevatedButtons
                              ),
                              onPressed: () {
                                print("hi---------------");
                                FocusScope.of(context).requestFocus(FocusNode());
                                if (_formKey.currentState!.validate()) {
                                  _formKey.currentState!.save();
                                  signupControler.Signupfun(email: email.toString(),password: password.toString(),name: name.toString(),password_confirmation: Confirmation_Password.toString());
                                  // Api.Login(email, password).then((value) => _onError(value));
                                }
                              },
                              child: Text(
                                "Sign up",
                                style: TextStyle(
                                    color:white),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        FractionallySizedBox(
                          widthFactor: 0.8,
                          child: ButtonTheme(
                            height: 48,
                            child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                side: BorderSide(color: primarycolor, width: 1),
                              ),
                              child: Text("Back",style: TextStyle(color: primarycolor),),
                              onPressed: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => LoginScreen()));
                                // Navigator.of(context).pushNamed(RoutePaths.SignUp);
                              },
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                  ),
                ),
              ),

            ],
          ),
        ),


      );
  }
  Widget _createBasicInfoCard() {
    return Card(
      margin: EdgeInsets.only(top: 16,right: 10,left: 10),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
        child: Column(
          children: [
            MyTextFormField(
              hintText: 'Name',
              keyboardType: TextInputType.name,
              validator: (String? value) {
                if (value!.isEmpty) {
                  return 'Please Enter Name';
                }
                return null;
              },
              onSaved: (String? value) {
                setState(() {
                  name=value;
                });
                // _addRequest.email = value ?? "";
              },
            ),
            MyTextFormField(
              hintText: 'Email',
              keyboardType: TextInputType.emailAddress,
              validator: (String? value) {
                if (value!.isEmpty) {
                  return 'Please Enter Email';
                }
                return null;
              },
              onSaved: (String? value) {
                setState(() {
                  email=value;
                });
                // _addRequest.email = value ?? "";
              },
            ),
            MyTextFormFieldpass(
              hintText: 'Password',
              keyboardType: TextInputType.visiblePassword,
              obscureText: true,
              validator: (String? value) {
                if (value!.isEmpty) {
                  return 'Please Enter Password';
                }
                return null;
              },


              onSaved: (String? value) {
                setState(() {
                  password=value;
                });
                // _addRequest.password = value ?? "";
              },
            ),
            MyTextFormFieldpass(
              hintText: 'Confirmation Password',
              keyboardType: TextInputType.visiblePassword,
              obscureText: true,
              validator: (String? value) {
                if (value!.isEmpty) {
                  return 'Enter Confirmation Password';
                }
                return null;
              },


              onSaved: (String? value) {
                setState(() {
                  Confirmation_Password=value;
                });
                // _addRequest.password = value ?? "";
              },
            ),
          ],
        ),
      ),
    );
  }
}
