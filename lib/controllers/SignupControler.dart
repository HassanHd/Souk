import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

import 'package:souk/view/Screenes/HomeScreens/HomeScreenes.dart';
class SignupControler extends GetxController {
  // var _id;
  check(int id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("id", id.toString());
  }
  Signupfun({
    required String name,
    required String email,
    required String password,
    required String password_confirmation,
  }) async {
    var url = Uri.parse("https://srcform.com/new/register");
    var response = await http.post(url, body: {
      "name": email,
      "email": email,
      "password": password,
      "password_confirmation": password_confirmation,
    });
    var responseBody = jsonDecode(response.body)["user"]["id"];
    check(responseBody);
    // print("isprifs$_id");
    if(responseBody!=null){
      Get.snackbar("Souk", "Signup completed successfully");
      Get.to(HomeScreenes());
    }
    else{
      Get.snackbar("Souk", "There is a connection problem that may be due to your internet");

    }
  }

}