import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'dart:async';
import 'package:souk/view/Screenes/HomeScreens/HomeScreenes.dart';

class LoginControler extends GetxController {
  String? _id;

  String? get id => _id;

  Future<void> checkUser() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    _id = preferences.getString("id")?.toString();
    print("idcheck--------->$_id");
    update();
  }

  @override
  void onInit() {
    checkUser();

    super.onInit();
  }

  void loginfun(String email, String password) async {
    var url = Uri.parse("https://srcform.com/new/login");
    var response = await http.post(url, body: {
      "email": email,
      "password": password,
    });
    var responseBody = jsonDecode(response.body)["user"]["id"];
    print(responseBody);

    if (responseBody != null) {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      preferences.setString("id", responseBody!.toString());
      String? idcheck = preferences.getString("id")?.toString();
      print("idcheck===>$idcheck");
      Get.snackbar("Souk", "Login completed successfully");
      Get.offAll(HomeScreenes());
    } else {
      Get.snackbar("Souk",
          "There is a connection problem that may be due to your internet");
    }
    // checkid();
  }
}
