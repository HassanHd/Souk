import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:souk/models/Category.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
class ControllerCategory extends GetxController{
  List<Category> listDataModel = [];
  ControllerCategory(){
    fetchcategory().then((value) => update());
  }

Future<void> fetchcategory() async {
    print("object");
    try {
      var url =
      Uri.parse("https://www.srcform.com/eco/category");
      print(url);
      final response = await http.get(url);

      print(response.body.toString());
      // If the call to the server was successful, parse the JSON
      var responseBody = jsonDecode(response.body)["categories"];
      print(responseBody);
      for (int i = 0; i < responseBody.length; i++) {
        listDataModel.add(Category.fromJson(responseBody[i]));
      }
    } catch (e) {
      Get.snackbar("Souk", "$e");

    }
  }
@override
  void onInit() {

  }
}