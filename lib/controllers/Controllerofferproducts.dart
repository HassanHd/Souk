import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:souk/models/offerproducts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
class Controllerofferproducts extends GetxController{
  List<offerproducts> listDataModel = [];
  Controllerofferproducts(){
    fetchofferproducts().then((value) => update());
  }

  Future<void> fetchofferproducts() async {
    listDataModel.clear();
    print("object");
    try {
      var url =
      Uri.parse("https://www.srcform.com/offerproducts");
      print(url);
      final response = await http.get(url);

      print(response.body.toString());
      // If the call to the server was successful, parse the JSON
      var responseBody = jsonDecode(response.body)["offers"];
      print(responseBody);
      for (int i = 0; i < responseBody.length; i++) {
        listDataModel.add(offerproducts.fromMap(responseBody[i]));
      }
    } catch (e) {
      Get.snackbar("Souk", "$e");
    }
  }
  @override
  void onInit() {

  }
}