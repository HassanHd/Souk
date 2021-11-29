import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:souk/models/ProductList.dart';
import 'dart:convert';
import 'dart:async';
import 'package:souk/models/SubCategoriesModel.dart';
class ControllerProductList extends GetxController{
  List<ProductList> listDataModel = [];


  Future<void> fetchProductList(int id) async {
    listDataModel.clear();
    print("object");
    try {
      var url =
      Uri.parse("https://www.srcform.com/eco/subcategory/products/$id");
      print(url);
      final response = await http.get(url);
      print(response.body.toString());
      // If the call to the server was successful, parse the JSON
      var responseBody = jsonDecode(response.body)["products"];
      print(responseBody);
      for (int i = 0; i < responseBody.length; i++) {
        listDataModel.add(ProductList.fromMap(responseBody[i]));
      }
    } catch (e) {
      Get.snackbar("Souk", "$e");

    }
  }
  @override
  void onInit() {

  }
}