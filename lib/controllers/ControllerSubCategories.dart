import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'package:souk/models/SubCategoriesModel.dart';
class ControllerSubCategories extends GetxController{
  List<SubCategoriesModel> listDataModel = [];


  Future<void> fetchSubCategories(int id) async {
    listDataModel.clear();
    print("object");
    try {
      var url =
      Uri.parse("https://www.srcform.com/eco/subcategory/$id");
      print(url);
      final response = await http.get(url);

      print(response.body.toString());
      // If the call to the server was successful, parse the JSON
      var responseBody = jsonDecode(response.body)["subcategories"];
      print(responseBody);
      for (int i = 0; i < responseBody.length; i++) {
        listDataModel.add(SubCategoriesModel.fromMap(responseBody[i]));
      }
    } catch (e) {
      Get.snackbar("Souk", "$e");

    }
  }
  @override
  void onInit() {

  }
}