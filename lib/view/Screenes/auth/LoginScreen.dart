import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:souk/constant.dart';
import 'package:souk/controllers/LoginControler.dart';
import 'package:souk/view/utils/MyTextFormField.dart';
import 'package:souk/view/utils/MyTextFormFieldpass.dart';

import 'SignupScreen.dart';
class LoginScreen extends GetWidget<LoginControler>{
  final _formKey = GlobalKey<FormState>();
  String? email,password;
  final LoginControler loginControler =Get.put(LoginControler());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading:false,
        backgroundColor: primarycolor,
        title: Text("Login"),
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
                              FocusScope.of(context).requestFocus(FocusNode());
                              if (_formKey.currentState!.validate()) {
                                _formKey.currentState!.save();
                                Get.snackbar("Souk", "Please wait for the process to complete successfully");

                                loginControler.loginfun(email!, password!);

                              }
                            },
                            child: Text(
                              "Login",
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
                            child: Text("Sign up",style: TextStyle(color: primarycolor),),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SignupScreen()));
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
              hintText: 'Email',
              keyboardType: TextInputType.emailAddress,
              validator: (String? value) {
                if (value!.isEmpty) {
                  return 'Enter email';
                }
                return null;
              },
              onSaved: (String? value) {

                  email=value;

                // _addRequest.email = value ?? "";
              },
            ),
            MyTextFormFieldpass(
              hintText: 'Password',
              keyboardType: TextInputType.visiblePassword,
              obscureText: true,
              validator: (String? value) {
                if (value!.isEmpty) {
                  return 'Enter Password';
                }
                return null;
              },


              onSaved: (String? value) {

                  password=value;

                // _addRequest.password = value ?? "";
              },
            ),
          ],
        ),
      ),
    );
  }
  // Future<bool> _onBackPressed() async{
  //   return await  showDialog(
  //     context: context,
  //     builder: (context) {
  //       return AlertDialog(
  //         elevation: 5,
  //         title: Text('Do you want to exit the application ?',
  //           textAlign: TextAlign.center,),
  //         // content: Text('Do you want to exit the App'),
  //         actions: <Widget>[
  //           FlatButton(
  //             minWidth: MediaQuery.of(context).size.width/3,
  //             color: Colors.red,
  //             child: Text('No',style: TextStyle(color: white),),
  //             onPressed: () {
  //               Navigator.of(context).pop(false); //Will not exit the App
  //             },
  //           ),
  //           FlatButton(
  //             minWidth: MediaQuery.of(context).size.width/3,
  //
  //             color: primarycolor,
  //             child: Text('yes',style: TextStyle(color: white),),
  //             onPressed: () => exit(0),
  //
  //             // onPressed: () {
  //             //   // onPressed: ()=> exit(0),
  //             //
  //             //   // Navigator.of(context).pop(true); //Will exit the App
  //             // },
  //           )
  //         ],
  //       );
  //     },
  //   ) ??
  //       false;
  // }


}
